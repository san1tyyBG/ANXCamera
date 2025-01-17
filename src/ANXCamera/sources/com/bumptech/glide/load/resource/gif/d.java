package com.bumptech.glide.load.resource.gif;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.l;
import com.bumptech.glide.load.resource.b.b;

/* compiled from: GifDrawableResource */
public class d extends b<b> implements l {
    public d(b bVar) {
        super(bVar);
    }

    @NonNull
    public Class<b> bG() {
        return b.class;
    }

    public int getSize() {
        return ((b) this.drawable).getSize();
    }

    public void initialize() {
        ((b) this.drawable).di().prepareToDraw();
    }

    public void recycle() {
        ((b) this.drawable).stop();
        ((b) this.drawable).recycle();
    }
}
