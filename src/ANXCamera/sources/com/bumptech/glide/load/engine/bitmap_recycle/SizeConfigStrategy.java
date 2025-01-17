package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Build.VERSION;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.util.k;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.TreeMap;

@RequiresApi(19)
public class SizeConfigStrategy implements k {
    private static final int iM = 8;
    private static final Config[] iN;
    private static final Config[] iO = iN;
    private static final Config[] iP = {Config.RGB_565};
    private static final Config[] iQ = {Config.ARGB_4444};
    private static final Config[] iR = {Config.ALPHA_8};
    private final KeyPool iS = new KeyPool();
    private final g<Key, Bitmap> ii = new g<>();
    private final Map<Config, NavigableMap<Integer, Integer>> iu = new HashMap();

    /* renamed from: com.bumptech.glide.load.engine.bitmap_recycle.SizeConfigStrategy$1 reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] iT = new int[Config.values().length];

        static {
            try {
                iT[Config.ARGB_8888.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iT[Config.RGB_565.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iT[Config.ARGB_4444.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iT[Config.ALPHA_8.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
        }
    }

    @VisibleForTesting
    static final class Key implements l {
        private Config config;
        private final KeyPool iU;
        int size;

        public Key(KeyPool keyPool) {
            this.iU = keyPool;
        }

        @VisibleForTesting
        Key(KeyPool keyPool, int i, Config config2) {
            this(keyPool);
            c(i, config2);
        }

        public void bN() {
            this.iU.a(this);
        }

        public void c(int i, Config config2) {
            this.size = i;
            this.config = config2;
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (!(obj instanceof Key)) {
                return false;
            }
            Key key = (Key) obj;
            if (this.size == key.size && k.d(this.config, key.config)) {
                z = true;
            }
            return z;
        }

        public int hashCode() {
            return (31 * this.size) + (this.config != null ? this.config.hashCode() : 0);
        }

        public String toString() {
            return SizeConfigStrategy.b(this.size, this.config);
        }
    }

    @VisibleForTesting
    static class KeyPool extends c<Key> {
        KeyPool() {
        }

        /* access modifiers changed from: protected */
        /* renamed from: bY */
        public Key bP() {
            return new Key(this);
        }

        public Key d(int i, Config config) {
            Key key = (Key) bQ();
            key.c(i, config);
            return key;
        }
    }

    static {
        Config[] configArr = {Config.ARGB_8888, null};
        if (VERSION.SDK_INT >= 26) {
            configArr = (Config[]) Arrays.copyOf(configArr, configArr.length + 1);
            configArr[configArr.length - 1] = Config.RGBA_F16;
        }
        iN = configArr;
    }

    private Key a(int i, Config config) {
        Key d = this.iS.d(i, config);
        Config[] d2 = d(config);
        int length = d2.length;
        int i2 = 0;
        while (i2 < length) {
            Config config2 = d2[i2];
            Integer num = (Integer) c(config2).ceilingKey(Integer.valueOf(i));
            if (num == null || num.intValue() > i * 8) {
                i2++;
            } else {
                if (num.intValue() == i) {
                    if (config2 == null) {
                        if (config == null) {
                            return d;
                        }
                    } else if (config2.equals(config)) {
                        return d;
                    }
                }
                this.iS.a(d);
                return this.iS.d(num.intValue(), config2);
            }
        }
        return d;
    }

    private void a(Integer num, Bitmap bitmap) {
        NavigableMap c = c(bitmap.getConfig());
        Integer num2 = (Integer) c.get(num);
        if (num2 == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Tried to decrement empty size, size: ");
            sb.append(num);
            sb.append(", removed: ");
            sb.append(e(bitmap));
            sb.append(", this: ");
            sb.append(this);
            throw new NullPointerException(sb.toString());
        } else if (num2.intValue() == 1) {
            c.remove(num);
        } else {
            c.put(num, Integer.valueOf(num2.intValue() - 1));
        }
    }

    static String b(int i, Config config) {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(i);
        sb.append("](");
        sb.append(config);
        sb.append(")");
        return sb.toString();
    }

    private NavigableMap<Integer, Integer> c(Config config) {
        NavigableMap<Integer, Integer> navigableMap = (NavigableMap) this.iu.get(config);
        if (navigableMap != null) {
            return navigableMap;
        }
        TreeMap treeMap = new TreeMap();
        this.iu.put(config, treeMap);
        return treeMap;
    }

    private static Config[] d(Config config) {
        if (VERSION.SDK_INT >= 26 && Config.RGBA_F16.equals(config)) {
            return iO;
        }
        switch (AnonymousClass1.iT[config.ordinal()]) {
            case 1:
                return iN;
            case 2:
                return iP;
            case 3:
                return iQ;
            case 4:
                return iR;
            default:
                return new Config[]{config};
        }
    }

    @Nullable
    public Bitmap b(int i, int i2, Config config) {
        Key a = a(k.i(i, i2, config), config);
        Bitmap bitmap = (Bitmap) this.ii.b(a);
        if (bitmap != null) {
            a(Integer.valueOf(a.size), bitmap);
            bitmap.reconfigure(i, i2, bitmap.getConfig() != null ? bitmap.getConfig() : Config.ARGB_8888);
        }
        return bitmap;
    }

    @Nullable
    public Bitmap bM() {
        Bitmap bitmap = (Bitmap) this.ii.removeLast();
        if (bitmap != null) {
            a(Integer.valueOf(k.p(bitmap)), bitmap);
        }
        return bitmap;
    }

    public String c(int i, int i2, Config config) {
        return b(k.i(i, i2, config), config);
    }

    public void d(Bitmap bitmap) {
        Key d = this.iS.d(k.p(bitmap), bitmap.getConfig());
        this.ii.a(d, bitmap);
        NavigableMap c = c(bitmap.getConfig());
        Integer num = (Integer) c.get(Integer.valueOf(d.size));
        Integer valueOf = Integer.valueOf(d.size);
        int i = 1;
        if (num != null) {
            i = 1 + num.intValue();
        }
        c.put(valueOf, Integer.valueOf(i));
    }

    public String e(Bitmap bitmap) {
        return b(k.p(bitmap), bitmap.getConfig());
    }

    public int f(Bitmap bitmap) {
        return k.p(bitmap);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("SizeConfigStrategy{groupedMap=");
        sb.append(this.ii);
        sb.append(", sortedSizes=(");
        for (Entry entry : this.iu.entrySet()) {
            sb.append(entry.getKey());
            sb.append('[');
            sb.append(entry.getValue());
            sb.append("], ");
        }
        if (!this.iu.isEmpty()) {
            sb.replace(sb.length() - 2, sb.length(), "");
        }
        sb.append(")}");
        return sb.toString();
    }
}
