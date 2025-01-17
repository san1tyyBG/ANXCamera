package com.android.camera.module.encoder;

import android.media.AudioRecord;
import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.os.Process;
import com.android.camera.log.Log;
import com.android.camera.module.encoder.MediaEncoder.MediaEncoderListener;
import java.io.IOException;
import java.nio.ByteBuffer;

public class MediaAudioEncoder extends MediaEncoder {
    private static final int[] AUDIO_SOURCES = {1, 0, 5};
    private static final int BIT_RATE = 64000;
    public static final int FRAMES_PER_BUFFER = 25;
    private static final String MIME_TYPE = "audio/mp4a-latm";
    public static final int SAMPLES_PER_FRAME = 1024;
    private static final int SAMPLE_RATE = 44100;
    /* access modifiers changed from: private */
    public static final String TAG = MediaAudioEncoder.class.getSimpleName();
    private AudioThread mAudioThread = null;
    protected final Object mMediaCodecLock = new Object();

    private class AudioThread extends Thread {
        private AudioRecord audioRecord;

        public AudioThread(AudioRecord audioRecord2) {
            this.audioRecord = audioRecord2;
        }

        /* JADX INFO: finally extract failed */
        /* JADX WARNING: Code restructure failed: missing block: B:13:?, code lost:
            r7.this$0.frameAvailableSoon();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:15:?, code lost:
            r7.audioRecord.stop();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:19:?, code lost:
            r1.clear();
            r2 = r7.audioRecord.read(r1, 1024);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:20:0x003b, code lost:
            if (r2 <= 0) goto L_0x001a;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:21:0x003d, code lost:
            r1.position(r2);
            r1.flip();
            r3 = r7.this$0.mMediaCodecLock;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:22:0x0047, code lost:
            monitor-enter(r3);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:25:0x004c, code lost:
            if (r7.this$0.mSkipFrame != false) goto L_0x0059;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:26:0x004e, code lost:
            r7.this$0.encode(r1, r2, r7.this$0.getPTSUs());
         */
        /* JADX WARNING: Code restructure failed: missing block: B:27:0x0059, code lost:
            monitor-exit(r3);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:29:?, code lost:
            r7.this$0.frameAvailableSoon();
         */
        public void run() {
            Process.setThreadPriority(-19);
            try {
                if (MediaAudioEncoder.this.mIsCapturing) {
                    Log.d(MediaAudioEncoder.TAG, "audioThread>>>");
                    ByteBuffer allocateDirect = ByteBuffer.allocateDirect(1024);
                    while (true) {
                        try {
                            synchronized (MediaAudioEncoder.this.mSync) {
                                if (MediaAudioEncoder.this.mRequestStop) {
                                    break;
                                }
                            }
                        } catch (Throwable th) {
                            this.audioRecord.stop();
                            throw th;
                        }
                    }
                    while (true) {
                    }
                }
                this.audioRecord.release();
                Log.d(MediaAudioEncoder.TAG, "audioThread<<<");
            } catch (Throwable th2) {
                this.audioRecord.release();
                throw th2;
            }
        }
    }

    public MediaAudioEncoder(MediaMuxerWrapper mediaMuxerWrapper, MediaEncoderListener mediaEncoderListener) {
        super(mediaMuxerWrapper, mediaEncoderListener);
    }

    private AudioRecord initAudioRecord() {
        int minBufferSize = AudioRecord.getMinBufferSize(SAMPLE_RATE, 16, 2);
        int i = 25600;
        if (25600 < minBufferSize) {
            i = ((minBufferSize / 1024) + 1) * 1024 * 2;
        }
        AudioRecord audioRecord = null;
        for (int audioRecord2 : AUDIO_SOURCES) {
            AudioRecord audioRecord3 = new AudioRecord(audioRecord2, SAMPLE_RATE, 16, 2, i);
            if (audioRecord3.getState() != 1) {
                audioRecord3.release();
                audioRecord = null;
            } else {
                audioRecord = audioRecord3;
            }
            if (audioRecord != null) {
                break;
            }
        }
        return audioRecord;
    }

    private static MediaCodecInfo selectAudioCodec(String str) {
        int codecCount = MediaCodecList.getCodecCount();
        for (int i = 0; i < codecCount; i++) {
            MediaCodecInfo codecInfoAt = MediaCodecList.getCodecInfoAt(i);
            if (codecInfoAt.isEncoder()) {
                String[] supportedTypes = codecInfoAt.getSupportedTypes();
                for (String equalsIgnoreCase : supportedTypes) {
                    if (equalsIgnoreCase.equalsIgnoreCase(str)) {
                        return codecInfoAt;
                    }
                }
                continue;
            }
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public void prepare() throws IOException {
        Log.v(TAG, "prepare>>>");
        this.mTrackIndex = -1;
        this.mMuxerStarted = false;
        this.mIsEOS = false;
        MediaCodecInfo selectAudioCodec = selectAudioCodec(MIME_TYPE);
        if (selectAudioCodec == null) {
            Log.e(TAG, "no appropriate codec for audio/mp4a-latm");
            return;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("selected codec: ");
        sb.append(selectAudioCodec.getName());
        Log.d(str, sb.toString());
        MediaFormat createAudioFormat = MediaFormat.createAudioFormat(MIME_TYPE, SAMPLE_RATE, 1);
        createAudioFormat.setInteger("aac-profile", 2);
        createAudioFormat.setInteger("channel-mask", 16);
        createAudioFormat.setInteger("bitrate", BIT_RATE);
        createAudioFormat.setInteger("channel-count", 1);
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("format: ");
        sb2.append(createAudioFormat);
        Log.d(str2, sb2.toString());
        this.mMediaCodec = MediaCodec.createEncoderByType(MIME_TYPE);
        this.mMediaCodec.configure(createAudioFormat, null, null, 1);
        this.mMediaCodec.start();
        if (this.mListener != null) {
            this.mListener.onPrepared(this);
        }
        Log.v(TAG, "prepare<<<");
    }

    /* access modifiers changed from: protected */
    public void release() {
        this.mAudioThread = null;
        synchronized (this.mMediaCodecLock) {
            super.release();
        }
    }

    /* access modifiers changed from: protected */
    public boolean startRecording(long j) {
        boolean startRecording = super.startRecording(j);
        if (!startRecording) {
            return false;
        }
        if (this.mAudioThread == null) {
            AudioRecord initAudioRecord = initAudioRecord();
            if (initAudioRecord == null) {
                Log.e(TAG, "failed to initialize AudioRecord");
                return false;
            }
            try {
                initAudioRecord.startRecording();
                if (3 == initAudioRecord.getRecordingState()) {
                    this.mAudioThread = new AudioThread(initAudioRecord);
                    this.mAudioThread.start();
                } else {
                    startRecording = false;
                }
            } catch (IllegalStateException e) {
                Log.e(TAG, e.getMessage(), e);
                startRecording = false;
            }
            if (!startRecording && initAudioRecord != null) {
                initAudioRecord.stop();
                initAudioRecord.release();
            }
        }
        return startRecording;
    }
}
