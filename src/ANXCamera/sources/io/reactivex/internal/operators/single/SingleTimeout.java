package io.reactivex.internal.operators.single;

import io.reactivex.Scheduler;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReference;

public final class SingleTimeout<T> extends Single<T> {
    final SingleSource<? extends T> other;
    final Scheduler scheduler;
    final SingleSource<T> source;
    final long timeout;
    final TimeUnit unit;

    static final class TimeoutMainObserver<T> extends AtomicReference<Disposable> implements SingleObserver<T>, Disposable, Runnable {
        private static final long serialVersionUID = 37497744973048446L;
        final SingleObserver<? super T> actual;
        final TimeoutFallbackObserver<T> fallback;
        SingleSource<? extends T> other;
        final AtomicReference<Disposable> task = new AtomicReference<>();

        static final class TimeoutFallbackObserver<T> extends AtomicReference<Disposable> implements SingleObserver<T> {
            private static final long serialVersionUID = 2071387740092105509L;
            final SingleObserver<? super T> actual;

            TimeoutFallbackObserver(SingleObserver<? super T> singleObserver) {
                this.actual = singleObserver;
            }

            public void onError(Throwable th) {
                this.actual.onError(th);
            }

            public void onSubscribe(Disposable disposable) {
                DisposableHelper.setOnce(this, disposable);
            }

            public void onSuccess(T t) {
                this.actual.onSuccess(t);
            }
        }

        TimeoutMainObserver(SingleObserver<? super T> singleObserver, SingleSource<? extends T> singleSource) {
            this.actual = singleObserver;
            this.other = singleSource;
            if (singleSource != null) {
                this.fallback = new TimeoutFallbackObserver<>(singleObserver);
            } else {
                this.fallback = null;
            }
        }

        public void dispose() {
            DisposableHelper.dispose(this);
            DisposableHelper.dispose(this.task);
            if (this.fallback != null) {
                DisposableHelper.dispose(this.fallback);
            }
        }

        public boolean isDisposed() {
            return DisposableHelper.isDisposed((Disposable) get());
        }

        public void onError(Throwable th) {
            Disposable disposable = (Disposable) get();
            if (disposable == DisposableHelper.DISPOSED || !compareAndSet(disposable, DisposableHelper.DISPOSED)) {
                RxJavaPlugins.onError(th);
                return;
            }
            DisposableHelper.dispose(this.task);
            this.actual.onError(th);
        }

        public void onSubscribe(Disposable disposable) {
            DisposableHelper.setOnce(this, disposable);
        }

        public void onSuccess(T t) {
            Disposable disposable = (Disposable) get();
            if (disposable != DisposableHelper.DISPOSED && compareAndSet(disposable, DisposableHelper.DISPOSED)) {
                DisposableHelper.dispose(this.task);
                this.actual.onSuccess(t);
            }
        }

        public void run() {
            Disposable disposable = (Disposable) get();
            if (disposable != DisposableHelper.DISPOSED && compareAndSet(disposable, DisposableHelper.DISPOSED)) {
                if (disposable != null) {
                    disposable.dispose();
                }
                SingleSource<? extends T> singleSource = this.other;
                if (singleSource == null) {
                    this.actual.onError(new TimeoutException());
                    return;
                }
                this.other = null;
                singleSource.subscribe(this.fallback);
            }
        }
    }

    public SingleTimeout(SingleSource<T> singleSource, long j, TimeUnit timeUnit, Scheduler scheduler2, SingleSource<? extends T> singleSource2) {
        this.source = singleSource;
        this.timeout = j;
        this.unit = timeUnit;
        this.scheduler = scheduler2;
        this.other = singleSource2;
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(SingleObserver<? super T> singleObserver) {
        TimeoutMainObserver timeoutMainObserver = new TimeoutMainObserver(singleObserver, this.other);
        singleObserver.onSubscribe(timeoutMainObserver);
        DisposableHelper.replace(timeoutMainObserver.task, this.scheduler.scheduleDirect(timeoutMainObserver, this.timeout, this.unit));
        this.source.subscribe(timeoutMainObserver);
    }
}
