package com.bumptech.glide.load;

public enum DecodeFormat {
    PREFER_ARGB_8888,
    PREFER_ARGB_8888_DISALLOW_HARDWARE,
    PREFER_RGB_565;
    
    public static final DecodeFormat eq = null;

    static {
        eq = PREFER_ARGB_8888_DISALLOW_HARDWARE;
    }
}
