package com.bumptech.glide.load;

import android.support.annotation.NonNull;
import java.nio.charset.Charset;
import java.security.MessageDigest;

/* compiled from: Key */
public interface c {
    public static final String eH = "UTF-8";
    public static final Charset eI = Charset.forName("UTF-8");

    boolean equals(Object obj);

    int hashCode();

    void updateDiskCacheKey(@NonNull MessageDigest messageDigest);
}
