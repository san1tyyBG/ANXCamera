package io.reactivex.internal.util;

import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.functions.ObjectHelper;
import java.io.Serializable;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public enum NotificationLite {
    COMPLETE;

    static final class DisposableNotification implements Serializable {
        private static final long serialVersionUID = -7482590109178395495L;
        final Disposable d;

        DisposableNotification(Disposable disposable) {
            this.d = disposable;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("NotificationLite.Disposable[");
            sb.append(this.d);
            sb.append("]");
            return sb.toString();
        }
    }

    static final class ErrorNotification implements Serializable {
        private static final long serialVersionUID = -8759979445933046293L;
        final Throwable e;

        ErrorNotification(Throwable th) {
            this.e = th;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof ErrorNotification)) {
                return false;
            }
            return ObjectHelper.equals(this.e, ((ErrorNotification) obj).e);
        }

        public int hashCode() {
            return this.e.hashCode();
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("NotificationLite.Error[");
            sb.append(this.e);
            sb.append("]");
            return sb.toString();
        }
    }

    static final class SubscriptionNotification implements Serializable {
        private static final long serialVersionUID = -1322257508628817540L;
        final Subscription s;

        SubscriptionNotification(Subscription subscription) {
            this.s = subscription;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("NotificationLite.Subscription[");
            sb.append(this.s);
            sb.append("]");
            return sb.toString();
        }
    }

    public static <T> boolean accept(Object obj, Observer<? super T> observer) {
        if (obj == COMPLETE) {
            observer.onComplete();
            return true;
        } else if (obj instanceof ErrorNotification) {
            observer.onError(((ErrorNotification) obj).e);
            return true;
        } else {
            observer.onNext(obj);
            return false;
        }
    }

    public static <T> boolean accept(Object obj, Subscriber<? super T> subscriber) {
        if (obj == COMPLETE) {
            subscriber.onComplete();
            return true;
        } else if (obj instanceof ErrorNotification) {
            subscriber.onError(((ErrorNotification) obj).e);
            return true;
        } else {
            subscriber.onNext(obj);
            return false;
        }
    }

    public static <T> boolean acceptFull(Object obj, Observer<? super T> observer) {
        if (obj == COMPLETE) {
            observer.onComplete();
            return true;
        } else if (obj instanceof ErrorNotification) {
            observer.onError(((ErrorNotification) obj).e);
            return true;
        } else if (obj instanceof DisposableNotification) {
            observer.onSubscribe(((DisposableNotification) obj).d);
            return false;
        } else {
            observer.onNext(obj);
            return false;
        }
    }

    public static <T> boolean acceptFull(Object obj, Subscriber<? super T> subscriber) {
        if (obj == COMPLETE) {
            subscriber.onComplete();
            return true;
        } else if (obj instanceof ErrorNotification) {
            subscriber.onError(((ErrorNotification) obj).e);
            return true;
        } else if (obj instanceof SubscriptionNotification) {
            subscriber.onSubscribe(((SubscriptionNotification) obj).s);
            return false;
        } else {
            subscriber.onNext(obj);
            return false;
        }
    }

    public static Object complete() {
        return COMPLETE;
    }

    public static Object disposable(Disposable disposable) {
        return new DisposableNotification(disposable);
    }

    public static Object error(Throwable th) {
        return new ErrorNotification(th);
    }

    public static Disposable getDisposable(Object obj) {
        return ((DisposableNotification) obj).d;
    }

    public static Throwable getError(Object obj) {
        return ((ErrorNotification) obj).e;
    }

    public static Subscription getSubscription(Object obj) {
        return ((SubscriptionNotification) obj).s;
    }

    public static <T> T getValue(Object obj) {
        return obj;
    }

    public static boolean isComplete(Object obj) {
        return obj == COMPLETE;
    }

    public static boolean isDisposable(Object obj) {
        return obj instanceof DisposableNotification;
    }

    public static boolean isError(Object obj) {
        return obj instanceof ErrorNotification;
    }

    public static boolean isSubscription(Object obj) {
        return obj instanceof SubscriptionNotification;
    }

    public static <T> Object next(T t) {
        return t;
    }

    public static Object subscription(Subscription subscription) {
        return new SubscriptionNotification(subscription);
    }

    public String toString() {
        return "NotificationLite.Complete";
    }
}
