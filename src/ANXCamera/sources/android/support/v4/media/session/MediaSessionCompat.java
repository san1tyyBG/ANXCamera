package android.support.v4.media.session;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.os.RemoteCallbackList;
import android.os.RemoteException;
import android.os.ResultReceiver;
import android.support.v4.media.MediaDescriptionCompat;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.RatingCompat;
import android.support.v4.media.VolumeProviderCompat;
import android.support.v4.media.session.IMediaSession.Stub;
import android.text.TextUtils;
import android.view.KeyEvent;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MediaSessionCompat {
    public static final int FLAG_HANDLES_MEDIA_BUTTONS = 1;
    public static final int FLAG_HANDLES_TRANSPORT_CONTROLS = 2;
    private final ArrayList<OnActiveChangeListener> mActiveListeners = new ArrayList<>();
    private final MediaControllerCompat mController;
    private final MediaSessionImpl mImpl;

    public static abstract class Callback {
        final Object mCallbackObj;

        private class StubApi21 implements android.support.v4.media.session.MediaSessionCompatApi21.Callback {
            private StubApi21() {
            }

            public void onCommand(String command, Bundle extras, ResultReceiver cb) {
                Callback.this.onCommand(command, extras, cb);
            }

            public boolean onMediaButtonEvent(Intent mediaButtonIntent) {
                return Callback.this.onMediaButtonEvent(mediaButtonIntent);
            }

            public void onPlay() {
                Callback.this.onPlay();
            }

            public void onPlayFromMediaId(String mediaId, Bundle extras) {
                Callback.this.onPlayFromMediaId(mediaId, extras);
            }

            public void onPlayFromSearch(String search, Bundle extras) {
                Callback.this.onPlayFromSearch(search, extras);
            }

            public void onSkipToQueueItem(long id) {
                Callback.this.onSkipToQueueItem(id);
            }

            public void onPause() {
                Callback.this.onPause();
            }

            public void onSkipToNext() {
                Callback.this.onSkipToNext();
            }

            public void onSkipToPrevious() {
                Callback.this.onSkipToPrevious();
            }

            public void onFastForward() {
                Callback.this.onFastForward();
            }

            public void onRewind() {
                Callback.this.onRewind();
            }

            public void onStop() {
                Callback.this.onStop();
            }

            public void onSeekTo(long pos) {
                Callback.this.onSeekTo(pos);
            }

            public void onSetRating(Object ratingObj) {
                Callback.this.onSetRating(RatingCompat.fromRating(ratingObj));
            }

            public void onCustomAction(String action, Bundle extras) {
                Callback.this.onCustomAction(action, extras);
            }
        }

        private class StubApi23 extends StubApi21 implements android.support.v4.media.session.MediaSessionCompatApi23.Callback {
            private StubApi23() {
                super();
            }

            public void onPlayFromUri(Uri uri, Bundle extras) {
                Callback.this.onPlayFromUri(uri, extras);
            }
        }

        public Callback() {
            if (VERSION.SDK_INT >= 23) {
                this.mCallbackObj = MediaSessionCompatApi23.createCallback(new StubApi23());
            } else if (VERSION.SDK_INT >= 21) {
                this.mCallbackObj = MediaSessionCompatApi21.createCallback(new StubApi21());
            } else {
                this.mCallbackObj = null;
            }
        }

        public void onCommand(String command, Bundle extras, ResultReceiver cb) {
        }

        public boolean onMediaButtonEvent(Intent mediaButtonEvent) {
            return false;
        }

        public void onPlay() {
        }

        public void onPlayFromMediaId(String mediaId, Bundle extras) {
        }

        public void onPlayFromSearch(String query, Bundle extras) {
        }

        public void onPlayFromUri(Uri uri, Bundle extras) {
        }

        public void onSkipToQueueItem(long id) {
        }

        public void onPause() {
        }

        public void onSkipToNext() {
        }

        public void onSkipToPrevious() {
        }

        public void onFastForward() {
        }

        public void onRewind() {
        }

        public void onStop() {
        }

        public void onSeekTo(long pos) {
        }

        public void onSetRating(RatingCompat rating) {
        }

        public void onCustomAction(String action, Bundle extras) {
        }
    }

    interface MediaSessionImpl {
        Object getMediaSession();

        Object getRemoteControlClient();

        Token getSessionToken();

        boolean isActive();

        void release();

        void sendSessionEvent(String str, Bundle bundle);

        void setActive(boolean z);

        void setCallback(Callback callback, Handler handler);

        void setExtras(Bundle bundle);

        void setFlags(int i);

        void setMediaButtonReceiver(PendingIntent pendingIntent);

        void setMetadata(MediaMetadataCompat mediaMetadataCompat);

        void setPlaybackState(PlaybackStateCompat playbackStateCompat);

        void setPlaybackToLocal(int i);

        void setPlaybackToRemote(VolumeProviderCompat volumeProviderCompat);

        void setQueue(List<QueueItem> list);

        void setQueueTitle(CharSequence charSequence);

        void setRatingType(int i);

        void setSessionActivity(PendingIntent pendingIntent);
    }

    static class MediaSessionImplApi21 implements MediaSessionImpl {
        private PendingIntent mMediaButtonIntent;
        private final Object mSessionObj;
        private final Token mToken = new Token(MediaSessionCompatApi21.getSessionToken(this.mSessionObj));

        public MediaSessionImplApi21(Context context, String tag) {
            this.mSessionObj = MediaSessionCompatApi21.createSession(context, tag);
        }

        public MediaSessionImplApi21(Object mediaSession) {
            this.mSessionObj = MediaSessionCompatApi21.verifySession(mediaSession);
        }

        public void setCallback(Callback callback, Handler handler) {
            MediaSessionCompatApi21.setCallback(this.mSessionObj, callback.mCallbackObj, handler);
        }

        public void setFlags(int flags) {
            MediaSessionCompatApi21.setFlags(this.mSessionObj, flags);
        }

        public void setPlaybackToLocal(int stream) {
            MediaSessionCompatApi21.setPlaybackToLocal(this.mSessionObj, stream);
        }

        public void setPlaybackToRemote(VolumeProviderCompat volumeProvider) {
            MediaSessionCompatApi21.setPlaybackToRemote(this.mSessionObj, volumeProvider.getVolumeProvider());
        }

        public void setActive(boolean active) {
            MediaSessionCompatApi21.setActive(this.mSessionObj, active);
        }

        public boolean isActive() {
            return MediaSessionCompatApi21.isActive(this.mSessionObj);
        }

        public void sendSessionEvent(String event, Bundle extras) {
            MediaSessionCompatApi21.sendSessionEvent(this.mSessionObj, event, extras);
        }

        public void release() {
            MediaSessionCompatApi21.release(this.mSessionObj);
        }

        public Token getSessionToken() {
            return this.mToken;
        }

        public void setPlaybackState(PlaybackStateCompat state) {
            MediaSessionCompatApi21.setPlaybackState(this.mSessionObj, state.getPlaybackState());
        }

        public void setMetadata(MediaMetadataCompat metadata) {
            MediaSessionCompatApi21.setMetadata(this.mSessionObj, metadata.getMediaMetadata());
        }

        public void setSessionActivity(PendingIntent pi) {
            MediaSessionCompatApi21.setSessionActivity(this.mSessionObj, pi);
        }

        public void setMediaButtonReceiver(PendingIntent mbr) {
            this.mMediaButtonIntent = mbr;
            MediaSessionCompatApi21.setMediaButtonReceiver(this.mSessionObj, mbr);
        }

        public void setQueue(List<QueueItem> queue) {
            List<Object> queueObjs = null;
            if (queue != null) {
                queueObjs = new ArrayList<>();
                for (QueueItem item : queue) {
                    queueObjs.add(item.getQueueItem());
                }
            }
            MediaSessionCompatApi21.setQueue(this.mSessionObj, queueObjs);
        }

        public void setQueueTitle(CharSequence title) {
            MediaSessionCompatApi21.setQueueTitle(this.mSessionObj, title);
        }

        public void setRatingType(int type) {
            if (VERSION.SDK_INT >= 22) {
                MediaSessionCompatApi22.setRatingType(this.mSessionObj, type);
            }
        }

        public void setExtras(Bundle extras) {
            MediaSessionCompatApi21.setExtras(this.mSessionObj, extras);
        }

        public Object getMediaSession() {
            return this.mSessionObj;
        }

        public Object getRemoteControlClient() {
            return null;
        }
    }

    static class MediaSessionImplBase implements MediaSessionImpl {
        /* access modifiers changed from: private */
        public final AudioManager mAudioManager;
        /* access modifiers changed from: private */
        public Callback mCallback;
        private final ComponentName mComponentName;
        private final Context mContext;
        /* access modifiers changed from: private */
        public final RemoteCallbackList<IMediaControllerCallback> mControllerCallbacks = new RemoteCallbackList<>();
        /* access modifiers changed from: private */
        public boolean mDestroyed = false;
        /* access modifiers changed from: private */
        public Bundle mExtras;
        /* access modifiers changed from: private */
        public int mFlags;
        /* access modifiers changed from: private */
        public final MessageHandler mHandler;
        private boolean mIsActive = false;
        private boolean mIsMbrRegistered = false;
        private boolean mIsRccRegistered = false;
        /* access modifiers changed from: private */
        public int mLocalStream;
        /* access modifiers changed from: private */
        public final Object mLock = new Object();
        private final PendingIntent mMediaButtonEventReceiver;
        /* access modifiers changed from: private */
        public MediaMetadataCompat mMetadata;
        /* access modifiers changed from: private */
        public final String mPackageName;
        /* access modifiers changed from: private */
        public List<QueueItem> mQueue;
        /* access modifiers changed from: private */
        public CharSequence mQueueTitle;
        /* access modifiers changed from: private */
        public int mRatingType;
        private final Object mRccObj;
        /* access modifiers changed from: private */
        public PendingIntent mSessionActivity;
        /* access modifiers changed from: private */
        public PlaybackStateCompat mState;
        private final MediaSessionStub mStub;
        /* access modifiers changed from: private */
        public final String mTag;
        private final Token mToken;
        private android.support.v4.media.VolumeProviderCompat.Callback mVolumeCallback = new android.support.v4.media.VolumeProviderCompat.Callback() {
            public void onVolumeChanged(VolumeProviderCompat volumeProvider) {
                if (MediaSessionImplBase.this.mVolumeProvider == volumeProvider) {
                    ParcelableVolumeInfo parcelableVolumeInfo = new ParcelableVolumeInfo(MediaSessionImplBase.this.mVolumeType, MediaSessionImplBase.this.mLocalStream, volumeProvider.getVolumeControl(), volumeProvider.getMaxVolume(), volumeProvider.getCurrentVolume());
                    MediaSessionImplBase.this.sendVolumeInfoChanged(parcelableVolumeInfo);
                }
            }
        };
        /* access modifiers changed from: private */
        public VolumeProviderCompat mVolumeProvider;
        /* access modifiers changed from: private */
        public int mVolumeType;

        private static final class Command {
            public final String command;
            public final Bundle extras;
            public final ResultReceiver stub;

            public Command(String command2, Bundle extras2, ResultReceiver stub2) {
                this.command = command2;
                this.extras = extras2;
                this.stub = stub2;
            }
        }

        class MediaSessionStub extends Stub {
            MediaSessionStub() {
            }

            public void sendCommand(String command, Bundle args, ResultReceiverWrapper cb) {
                MediaSessionImplBase.this.mHandler.post(15, new Command(command, args, cb.mResultReceiver));
            }

            public boolean sendMediaButton(KeyEvent mediaButton) {
                boolean z = true;
                if ((MediaSessionImplBase.this.mFlags & 1) == 0) {
                    z = false;
                }
                boolean handlesMediaButtons = z;
                if (handlesMediaButtons) {
                    MediaSessionImplBase.this.mHandler.post(14, mediaButton);
                }
                return handlesMediaButtons;
            }

            public void registerCallbackListener(IMediaControllerCallback cb) {
                if (MediaSessionImplBase.this.mDestroyed) {
                    try {
                        cb.onSessionDestroyed();
                    } catch (Exception e) {
                    }
                } else {
                    MediaSessionImplBase.this.mControllerCallbacks.register(cb);
                }
            }

            public void unregisterCallbackListener(IMediaControllerCallback cb) {
                MediaSessionImplBase.this.mControllerCallbacks.unregister(cb);
            }

            public String getPackageName() {
                return MediaSessionImplBase.this.mPackageName;
            }

            public String getTag() {
                return MediaSessionImplBase.this.mTag;
            }

            public PendingIntent getLaunchPendingIntent() {
                PendingIntent access$1500;
                synchronized (MediaSessionImplBase.this.mLock) {
                    access$1500 = MediaSessionImplBase.this.mSessionActivity;
                }
                return access$1500;
            }

            public long getFlags() {
                long access$900;
                synchronized (MediaSessionImplBase.this.mLock) {
                    access$900 = (long) MediaSessionImplBase.this.mFlags;
                }
                return access$900;
            }

            public ParcelableVolumeInfo getVolumeAttributes() {
                boolean z;
                int stream;
                int controlType;
                int max;
                int current;
                int current2;
                synchronized (MediaSessionImplBase.this.mLock) {
                    try {
                        int volumeType = MediaSessionImplBase.this.mVolumeType;
                        try {
                            stream = MediaSessionImplBase.this.mLocalStream;
                        } catch (Throwable th) {
                            th = th;
                            z = false;
                            int stream2 = z;
                            while (true) {
                                try {
                                    break;
                                } catch (Throwable th2) {
                                    th = th2;
                                }
                            }
                            throw th;
                        }
                        try {
                            VolumeProviderCompat vp = MediaSessionImplBase.this.mVolumeProvider;
                            if (volumeType == 2) {
                                controlType = vp.getVolumeControl();
                                try {
                                    try {
                                        current = vp.getCurrentVolume();
                                        current2 = controlType;
                                        max = vp.getMaxVolume();
                                    } catch (Throwable th3) {
                                        th = th3;
                                        while (true) {
                                            break;
                                        }
                                        throw th;
                                    }
                                } catch (Throwable th4) {
                                    th = th4;
                                    while (true) {
                                        break;
                                    }
                                    throw th;
                                }
                            } else {
                                controlType = 2;
                                current2 = 2;
                                max = MediaSessionImplBase.this.mAudioManager.getStreamMaxVolume(stream);
                                current = MediaSessionImplBase.this.mAudioManager.getStreamVolume(stream);
                            }
                            try {
                                ParcelableVolumeInfo parcelableVolumeInfo = new ParcelableVolumeInfo(volumeType, stream, current2, max, current);
                                return parcelableVolumeInfo;
                            } catch (Throwable th5) {
                                th = th5;
                                int i = max;
                                while (true) {
                                    break;
                                }
                                throw th;
                            }
                        } catch (Throwable th6) {
                            th = th6;
                            while (true) {
                                break;
                            }
                            throw th;
                        }
                    } catch (Throwable th7) {
                        th = th7;
                        z = false;
                        int stream22 = z;
                        while (true) {
                            break;
                        }
                        throw th;
                    }
                }
            }

            public void adjustVolume(int direction, int flags, String packageName) {
                MediaSessionImplBase.this.adjustVolume(direction, flags);
            }

            public void setVolumeTo(int value, int flags, String packageName) {
                MediaSessionImplBase.this.setVolumeTo(value, flags);
            }

            public void play() throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(1);
            }

            public void playFromMediaId(String mediaId, Bundle extras) throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(2, (Object) mediaId, extras);
            }

            public void playFromSearch(String query, Bundle extras) throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(3, (Object) query, extras);
            }

            public void playFromUri(Uri uri, Bundle extras) throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(18, (Object) uri, extras);
            }

            public void skipToQueueItem(long id) {
                MediaSessionImplBase.this.mHandler.post(4, Long.valueOf(id));
            }

            public void pause() throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(5);
            }

            public void stop() throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(6);
            }

            public void next() throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(7);
            }

            public void previous() throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(8);
            }

            public void fastForward() throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(9);
            }

            public void rewind() throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(10);
            }

            public void seekTo(long pos) throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(11, Long.valueOf(pos));
            }

            public void rate(RatingCompat rating) throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(12, rating);
            }

            public void sendCustomAction(String action, Bundle args) throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(13, (Object) action, args);
            }

            public MediaMetadataCompat getMetadata() {
                return MediaSessionImplBase.this.mMetadata;
            }

            public PlaybackStateCompat getPlaybackState() {
                return MediaSessionImplBase.this.getStateWithUpdatedPosition();
            }

            public List<QueueItem> getQueue() {
                List<QueueItem> access$2100;
                synchronized (MediaSessionImplBase.this.mLock) {
                    access$2100 = MediaSessionImplBase.this.mQueue;
                }
                return access$2100;
            }

            public CharSequence getQueueTitle() {
                return MediaSessionImplBase.this.mQueueTitle;
            }

            public Bundle getExtras() {
                Bundle access$2300;
                synchronized (MediaSessionImplBase.this.mLock) {
                    access$2300 = MediaSessionImplBase.this.mExtras;
                }
                return access$2300;
            }

            public int getRatingType() {
                return MediaSessionImplBase.this.mRatingType;
            }

            public boolean isTransportControlEnabled() {
                return (MediaSessionImplBase.this.mFlags & 2) != 0;
            }
        }

        private class MessageHandler extends Handler {
            private static final int KEYCODE_MEDIA_PAUSE = 127;
            private static final int KEYCODE_MEDIA_PLAY = 126;
            private static final int MSG_ADJUST_VOLUME = 16;
            private static final int MSG_COMMAND = 15;
            private static final int MSG_CUSTOM_ACTION = 13;
            private static final int MSG_FAST_FORWARD = 9;
            private static final int MSG_MEDIA_BUTTON = 14;
            private static final int MSG_NEXT = 7;
            private static final int MSG_PAUSE = 5;
            private static final int MSG_PLAY = 1;
            private static final int MSG_PLAY_MEDIA_ID = 2;
            private static final int MSG_PLAY_SEARCH = 3;
            private static final int MSG_PLAY_URI = 18;
            private static final int MSG_PREVIOUS = 8;
            private static final int MSG_RATE = 12;
            private static final int MSG_REWIND = 10;
            private static final int MSG_SEEK_TO = 11;
            private static final int MSG_SET_VOLUME = 17;
            private static final int MSG_SKIP_TO_ITEM = 4;
            private static final int MSG_STOP = 6;

            public MessageHandler(Looper looper) {
                super(looper);
            }

            public void post(int what, Object obj, Bundle bundle) {
                Message msg = obtainMessage(what, obj);
                msg.setData(bundle);
                msg.sendToTarget();
            }

            public void post(int what, Object obj) {
                obtainMessage(what, obj).sendToTarget();
            }

            public void post(int what) {
                post(what, null);
            }

            public void post(int what, Object obj, int arg1) {
                obtainMessage(what, arg1, 0, obj).sendToTarget();
            }

            public void handleMessage(Message msg) {
                if (MediaSessionImplBase.this.mCallback != null) {
                    switch (msg.what) {
                        case 1:
                            MediaSessionImplBase.this.mCallback.onPlay();
                            break;
                        case 2:
                            MediaSessionImplBase.this.mCallback.onPlayFromMediaId((String) msg.obj, msg.getData());
                            break;
                        case 3:
                            MediaSessionImplBase.this.mCallback.onPlayFromSearch((String) msg.obj, msg.getData());
                            break;
                        case 4:
                            MediaSessionImplBase.this.mCallback.onSkipToQueueItem(((Long) msg.obj).longValue());
                            break;
                        case 5:
                            MediaSessionImplBase.this.mCallback.onPause();
                            break;
                        case 6:
                            MediaSessionImplBase.this.mCallback.onStop();
                            break;
                        case 7:
                            MediaSessionImplBase.this.mCallback.onSkipToNext();
                            break;
                        case 8:
                            MediaSessionImplBase.this.mCallback.onSkipToPrevious();
                            break;
                        case 9:
                            MediaSessionImplBase.this.mCallback.onFastForward();
                            break;
                        case 10:
                            MediaSessionImplBase.this.mCallback.onRewind();
                            break;
                        case 11:
                            MediaSessionImplBase.this.mCallback.onSeekTo(((Long) msg.obj).longValue());
                            break;
                        case 12:
                            MediaSessionImplBase.this.mCallback.onSetRating((RatingCompat) msg.obj);
                            break;
                        case 13:
                            MediaSessionImplBase.this.mCallback.onCustomAction((String) msg.obj, msg.getData());
                            break;
                        case 14:
                            KeyEvent keyEvent = (KeyEvent) msg.obj;
                            Intent intent = new Intent("android.intent.action.MEDIA_BUTTON");
                            intent.putExtra("android.intent.extra.KEY_EVENT", keyEvent);
                            if (!MediaSessionImplBase.this.mCallback.onMediaButtonEvent(intent)) {
                                onMediaButtonEvent(keyEvent);
                                break;
                            }
                            break;
                        case 15:
                            Command cmd = (Command) msg.obj;
                            MediaSessionImplBase.this.mCallback.onCommand(cmd.command, cmd.extras, cmd.stub);
                            break;
                        case 16:
                            MediaSessionImplBase.this.adjustVolume(((Integer) msg.obj).intValue(), 0);
                            break;
                        case 17:
                            MediaSessionImplBase.this.setVolumeTo(((Integer) msg.obj).intValue(), 0);
                            break;
                        case 18:
                            MediaSessionImplBase.this.mCallback.onPlayFromUri((Uri) msg.obj, msg.getData());
                            break;
                    }
                }
            }

            private void onMediaButtonEvent(KeyEvent ke) {
                if (ke != null && ke.getAction() == 0) {
                    long validActions = MediaSessionImplBase.this.mState == null ? 0 : MediaSessionImplBase.this.mState.getActions();
                    int keyCode = ke.getKeyCode();
                    if (keyCode != 79) {
                        switch (keyCode) {
                            case 85:
                                break;
                            case 86:
                                if ((1 & validActions) != 0) {
                                    MediaSessionImplBase.this.mCallback.onStop();
                                    break;
                                }
                                break;
                            case 87:
                                if ((32 & validActions) != 0) {
                                    MediaSessionImplBase.this.mCallback.onSkipToNext();
                                    break;
                                }
                                break;
                            case 88:
                                if ((16 & validActions) != 0) {
                                    MediaSessionImplBase.this.mCallback.onSkipToPrevious();
                                    break;
                                }
                                break;
                            case 89:
                                if ((8 & validActions) != 0) {
                                    MediaSessionImplBase.this.mCallback.onRewind();
                                    break;
                                }
                                break;
                            case 90:
                                if ((64 & validActions) != 0) {
                                    MediaSessionImplBase.this.mCallback.onFastForward();
                                    break;
                                }
                                break;
                            default:
                                switch (keyCode) {
                                    case 126:
                                        if ((4 & validActions) != 0) {
                                            MediaSessionImplBase.this.mCallback.onPlay();
                                            break;
                                        }
                                        break;
                                    case 127:
                                        if ((2 & validActions) != 0) {
                                            MediaSessionImplBase.this.mCallback.onPause();
                                            break;
                                        }
                                        break;
                                }
                        }
                    }
                    boolean z = false;
                    boolean isPlaying = MediaSessionImplBase.this.mState != null && MediaSessionImplBase.this.mState.getState() == 3;
                    boolean canPlay = (516 & validActions) != 0;
                    if ((514 & validActions) != 0) {
                        z = true;
                    }
                    boolean canPause = z;
                    if (!isPlaying || !canPause) {
                        if (!isPlaying && canPlay) {
                            MediaSessionImplBase.this.mCallback.onPlay();
                        }
                    }
                    MediaSessionImplBase.this.mCallback.onPause();
                }
            }
        }

        public MediaSessionImplBase(Context context, String tag, ComponentName mbrComponent, PendingIntent mbr) {
            if (mbrComponent != null) {
                this.mContext = context;
                this.mPackageName = context.getPackageName();
                this.mAudioManager = (AudioManager) context.getSystemService("audio");
                this.mTag = tag;
                this.mComponentName = mbrComponent;
                this.mMediaButtonEventReceiver = mbr;
                this.mStub = new MediaSessionStub();
                this.mToken = new Token(this.mStub);
                this.mHandler = new MessageHandler(Looper.myLooper());
                this.mRatingType = 0;
                this.mVolumeType = 1;
                this.mLocalStream = 3;
                if (VERSION.SDK_INT >= 14) {
                    this.mRccObj = MediaSessionCompatApi14.createRemoteControlClient(mbr);
                } else {
                    this.mRccObj = null;
                }
            } else {
                throw new IllegalArgumentException("MediaButtonReceiver component may not be null.");
            }
        }

        public void setCallback(final Callback callback, Handler handler) {
            if (callback != this.mCallback) {
                if (callback == null || VERSION.SDK_INT < 18) {
                    if (VERSION.SDK_INT >= 18) {
                        MediaSessionCompatApi18.setOnPlaybackPositionUpdateListener(this.mRccObj, null);
                    }
                    if (VERSION.SDK_INT >= 19) {
                        MediaSessionCompatApi19.setOnMetadataUpdateListener(this.mRccObj, null);
                    }
                } else {
                    if (handler == null) {
                        new Handler();
                    }
                    android.support.v4.media.session.MediaSessionCompatApi14.Callback cb14 = new android.support.v4.media.session.MediaSessionCompatApi14.Callback() {
                        public void onStop() {
                            callback.onStop();
                        }

                        public void onSkipToPrevious() {
                            callback.onSkipToPrevious();
                        }

                        public void onSkipToNext() {
                            callback.onSkipToNext();
                        }

                        public void onSetRating(Object ratingObj) {
                            callback.onSetRating(RatingCompat.fromRating(ratingObj));
                        }

                        public void onSeekTo(long pos) {
                            callback.onSeekTo(pos);
                        }

                        public void onRewind() {
                            callback.onRewind();
                        }

                        public void onPlay() {
                            callback.onPlay();
                        }

                        public void onPause() {
                            callback.onPause();
                        }

                        public boolean onMediaButtonEvent(Intent mediaButtonIntent) {
                            return callback.onMediaButtonEvent(mediaButtonIntent);
                        }

                        public void onFastForward() {
                            callback.onFastForward();
                        }

                        public void onCommand(String command, Bundle extras, ResultReceiver cb) {
                            callback.onCommand(command, extras, cb);
                        }
                    };
                    if (VERSION.SDK_INT >= 18) {
                        MediaSessionCompatApi18.setOnPlaybackPositionUpdateListener(this.mRccObj, MediaSessionCompatApi18.createPlaybackPositionUpdateListener(cb14));
                    }
                    if (VERSION.SDK_INT >= 19) {
                        MediaSessionCompatApi19.setOnMetadataUpdateListener(this.mRccObj, MediaSessionCompatApi19.createMetadataUpdateListener(cb14));
                    }
                }
                this.mCallback = callback;
            }
        }

        public void setFlags(int flags) {
            synchronized (this.mLock) {
                this.mFlags = flags;
            }
            update();
        }

        public void setPlaybackToLocal(int stream) {
            if (this.mVolumeProvider != null) {
                this.mVolumeProvider.setCallback(null);
            }
            this.mVolumeType = 1;
            ParcelableVolumeInfo parcelableVolumeInfo = new ParcelableVolumeInfo(this.mVolumeType, this.mLocalStream, 2, this.mAudioManager.getStreamMaxVolume(this.mLocalStream), this.mAudioManager.getStreamVolume(this.mLocalStream));
            sendVolumeInfoChanged(parcelableVolumeInfo);
        }

        public void setPlaybackToRemote(VolumeProviderCompat volumeProvider) {
            if (volumeProvider != null) {
                if (this.mVolumeProvider != null) {
                    this.mVolumeProvider.setCallback(null);
                }
                this.mVolumeType = 2;
                this.mVolumeProvider = volumeProvider;
                ParcelableVolumeInfo parcelableVolumeInfo = new ParcelableVolumeInfo(this.mVolumeType, this.mLocalStream, this.mVolumeProvider.getVolumeControl(), this.mVolumeProvider.getMaxVolume(), this.mVolumeProvider.getCurrentVolume());
                sendVolumeInfoChanged(parcelableVolumeInfo);
                volumeProvider.setCallback(this.mVolumeCallback);
                return;
            }
            throw new IllegalArgumentException("volumeProvider may not be null");
        }

        public void setActive(boolean active) {
            if (active != this.mIsActive) {
                this.mIsActive = active;
                if (update()) {
                    setMetadata(this.mMetadata);
                    setPlaybackState(this.mState);
                }
            }
        }

        public boolean isActive() {
            return this.mIsActive;
        }

        public void sendSessionEvent(String event, Bundle extras) {
            sendEvent(event, extras);
        }

        public void release() {
            this.mIsActive = false;
            this.mDestroyed = true;
            update();
            sendSessionDestroyed();
        }

        public Token getSessionToken() {
            return this.mToken;
        }

        public void setPlaybackState(PlaybackStateCompat state) {
            synchronized (this.mLock) {
                this.mState = state;
            }
            sendState(state);
            if (this.mIsActive) {
                if (state != null) {
                    if (VERSION.SDK_INT >= 18) {
                        MediaSessionCompatApi18.setState(this.mRccObj, state.getState(), state.getPosition(), state.getPlaybackSpeed(), state.getLastPositionUpdateTime());
                    } else if (VERSION.SDK_INT >= 14) {
                        MediaSessionCompatApi14.setState(this.mRccObj, state.getState());
                    }
                    if (VERSION.SDK_INT >= 19) {
                        MediaSessionCompatApi19.setTransportControlFlags(this.mRccObj, state.getActions());
                    } else if (VERSION.SDK_INT >= 18) {
                        MediaSessionCompatApi18.setTransportControlFlags(this.mRccObj, state.getActions());
                    } else if (VERSION.SDK_INT >= 14) {
                        MediaSessionCompatApi14.setTransportControlFlags(this.mRccObj, state.getActions());
                    }
                } else if (VERSION.SDK_INT >= 14) {
                    MediaSessionCompatApi14.setState(this.mRccObj, 0);
                    MediaSessionCompatApi14.setTransportControlFlags(this.mRccObj, 0);
                }
            }
        }

        public void setMetadata(MediaMetadataCompat metadata) {
            synchronized (this.mLock) {
                this.mMetadata = metadata;
            }
            sendMetadata(metadata);
            if (this.mIsActive) {
                Bundle bundle = null;
                if (VERSION.SDK_INT >= 19) {
                    Object obj = this.mRccObj;
                    if (metadata != null) {
                        bundle = metadata.getBundle();
                    }
                    MediaSessionCompatApi19.setMetadata(obj, bundle, this.mState == null ? 0 : this.mState.getActions());
                } else if (VERSION.SDK_INT >= 14) {
                    Object obj2 = this.mRccObj;
                    if (metadata != null) {
                        bundle = metadata.getBundle();
                    }
                    MediaSessionCompatApi14.setMetadata(obj2, bundle);
                }
            }
        }

        public void setSessionActivity(PendingIntent pi) {
            synchronized (this.mLock) {
                this.mSessionActivity = pi;
            }
        }

        public void setMediaButtonReceiver(PendingIntent mbr) {
        }

        public void setQueue(List<QueueItem> queue) {
            this.mQueue = queue;
            sendQueue(queue);
        }

        public void setQueueTitle(CharSequence title) {
            this.mQueueTitle = title;
            sendQueueTitle(title);
        }

        public Object getMediaSession() {
            return null;
        }

        public Object getRemoteControlClient() {
            return this.mRccObj;
        }

        public void setRatingType(int type) {
            this.mRatingType = type;
        }

        public void setExtras(Bundle extras) {
            this.mExtras = extras;
        }

        private boolean update() {
            if (this.mIsActive) {
                if (VERSION.SDK_INT >= 8) {
                    if (!this.mIsMbrRegistered && (this.mFlags & 1) != 0) {
                        if (VERSION.SDK_INT >= 18) {
                            MediaSessionCompatApi18.registerMediaButtonEventReceiver(this.mContext, this.mMediaButtonEventReceiver);
                        } else {
                            MediaSessionCompatApi8.registerMediaButtonEventReceiver(this.mContext, this.mComponentName);
                        }
                        this.mIsMbrRegistered = true;
                    } else if (this.mIsMbrRegistered && (this.mFlags & 1) == 0) {
                        if (VERSION.SDK_INT >= 18) {
                            MediaSessionCompatApi18.unregisterMediaButtonEventReceiver(this.mContext, this.mMediaButtonEventReceiver);
                        } else {
                            MediaSessionCompatApi8.unregisterMediaButtonEventReceiver(this.mContext, this.mComponentName);
                        }
                        this.mIsMbrRegistered = false;
                    }
                }
                if (VERSION.SDK_INT < 14) {
                    return false;
                }
                if (!this.mIsRccRegistered && (this.mFlags & 2) != 0) {
                    MediaSessionCompatApi14.registerRemoteControlClient(this.mContext, this.mRccObj);
                    this.mIsRccRegistered = true;
                    return true;
                } else if (!this.mIsRccRegistered || (this.mFlags & 2) != 0) {
                    return false;
                } else {
                    MediaSessionCompatApi14.setState(this.mRccObj, 0);
                    MediaSessionCompatApi14.unregisterRemoteControlClient(this.mContext, this.mRccObj);
                    this.mIsRccRegistered = false;
                    return false;
                }
            } else {
                if (this.mIsMbrRegistered) {
                    if (VERSION.SDK_INT >= 18) {
                        MediaSessionCompatApi18.unregisterMediaButtonEventReceiver(this.mContext, this.mMediaButtonEventReceiver);
                    } else {
                        MediaSessionCompatApi8.unregisterMediaButtonEventReceiver(this.mContext, this.mComponentName);
                    }
                    this.mIsMbrRegistered = false;
                }
                if (!this.mIsRccRegistered) {
                    return false;
                }
                MediaSessionCompatApi14.setState(this.mRccObj, 0);
                MediaSessionCompatApi14.unregisterRemoteControlClient(this.mContext, this.mRccObj);
                this.mIsRccRegistered = false;
                return false;
            }
        }

        /* access modifiers changed from: private */
        public void adjustVolume(int direction, int flags) {
            if (this.mVolumeType != 2) {
                this.mAudioManager.adjustStreamVolume(direction, this.mLocalStream, flags);
            } else if (this.mVolumeProvider != null) {
                this.mVolumeProvider.onAdjustVolume(direction);
            }
        }

        /* access modifiers changed from: private */
        public void setVolumeTo(int value, int flags) {
            if (this.mVolumeType != 2) {
                this.mAudioManager.setStreamVolume(this.mLocalStream, value, flags);
            } else if (this.mVolumeProvider != null) {
                this.mVolumeProvider.onSetVolumeTo(value);
            }
        }

        /* access modifiers changed from: private */
        /* JADX WARNING: Code restructure failed: missing block: B:12:0x0022, code lost:
            r0 = null;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:13:0x0023, code lost:
            if (r5 == null) goto L_0x0083;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:15:0x002a, code lost:
            if (r5.getState() == 3) goto L_0x003a;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:17:0x0031, code lost:
            if (r5.getState() == 4) goto L_0x003a;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:19:0x0038, code lost:
            if (r5.getState() != 5) goto L_0x0083;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:20:0x003a, code lost:
            r6 = r5.getLastPositionUpdateTime();
            r15 = android.os.SystemClock.elapsedRealtime();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:21:0x0046, code lost:
            if (r6 <= 0) goto L_0x0083;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:22:0x0048, code lost:
            r10 = ((long) (r5.getPlaybackSpeed() * ((float) (r15 - r6)))) + r5.getPosition();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:23:0x0058, code lost:
            if (r2 < 0) goto L_0x0062;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:25:0x005c, code lost:
            if (r10 <= r2) goto L_0x0062;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:26:0x005e, code lost:
            r8 = r2;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:27:0x005f, code lost:
            r17 = r8;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:29:0x0064, code lost:
            if (r10 >= 0) goto L_0x0069;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:30:0x0066, code lost:
            r8 = 0;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:31:0x0069, code lost:
            r17 = r10;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:32:0x006b, code lost:
            r4 = new android.support.v4.media.session.PlaybackStateCompat.Builder(r5);
            r4.setState(r5.getState(), r17, r5.getPlaybackSpeed(), r15);
            r0 = r4.build();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:33:0x0083, code lost:
            if (r0 != null) goto L_0x0087;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:42:?, code lost:
            return r0;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:43:?, code lost:
            return r5;
         */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public PlaybackStateCompat getStateWithUpdatedPosition() {
            long duration = -1;
            synchronized (this.mLock) {
                try {
                    PlaybackStateCompat state = this.mState;
                    try {
                        if (this.mMetadata != null && this.mMetadata.containsKey(MediaMetadataCompat.METADATA_KEY_DURATION)) {
                            duration = this.mMetadata.getLong(MediaMetadataCompat.METADATA_KEY_DURATION);
                        }
                    } catch (Throwable th) {
                        th = th;
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            }
        }

        /* access modifiers changed from: private */
        public void sendVolumeInfoChanged(ParcelableVolumeInfo info) {
            for (int i = this.mControllerCallbacks.beginBroadcast() - 1; i >= 0; i--) {
                try {
                    ((IMediaControllerCallback) this.mControllerCallbacks.getBroadcastItem(i)).onVolumeInfoChanged(info);
                } catch (RemoteException e) {
                }
            }
            this.mControllerCallbacks.finishBroadcast();
        }

        private void sendSessionDestroyed() {
            for (int i = this.mControllerCallbacks.beginBroadcast() - 1; i >= 0; i--) {
                try {
                    ((IMediaControllerCallback) this.mControllerCallbacks.getBroadcastItem(i)).onSessionDestroyed();
                } catch (RemoteException e) {
                }
            }
            this.mControllerCallbacks.finishBroadcast();
            this.mControllerCallbacks.kill();
        }

        private void sendEvent(String event, Bundle extras) {
            for (int i = this.mControllerCallbacks.beginBroadcast() - 1; i >= 0; i--) {
                try {
                    ((IMediaControllerCallback) this.mControllerCallbacks.getBroadcastItem(i)).onEvent(event, extras);
                } catch (RemoteException e) {
                }
            }
            this.mControllerCallbacks.finishBroadcast();
        }

        private void sendState(PlaybackStateCompat state) {
            for (int i = this.mControllerCallbacks.beginBroadcast() - 1; i >= 0; i--) {
                try {
                    ((IMediaControllerCallback) this.mControllerCallbacks.getBroadcastItem(i)).onPlaybackStateChanged(state);
                } catch (RemoteException e) {
                }
            }
            this.mControllerCallbacks.finishBroadcast();
        }

        private void sendMetadata(MediaMetadataCompat metadata) {
            for (int i = this.mControllerCallbacks.beginBroadcast() - 1; i >= 0; i--) {
                try {
                    ((IMediaControllerCallback) this.mControllerCallbacks.getBroadcastItem(i)).onMetadataChanged(metadata);
                } catch (RemoteException e) {
                }
            }
            this.mControllerCallbacks.finishBroadcast();
        }

        private void sendQueue(List<QueueItem> queue) {
            for (int i = this.mControllerCallbacks.beginBroadcast() - 1; i >= 0; i--) {
                try {
                    ((IMediaControllerCallback) this.mControllerCallbacks.getBroadcastItem(i)).onQueueChanged(queue);
                } catch (RemoteException e) {
                }
            }
            this.mControllerCallbacks.finishBroadcast();
        }

        private void sendQueueTitle(CharSequence queueTitle) {
            for (int i = this.mControllerCallbacks.beginBroadcast() - 1; i >= 0; i--) {
                try {
                    ((IMediaControllerCallback) this.mControllerCallbacks.getBroadcastItem(i)).onQueueTitleChanged(queueTitle);
                } catch (RemoteException e) {
                }
            }
            this.mControllerCallbacks.finishBroadcast();
        }
    }

    public interface OnActiveChangeListener {
        void onActiveChanged();
    }

    public static final class QueueItem implements Parcelable {
        public static final Creator<QueueItem> CREATOR = new Creator<QueueItem>() {
            public QueueItem createFromParcel(Parcel p) {
                return new QueueItem(p);
            }

            public QueueItem[] newArray(int size) {
                return new QueueItem[size];
            }
        };
        public static final int UNKNOWN_ID = -1;
        private final MediaDescriptionCompat mDescription;
        private final long mId;
        private Object mItem;

        public QueueItem(MediaDescriptionCompat description, long id) {
            this(null, description, id);
        }

        private QueueItem(Object queueItem, MediaDescriptionCompat description, long id) {
            if (description == null) {
                throw new IllegalArgumentException("Description cannot be null.");
            } else if (id != -1) {
                this.mDescription = description;
                this.mId = id;
                this.mItem = queueItem;
            } else {
                throw new IllegalArgumentException("Id cannot be QueueItem.UNKNOWN_ID");
            }
        }

        private QueueItem(Parcel in) {
            this.mDescription = (MediaDescriptionCompat) MediaDescriptionCompat.CREATOR.createFromParcel(in);
            this.mId = in.readLong();
        }

        public MediaDescriptionCompat getDescription() {
            return this.mDescription;
        }

        public long getQueueId() {
            return this.mId;
        }

        public void writeToParcel(Parcel dest, int flags) {
            this.mDescription.writeToParcel(dest, flags);
            dest.writeLong(this.mId);
        }

        public int describeContents() {
            return 0;
        }

        public Object getQueueItem() {
            if (this.mItem != null || VERSION.SDK_INT < 21) {
                return this.mItem;
            }
            this.mItem = QueueItem.createItem(this.mDescription.getMediaDescription(), this.mId);
            return this.mItem;
        }

        public static QueueItem obtain(Object queueItem) {
            return new QueueItem(queueItem, MediaDescriptionCompat.fromMediaDescription(QueueItem.getDescription(queueItem)), QueueItem.getQueueId(queueItem));
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("MediaSession.QueueItem {Description=");
            sb.append(this.mDescription);
            sb.append(", Id=");
            sb.append(this.mId);
            sb.append(" }");
            return sb.toString();
        }
    }

    static final class ResultReceiverWrapper implements Parcelable {
        public static final Creator<ResultReceiverWrapper> CREATOR = new Creator<ResultReceiverWrapper>() {
            public ResultReceiverWrapper createFromParcel(Parcel p) {
                return new ResultReceiverWrapper(p);
            }

            public ResultReceiverWrapper[] newArray(int size) {
                return new ResultReceiverWrapper[size];
            }
        };
        /* access modifiers changed from: private */
        public ResultReceiver mResultReceiver;

        public ResultReceiverWrapper(ResultReceiver resultReceiver) {
            this.mResultReceiver = resultReceiver;
        }

        ResultReceiverWrapper(Parcel in) {
            this.mResultReceiver = (ResultReceiver) ResultReceiver.CREATOR.createFromParcel(in);
        }

        public int describeContents() {
            return 0;
        }

        public void writeToParcel(Parcel dest, int flags) {
            this.mResultReceiver.writeToParcel(dest, flags);
        }
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface SessionFlags {
    }

    public static final class Token implements Parcelable {
        public static final Creator<Token> CREATOR = new Creator<Token>() {
            public Token createFromParcel(Parcel in) {
                Object inner;
                if (VERSION.SDK_INT >= 21) {
                    inner = in.readParcelable(null);
                } else {
                    inner = in.readStrongBinder();
                }
                return new Token(inner);
            }

            public Token[] newArray(int size) {
                return new Token[size];
            }
        };
        private final Object mInner;

        Token(Object inner) {
            this.mInner = inner;
        }

        public static Token fromToken(Object token) {
            if (token == null || VERSION.SDK_INT < 21) {
                return null;
            }
            return new Token(MediaSessionCompatApi21.verifyToken(token));
        }

        public int describeContents() {
            return 0;
        }

        public void writeToParcel(Parcel dest, int flags) {
            if (VERSION.SDK_INT >= 21) {
                dest.writeParcelable((Parcelable) this.mInner, flags);
            } else {
                dest.writeStrongBinder((IBinder) this.mInner);
            }
        }

        public Object getToken() {
            return this.mInner;
        }
    }

    public MediaSessionCompat(Context context, String tag, ComponentName mediaButtonEventReceiver, PendingIntent mbrIntent) {
        if (context == null) {
            throw new IllegalArgumentException("context must not be null");
        } else if (!TextUtils.isEmpty(tag)) {
            if (mediaButtonEventReceiver != null && mbrIntent == null) {
                Intent mediaButtonIntent = new Intent("android.intent.action.MEDIA_BUTTON");
                mediaButtonIntent.setComponent(mediaButtonEventReceiver);
                mbrIntent = PendingIntent.getBroadcast(context, 0, mediaButtonIntent, 0);
            }
            if (VERSION.SDK_INT >= 21) {
                this.mImpl = new MediaSessionImplApi21(context, tag);
                this.mImpl.setMediaButtonReceiver(mbrIntent);
            } else {
                this.mImpl = new MediaSessionImplBase(context, tag, mediaButtonEventReceiver, mbrIntent);
            }
            this.mController = new MediaControllerCompat(context, this);
        } else {
            throw new IllegalArgumentException("tag must not be null or empty");
        }
    }

    private MediaSessionCompat(Context context, MediaSessionImpl impl) {
        this.mImpl = impl;
        this.mController = new MediaControllerCompat(context, this);
    }

    public void setCallback(Callback callback) {
        setCallback(callback, null);
    }

    public void setCallback(Callback callback, Handler handler) {
        this.mImpl.setCallback(callback, handler != null ? handler : new Handler());
    }

    public void setSessionActivity(PendingIntent pi) {
        this.mImpl.setSessionActivity(pi);
    }

    public void setMediaButtonReceiver(PendingIntent mbr) {
        this.mImpl.setMediaButtonReceiver(mbr);
    }

    public void setFlags(int flags) {
        this.mImpl.setFlags(flags);
    }

    public void setPlaybackToLocal(int stream) {
        this.mImpl.setPlaybackToLocal(stream);
    }

    public void setPlaybackToRemote(VolumeProviderCompat volumeProvider) {
        if (volumeProvider != null) {
            this.mImpl.setPlaybackToRemote(volumeProvider);
            return;
        }
        throw new IllegalArgumentException("volumeProvider may not be null!");
    }

    public void setActive(boolean active) {
        this.mImpl.setActive(active);
        Iterator i$ = this.mActiveListeners.iterator();
        while (i$.hasNext()) {
            ((OnActiveChangeListener) i$.next()).onActiveChanged();
        }
    }

    public boolean isActive() {
        return this.mImpl.isActive();
    }

    public void sendSessionEvent(String event, Bundle extras) {
        if (!TextUtils.isEmpty(event)) {
            this.mImpl.sendSessionEvent(event, extras);
            return;
        }
        throw new IllegalArgumentException("event cannot be null or empty");
    }

    public void release() {
        this.mImpl.release();
    }

    public Token getSessionToken() {
        return this.mImpl.getSessionToken();
    }

    public MediaControllerCompat getController() {
        return this.mController;
    }

    public void setPlaybackState(PlaybackStateCompat state) {
        this.mImpl.setPlaybackState(state);
    }

    public void setMetadata(MediaMetadataCompat metadata) {
        this.mImpl.setMetadata(metadata);
    }

    public void setQueue(List<QueueItem> queue) {
        this.mImpl.setQueue(queue);
    }

    public void setQueueTitle(CharSequence title) {
        this.mImpl.setQueueTitle(title);
    }

    public void setRatingType(int type) {
        this.mImpl.setRatingType(type);
    }

    public void setExtras(Bundle extras) {
        this.mImpl.setExtras(extras);
    }

    public Object getMediaSession() {
        return this.mImpl.getMediaSession();
    }

    public Object getRemoteControlClient() {
        return this.mImpl.getRemoteControlClient();
    }

    public void addOnActiveChangeListener(OnActiveChangeListener listener) {
        if (listener != null) {
            this.mActiveListeners.add(listener);
            return;
        }
        throw new IllegalArgumentException("Listener may not be null");
    }

    public void removeOnActiveChangeListener(OnActiveChangeListener listener) {
        if (listener != null) {
            this.mActiveListeners.remove(listener);
            return;
        }
        throw new IllegalArgumentException("Listener may not be null");
    }

    public static MediaSessionCompat obtain(Context context, Object mediaSession) {
        return new MediaSessionCompat(context, new MediaSessionImplApi21(mediaSession));
    }
}