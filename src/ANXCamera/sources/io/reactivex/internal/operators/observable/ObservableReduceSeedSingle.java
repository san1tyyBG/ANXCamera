package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.BiFunction;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.plugins.RxJavaPlugins;

public final class ObservableReduceSeedSingle<T, R> extends Single<R> {
    final BiFunction<R, ? super T, R> reducer;
    final R seed;
    final ObservableSource<T> source;

    static final class ReduceSeedObserver<T, R> implements Observer<T>, Disposable {
        final SingleObserver<? super R> actual;
        Disposable d;
        final BiFunction<R, ? super T, R> reducer;
        R value;

        ReduceSeedObserver(SingleObserver<? super R> singleObserver, BiFunction<R, ? super T, R> biFunction, R r) {
            this.actual = singleObserver;
            this.value = r;
            this.reducer = biFunction;
        }

        public void dispose() {
            this.d.dispose();
        }

        public boolean isDisposed() {
            return this.d.isDisposed();
        }

        public void onComplete() {
            R r = this.value;
            this.value = null;
            if (r != null) {
                this.actual.onSuccess(r);
            }
        }

        public void onError(Throwable th) {
            R r = this.value;
            this.value = null;
            if (r != null) {
                this.actual.onError(th);
            } else {
                RxJavaPlugins.onError(th);
            }
        }

        public void onNext(T t) {
            R r = this.value;
            if (r != null) {
                try {
                    this.value = ObjectHelper.requireNonNull(this.reducer.apply(r, t), "The reducer returned a null value");
                } catch (Throwable th) {
                    Exceptions.throwIfFatal(th);
                    this.d.dispose();
                    onError(th);
                }
            }
        }

        public void onSubscribe(Disposable disposable) {
            if (DisposableHelper.validate(this.d, disposable)) {
                this.d = disposable;
                this.actual.onSubscribe(this);
            }
        }
    }

    public ObservableReduceSeedSingle(ObservableSource<T> observableSource, R r, BiFunction<R, ? super T, R> biFunction) {
        this.source = observableSource;
        this.seed = r;
        this.reducer = biFunction;
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(SingleObserver<? super R> singleObserver) {
        this.source.subscribe(new ReduceSeedObserver(singleObserver, this.reducer, this.seed));
    }
}
