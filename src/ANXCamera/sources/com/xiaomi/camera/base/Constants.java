package com.xiaomi.camera.base;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public final class Constants {

    @Retention(RetentionPolicy.SOURCE)
    public @interface AlgoType {
        public static final int CLEAR_SHOT = 2;
        public static final int GROUP_SHOT = 5;
        public static final int HDR = 1;
        public static final int MULTI_SHOT = 4;
        public static final int QCFA_SHOT = 6;
        public static final int SUPER_RESOLUTION = 3;
        public static final int UNKNOWN = 0;
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ResultImage {
        public static final int RESULT_IMAGE_DEPTH = 2;
        public static final int RESULT_IMAGE_JPEG_RAW = 1;
        public static final int RESULT_IMAGE_NORMAL = 0;
        public static final int RESULT_IMAGE_SENSOR_RAW = 3;
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ShotType {
        public static final int BURST_SHOT = 3;
        public static final int INTENT_NORMAL_DUAL_SHOT = -3;
        public static final int INTENT_NORMAL_SINGLE_SHOT = -2;
        public static final int MIMOJI_PREVIEW_SHOT = -4;
        public static final int NORMAL_DUAL_SHOT = 2;
        public static final int NORMAL_SINGLE_SHOT = 0;
        public static final int PARALLEL_BURST = 8;
        public static final int PARALLEL_DUAL_PORTRAIT = 6;
        public static final int PARALLEL_REPEATING = 9;
        public static final int PARALLEL_SINGLE = 5;
        public static final int PARALLEL_SINGLE_PORTRAIT = 7;
        public static final int PREVIEW_SHOT = -1;
        public static final int SUPER_NIGHT_RAW_BURST = 10;
        public static final int VIDEO_SHOT = 4;
    }

    public static boolean isIntentType(int i) {
        switch (i) {
            case -3:
            case -2:
                return true;
            default:
                return false;
        }
    }
}
