package org.jcodec.containers.mp4;

public class Chunk {
    private int entry;
    private long offset;
    private int sampleCount;
    private int sampleDur;
    private int[] sampleDurs;
    private int sampleSize;
    private int[] sampleSizes;
    private long startTv;

    public Chunk(long j, long j2, int i, int i2, int[] iArr, int i3, int[] iArr2, int i4) {
        this.offset = j;
        this.startTv = j2;
        this.sampleCount = i;
        this.sampleSize = i2;
        this.sampleSizes = iArr;
        this.sampleDur = i3;
        this.sampleDurs = iArr2;
        this.entry = i4;
    }

    public int getDuration() {
        if (this.sampleDur > 0) {
            return this.sampleDur * this.sampleCount;
        }
        int i = 0;
        for (int i2 : this.sampleDurs) {
            i += i2;
        }
        return i;
    }

    public int getEntry() {
        return this.entry;
    }

    public long getOffset() {
        return this.offset;
    }

    public int getSampleCount() {
        return this.sampleCount;
    }

    public int getSampleDur() {
        return this.sampleDur;
    }

    public int[] getSampleDurs() {
        return this.sampleDurs;
    }

    public int getSampleSize() {
        return this.sampleSize;
    }

    public int[] getSampleSizes() {
        return this.sampleSizes;
    }

    public long getSize() {
        if (this.sampleSize > 0) {
            return (long) (this.sampleSize * this.sampleCount);
        }
        long j = 0;
        for (int i : this.sampleSizes) {
            j += (long) i;
        }
        return j;
    }

    public long getStartTv() {
        return this.startTv;
    }
}
