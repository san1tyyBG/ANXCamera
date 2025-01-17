package com.xiaomi.camera.liveshot.encoder;

import android.media.AudioRecord;
import android.media.MediaCodec;
import android.media.MediaFormat;
import android.os.Handler;
import com.android.camera.log.Log;
import com.xiaomi.camera.liveshot.LivePhotoResult;
import com.xiaomi.camera.liveshot.MediaCodecCapability;
import com.xiaomi.camera.liveshot.encoder.CircularMediaEncoder.Snapshot;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Queue;
import java.util.concurrent.TimeUnit;

public class CircularAudioEncoder extends CircularMediaEncoder {
    private static boolean DEBUG = true;
    private static final int NOTIFICATION_PERIOD_SAMPLE_COUNT = 1440;
    private static final String TAG = CircularAudioEncoder.class.getSimpleName();
    private AudioRecord mAudioRecord;
    private final int mAudioRecordBufferSize;
    private final int mChannelCount = this.mDesiredMediaFormat.getInteger("channel-count");
    private final int mFrameBytes;
    private final int mNotificationPeriod;
    private byte[] mSampleBuffer;
    private long mSampleCount;
    private final int mSampleRate = this.mDesiredMediaFormat.getInteger("sample-rate");

    public CircularAudioEncoder(MediaFormat mediaFormat, long j, long j2, Queue<LivePhotoResult> queue) {
        super(mediaFormat, j, j2, queue);
        int integer = this.mDesiredMediaFormat.getInteger("pcm-encoding");
        this.mFrameBytes = sampleBytes(integer) * this.mChannelCount;
        this.mNotificationPeriod = NOTIFICATION_PERIOD_SAMPLE_COUNT;
        this.mAudioRecordBufferSize = Math.max(this.mNotificationPeriod * this.mFrameBytes * 4, AudioRecord.getMinBufferSize(this.mSampleRate, channelConfig(), integer));
        this.mSampleBuffer = new byte[this.mAudioRecordBufferSize];
        AudioRecord audioRecord = new AudioRecord(5, this.mSampleRate, channelConfig(), integer, this.mAudioRecordBufferSize);
        this.mAudioRecord = audioRecord;
        if (this.mAudioRecord.getRecordingState() != 0) {
            boolean z = false;
            try {
                this.mMediaCodec = MediaCodec.createByCodecName(MediaCodecCapability.HW_AUDIO_CODEC_AAC);
                z = true;
            } catch (Exception e) {
                Log.d(TAG, "HW AAC encoder not found fallback to default instead", e);
            }
            if (!z) {
                try {
                    this.mMediaCodec = MediaCodec.createEncoderByType(this.mDesiredMediaFormat.getString("mime"));
                } catch (IOException e2) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failed to configure MediaCodec: ");
                    sb.append(e2);
                    throw new IllegalStateException(sb.toString());
                }
            }
            this.mIsInitialized = true;
            return;
        }
        this.mAudioRecord.release();
        throw new IllegalStateException("Failed to initialize AudioRecord");
    }

    private void addSampleCount(long j) {
        this.mSampleCount += j;
    }

    private int channelConfig() {
        switch (this.mChannelCount) {
            case 1:
                return 16;
            case 2:
                return 12;
            default:
                return 16;
        }
    }

    private long getPresentationTime(long j) {
        return (TimeUnit.SECONDS.toMicros(1) * (this.mSampleCount + j)) / ((long) this.mSampleRate);
    }

    private int getSampleDataBytes() {
        return this.mFrameBytes;
    }

    private int sampleBytes(int i) {
        switch (i) {
            case 2:
                return 2;
            case 3:
                return 1;
            default:
                throw new IllegalStateException("Specified Audio format is not supported.");
        }
    }

    public void doRelease() {
        if (this.mIsInitialized) {
            super.doRelease();
            try {
                this.mAudioRecord.release();
            } catch (IllegalStateException e) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Meet exception when mAudioRecord.release(): ");
                sb.append(e);
                Log.d(str, sb.toString());
            }
            this.mIsInitialized = false;
        }
    }

    public void doStart() {
        if (DEBUG) {
            Log.d(TAG, "start(): X");
        }
        if (!this.mIsInitialized) {
            Log.d(TAG, "start(): not initialized yet");
        } else if (this.mIsBuffering) {
            Log.d(TAG, "start(): encoder is already running");
        } else {
            this.mCyclicBuffer.clear();
            this.mMediaCodec.configure(this.mDesiredMediaFormat, null, null, 1);
            this.mMediaCodec.setCallback(this, new Handler(this.mEncodingThread.getLooper()));
            super.doStart();
            this.mIsBuffering = true;
            this.mCurrentPresentationTimeUs = 0;
            try {
                this.mAudioRecord.startRecording();
                if (DEBUG) {
                    Log.d(TAG, "start(): X");
                }
            } catch (IllegalStateException e) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("startRecording(): failed ");
                sb.append(e);
                Log.e(str, sb.toString());
            }
        }
    }

    public void doStop() {
        if (DEBUG) {
            Log.d(TAG, "stop(): E");
        }
        if (!this.mIsInitialized) {
            Log.d(TAG, "stop(): not initialized yet");
        } else if (this.mIsBuffering) {
            this.mIsBuffering = false;
            super.doStop();
            if (DEBUG) {
                Log.d(TAG, "mAudioRecord.stop(): E");
            }
            try {
                this.mAudioRecord.stop();
            } catch (IllegalStateException e) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Meet exception when mAudioRecord.stop(): ");
                sb.append(e);
                Log.d(str, sb.toString());
            }
            if (DEBUG) {
                Log.d(TAG, "mAudioRecord.stop(): X");
            }
            if (DEBUG) {
                Log.d(TAG, "clear pending snapshot requests: E");
            }
            ArrayList<Snapshot> arrayList = new ArrayList<>();
            synchronized (this.mSnapshots) {
                arrayList.addAll(this.mSnapshots);
                this.mSnapshots.clear();
            }
            if (DEBUG) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("cleared ");
                sb2.append(arrayList.size());
                sb2.append(" snapshot requests.");
                Log.d(str2, sb2.toString());
            }
            for (Snapshot putEos : arrayList) {
                try {
                    putEos.putEos();
                } catch (InterruptedException e2) {
                    String str3 = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("Failed to putEos: ");
                    sb3.append(e2);
                    Log.d(str3, sb3.toString());
                }
            }
            if (DEBUG) {
                Log.d(TAG, "clear pending snapshot requests: X");
            }
            if (DEBUG) {
                Log.d(TAG, "stop() X");
            }
        }
    }

    public void onInputBufferAvailable(MediaCodec mediaCodec, int i) {
        if (DEBUG) {
            Log.d(TAG, "audioCodec.onInputBufferAvailable(): E");
        }
        if (!this.mIsBuffering) {
            Log.d(TAG, "audioCodec: already End of Stream");
            mediaCodec.queueInputBuffer(i, 0, 0, 0, 4);
            return;
        }
        Log.d(TAG, "audioCodec.dequeueInputBuffer(): E");
        ByteBuffer inputBuffer = mediaCodec.getInputBuffer(i);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("audioCodec.dequeueInputBuffer(");
        sb.append(i);
        sb.append("): X");
        Log.d(str, sb.toString());
        int i2 = 0;
        int read = this.mAudioRecord.read(this.mSampleBuffer, 0, Math.min(inputBuffer.limit(), this.mNotificationPeriod * this.mFrameBytes));
        if (read != 0) {
            switch (read) {
                case -3:
                    if (DEBUG) {
                        Log.d(TAG, "  ERROR_INVALID_OP");
                    }
                    return;
                case -2:
                    if (DEBUG) {
                        Log.d(TAG, "  ERROR_BAD_VALUE");
                    }
                    return;
                default:
                    Log.d(TAG, "audioCodec.queueInputBuffer(): E");
                    inputBuffer.clear();
                    inputBuffer.put(this.mSampleBuffer, 0, read);
                    int position = 0 + inputBuffer.position();
                    long sampleDataBytes = (long) (position / getSampleDataBytes());
                    long presentationTime = getPresentationTime(sampleDataBytes);
                    if (!this.mIsBuffering) {
                        i2 = 4;
                    }
                    this.mMediaCodec.queueInputBuffer(i, 0, position, presentationTime, i2);
                    addSampleCount(sampleDataBytes);
                    Log.d(TAG, "audioCodec.queueInputBuffer(): X");
                    if (DEBUG) {
                        Log.d(TAG, "audioCodec.onInputBufferAvailable(): X");
                    }
                    return;
            }
        } else {
            if (DEBUG) {
                Log.d(TAG, "  END_OF_BUFFER");
            }
        }
    }
}
