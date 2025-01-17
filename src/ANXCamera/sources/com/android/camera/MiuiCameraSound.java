package com.android.camera;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.AudioAttributes;
import android.media.AudioManager;
import android.media.SoundPool;
import android.media.SoundPool.Builder;
import android.media.SoundPool.OnLoadCompleteListener;
import com.android.camera.log.Log;
import com.mi.config.b;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.io.IOException;

public class MiuiCameraSound implements Consumer<PlayConfig> {
    public static final int AUDIO_CAPTURE = 7;
    public static final int FAST_BURST = 4;
    public static final int FOCUS_COMPLETE = 1;
    public static final int KNOBS_SCROLL = 6;
    private static final int NUM_MEDIA_SOUND_STREAMS = 1;
    public static final int SHUTTER_CLICK = 0;
    public static final int SHUTTER_DELAY = 5;
    private static final String[] SOUND_FILES = {"camera_click_v9.mp3", "camera_focus_v9.mp3", "video_record_start_v9.ogg", "video_record_end_v9.ogg", "camera_fast_burst_v9.ogg", "sound_shuter_delay_bee.ogg", "/system/media/audio/ui/NumberPickerValueChange.ogg", "audio_capture.ogg"};
    private static final int SOUND_NOT_LOADED = -1;
    public static final int START_VIDEO_RECORDING = 2;
    public static final int STOP_VIDEO_RECORDING = 3;
    private static final String TAG = "MiuiCameraSound";
    private final AssetManager mAssetManager;
    private final AudioManager mAudioManager;
    private Disposable mDisposable;
    /* access modifiers changed from: private */
    public FlowableEmitter<PlayConfig> mFlowableEmitter;
    private long mLastPlayTime = 0;
    private OnLoadCompleteListener mLoadCompleteListener = new OnLoadCompleteListener() {
        public void onLoadComplete(SoundPool soundPool, int i, int i2) {
            if (i2 != 0) {
                String str = MiuiCameraSound.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Unable to load sound for playback (status: ");
                sb.append(i2);
                sb.append(")");
                Log.e(str, sb.toString());
            } else if (MiuiCameraSound.this.mSoundIdToPlay == i) {
                soundPool.play(i, 1.0f, 1.0f, 0, 0, 1.0f);
                MiuiCameraSound.this.mSoundIdToPlay = -1;
            }
        }
    };
    /* access modifiers changed from: private */
    public int mSoundIdToPlay;
    private int[] mSoundIds;
    private SoundPool mSoundPool;

    public static class PlayConfig {
        public int soundId;
        public float volume = 1.0f;
    }

    public MiuiCameraSound(Context context) {
        this.mAudioManager = (AudioManager) context.getSystemService("audio");
        this.mAssetManager = context.getAssets();
        Builder builder = new Builder();
        int i = 1;
        builder.setMaxStreams(1);
        AudioAttributes.Builder builder2 = new AudioAttributes.Builder();
        if (!b.hE()) {
            i = 7;
        }
        builder.setAudioAttributes(builder2.setInternalLegacyStreamType(i).build());
        this.mSoundPool = builder.build();
        this.mSoundPool.setOnLoadCompleteListener(this.mLoadCompleteListener);
        this.mSoundIds = new int[SOUND_FILES.length];
        for (int i2 = 0; i2 < this.mSoundIds.length; i2++) {
            this.mSoundIds[i2] = -1;
        }
        this.mSoundIdToPlay = -1;
        this.mDisposable = Flowable.create(new FlowableOnSubscribe<PlayConfig>() {
            public void subscribe(FlowableEmitter<PlayConfig> flowableEmitter) throws Exception {
                MiuiCameraSound.this.mFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).observeOn(Schedulers.io()).onBackpressureDrop(new Consumer<PlayConfig>() {
            public void accept(@NonNull PlayConfig playConfig) throws Exception {
                String str = MiuiCameraSound.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("play sound too fast: ");
                sb.append(playConfig.soundId);
                Log.e(str, sb.toString());
            }
        }).subscribe((Consumer<? super T>) this);
    }

    /* JADX WARNING: Removed duplicated region for block: B:19:0x0038 A[SYNTHETIC, Splitter:B:19:0x0038] */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x004c A[SYNTHETIC, Splitter:B:25:0x004c] */
    private int loadFromAsset(int i) {
        AssetFileDescriptor assetFileDescriptor = null;
        try {
            AssetFileDescriptor openFd = this.mAssetManager.openFd(SOUND_FILES[i]);
            try {
                int load = this.mSoundPool.load(openFd, 1);
                if (openFd == null) {
                    return load;
                }
                try {
                    openFd.close();
                    return load;
                } catch (IOException e) {
                    Log.e(TAG, "IOException occurs when closing Camera Sound AssetFileDescriptor.");
                    e.printStackTrace();
                    return load;
                }
            } catch (IOException e2) {
                IOException iOException = e2;
                assetFileDescriptor = openFd;
                e = iOException;
                try {
                    e.printStackTrace();
                    if (assetFileDescriptor != null) {
                    }
                    return -1;
                } catch (Throwable th) {
                    th = th;
                    if (assetFileDescriptor != null) {
                        try {
                            assetFileDescriptor.close();
                        } catch (IOException e3) {
                            Log.e(TAG, "IOException occurs when closing Camera Sound AssetFileDescriptor.");
                            e3.printStackTrace();
                        }
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                Throwable th3 = th2;
                assetFileDescriptor = openFd;
                th = th3;
                if (assetFileDescriptor != null) {
                }
                throw th;
            }
        } catch (IOException e4) {
            e = e4;
            e.printStackTrace();
            if (assetFileDescriptor != null) {
                try {
                    assetFileDescriptor.close();
                } catch (IOException e5) {
                    Log.e(TAG, "IOException occurs when closing Camera Sound AssetFileDescriptor.");
                    e5.printStackTrace();
                }
            }
            return -1;
        }
    }

    private synchronized void play(int i, float f, int i2) {
        if (i >= 0) {
            if (i < SOUND_FILES.length) {
                if (this.mSoundIds[i] == -1) {
                    if (!SOUND_FILES[i].startsWith("/")) {
                        this.mSoundIdToPlay = loadFromAsset(i);
                    } else {
                        this.mSoundIdToPlay = this.mSoundPool.load(SOUND_FILES[i], 1);
                    }
                    this.mSoundIds[i] = this.mSoundIdToPlay;
                } else {
                    this.mSoundPool.play(this.mSoundIds[i], f, f, 0, i2 - 1, 1.0f);
                    this.mLastPlayTime = System.currentTimeMillis();
                }
            }
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Unknown sound requested: ");
        sb.append(i);
        throw new RuntimeException(sb.toString());
    }

    private void playSound(int i, float f, int i2) {
        if (!b.hE() || this.mAudioManager.getRingerMode() == 2) {
            play(i, f, i2);
        }
    }

    public void accept(@NonNull PlayConfig playConfig) throws Exception {
        playSound(playConfig.soundId, playConfig.volume, 1);
    }

    public long getLastSoundPlayTime() {
        return this.mLastPlayTime;
    }

    public synchronized void load(int i) {
        if (i >= 0) {
            if (i < SOUND_FILES.length) {
                if (this.mSoundIds[i] == -1) {
                    if (!SOUND_FILES[i].startsWith("/")) {
                        this.mSoundIds[i] = loadFromAsset(i);
                    } else {
                        this.mSoundIds[i] = this.mSoundPool.load(SOUND_FILES[i], 1);
                    }
                }
            }
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Unknown sound requested: ");
        sb.append(i);
        throw new RuntimeException(sb.toString());
    }

    public void playSound(int i) {
        playSound(i, 1.0f);
    }

    public void playSound(int i, float f) {
        if (!this.mFlowableEmitter.isCancelled()) {
            PlayConfig playConfig = new PlayConfig();
            playConfig.soundId = i;
            playConfig.volume = f;
            this.mFlowableEmitter.onNext(playConfig);
        }
    }

    public void release() {
        if (this.mDisposable != null && !this.mDisposable.isDisposed()) {
            this.mDisposable.dispose();
        }
        if (this.mSoundPool != null) {
            this.mSoundPool.release();
            this.mSoundPool = null;
        }
    }
}
