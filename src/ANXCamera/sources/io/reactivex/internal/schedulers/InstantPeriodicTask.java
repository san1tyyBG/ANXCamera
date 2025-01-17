package io.reactivex.internal.schedulers;

import io.reactivex.disposables.Disposable;
import io.reactivex.internal.functions.Functions;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.atomic.AtomicReference;

final class InstantPeriodicTask implements Disposable, Callable<Void> {
    static final FutureTask<Void> CANCELLED = new FutureTask<>(Functions.EMPTY_RUNNABLE, null);
    final ExecutorService executor;
    final AtomicReference<Future<?>> first = new AtomicReference<>();
    final AtomicReference<Future<?>> rest = new AtomicReference<>();
    Thread runner;
    final Runnable task;

    InstantPeriodicTask(Runnable runnable, ExecutorService executorService) {
        this.task = runnable;
        this.executor = executorService;
    }

    public Void call() throws Exception {
        try {
            this.runner = Thread.currentThread();
            this.task.run();
            setRest(this.executor.submit(this));
        } catch (Throwable th) {
            this.runner = null;
            throw th;
        }
        this.runner = null;
        return null;
    }

    public void dispose() {
        Future future = (Future) this.first.getAndSet(CANCELLED);
        boolean z = false;
        if (!(future == null || future == CANCELLED)) {
            future.cancel(this.runner != Thread.currentThread());
        }
        Future future2 = (Future) this.rest.getAndSet(CANCELLED);
        if (future2 != null && future2 != CANCELLED) {
            if (this.runner != Thread.currentThread()) {
                z = true;
            }
            future2.cancel(z);
        }
    }

    public boolean isDisposed() {
        return this.first.get() == CANCELLED;
    }

    /* access modifiers changed from: 0000 */
    public void setFirst(Future<?> future) {
        Future future2;
        do {
            future2 = (Future) this.first.get();
            if (future2 == CANCELLED) {
                future.cancel(this.runner != Thread.currentThread());
            }
        } while (!this.first.compareAndSet(future2, future));
    }

    /* access modifiers changed from: 0000 */
    public void setRest(Future<?> future) {
        Future future2;
        do {
            future2 = (Future) this.rest.get();
            if (future2 == CANCELLED) {
                future.cancel(this.runner != Thread.currentThread());
            }
        } while (!this.rest.compareAndSet(future2, future));
    }
}
