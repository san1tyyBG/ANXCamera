package com.xiaomi.camera.liveshot.util;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import com.android.camera.log.Log;
import java.util.ArrayList;
import java.util.List;

public class HandlerHelper {
    private static final String TAG = HandlerHelper.class.getSimpleName();
    private final List<ResponseReceiverHandler> mPendingMessageQueue = new ArrayList();
    private final Object mPendingMessageQueueLock = new Object();

    private static final class ObjectX {
        private final Handler handler;
        private final Object object;

        public ObjectX(Object obj, Handler handler2) {
            this.object = obj;
            this.handler = handler2;
        }
    }

    private static final class ResponseReceiverHandler extends Handler {
        /* access modifiers changed from: private */
        public final Object lock;
        public boolean releaseRequested;
        public Object reply;

        private ResponseReceiverHandler(Looper looper, Object obj) {
            super(looper);
            this.lock = obj;
        }

        public void handleMessage(Message message) {
            this.reply = message.obj;
            synchronized (this.lock) {
                this.lock.notifyAll();
            }
        }
    }

    public void release() {
        synchronized (this.mPendingMessageQueueLock) {
            for (ResponseReceiverHandler responseReceiverHandler : this.mPendingMessageQueue) {
                synchronized (responseReceiverHandler.lock) {
                    responseReceiverHandler.releaseRequested = true;
                    responseReceiverHandler.lock.notifyAll();
                }
            }
        }
    }

    public Object sendMessageAndAwaitResponse(Message message) {
        HandlerThread handlerThread = new HandlerThread("ResponseReceiverThread");
        Object obj = new Object();
        handlerThread.start();
        Object obj2 = null;
        ResponseReceiverHandler responseReceiverHandler = new ResponseReceiverHandler(handlerThread.getLooper(), obj);
        synchronized (this.mPendingMessageQueueLock) {
            this.mPendingMessageQueue.add(responseReceiverHandler);
        }
        if (message.obj != null) {
            message.obj = new ObjectX(message.obj, responseReceiverHandler);
        } else {
            message.obj = responseReceiverHandler;
        }
        message.sendToTarget();
        synchronized (obj) {
            while (obj2 == null) {
                try {
                    if (responseReceiverHandler.releaseRequested) {
                        break;
                    }
                    obj.wait(10);
                    obj2 = responseReceiverHandler.reply;
                } catch (InterruptedException e) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Interrupted: ");
                    sb.append(e);
                    Log.e(str, sb.toString());
                } catch (Throwable th) {
                    while (true) {
                        throw th;
                    }
                }
            }
        }
        handlerThread.quit();
        synchronized (this.mPendingMessageQueueLock) {
            this.mPendingMessageQueue.remove(responseReceiverHandler);
        }
        return obj2;
    }
}
