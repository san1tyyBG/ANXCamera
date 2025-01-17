package com.bumptech.glide.load.engine.a;

import android.content.Context;
import com.bumptech.glide.load.engine.a.a.C0004a;
import com.bumptech.glide.load.engine.a.d.a;
import java.io.File;

/* compiled from: InternalCacheDiskCacheFactory */
public final class h extends d {
    public h(Context context) {
        this(context, C0004a.bi, 262144000);
    }

    public h(Context context, long j) {
        this(context, C0004a.bi, j);
    }

    public h(final Context context, final String str, long j) {
        super((a) new a() {
            public File cc() {
                File cacheDir = context.getCacheDir();
                if (cacheDir == null) {
                    return null;
                }
                return str != null ? new File(cacheDir, str) : cacheDir;
            }
        }, j);
    }
}
