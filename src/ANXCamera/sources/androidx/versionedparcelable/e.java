package androidx.versionedparcelable;

import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.util.SparseIntArray;

@RestrictTo({Scope.LIBRARY})
/* compiled from: VersionedParcelParcel */
class e extends VersionedParcel {
    private static final boolean DEBUG = false;
    private static final String TAG = "VersionedParcelParcel";
    private final SparseIntArray aB;
    private int aC;
    private int aD;
    private final int mEnd;
    private final int mOffset;
    private final Parcel mParcel;
    private final String mPrefix;

    e(Parcel parcel) {
        this(parcel, parcel.dataPosition(), parcel.dataSize(), "");
    }

    e(Parcel parcel, int i, int i2, String str) {
        this.aB = new SparseIntArray();
        this.aC = -1;
        this.aD = 0;
        this.mParcel = parcel;
        this.mOffset = i;
        this.mEnd = i2;
        this.aD = this.mOffset;
        this.mPrefix = str;
    }

    private int f(int i) {
        while (this.aD < this.mEnd) {
            this.mParcel.setDataPosition(this.aD);
            int readInt = this.mParcel.readInt();
            int readInt2 = this.mParcel.readInt();
            this.aD += readInt;
            if (readInt2 == i) {
                return this.mParcel.dataPosition();
            }
        }
        return -1;
    }

    public void b(Parcelable parcelable) {
        this.mParcel.writeParcelable(parcelable, 0);
    }

    public boolean d(int i) {
        int f = f(i);
        if (f == -1) {
            return false;
        }
        this.mParcel.setDataPosition(f);
        return true;
    }

    public void e(int i) {
        q();
        this.aC = i;
        this.aB.put(i, this.mParcel.dataPosition());
        writeInt(0);
        writeInt(i);
    }

    public void q() {
        if (this.aC >= 0) {
            int i = this.aB.get(this.aC);
            int dataPosition = this.mParcel.dataPosition();
            int i2 = dataPosition - i;
            this.mParcel.setDataPosition(i);
            this.mParcel.writeInt(i2);
            this.mParcel.setDataPosition(dataPosition);
        }
    }

    /* access modifiers changed from: protected */
    public VersionedParcel r() {
        Parcel parcel = this.mParcel;
        int dataPosition = this.mParcel.dataPosition();
        int i = this.aD == this.mOffset ? this.mEnd : this.aD;
        StringBuilder sb = new StringBuilder();
        sb.append(this.mPrefix);
        sb.append("  ");
        return new e(parcel, dataPosition, i, sb.toString());
    }

    public boolean readBoolean() {
        return this.mParcel.readInt() != 0;
    }

    public Bundle readBundle() {
        return this.mParcel.readBundle(getClass().getClassLoader());
    }

    public byte[] readByteArray() {
        int readInt = this.mParcel.readInt();
        if (readInt < 0) {
            return null;
        }
        byte[] bArr = new byte[readInt];
        this.mParcel.readByteArray(bArr);
        return bArr;
    }

    public double readDouble() {
        return this.mParcel.readDouble();
    }

    public float readFloat() {
        return this.mParcel.readFloat();
    }

    public int readInt() {
        return this.mParcel.readInt();
    }

    public long readLong() {
        return this.mParcel.readLong();
    }

    public String readString() {
        return this.mParcel.readString();
    }

    public IBinder readStrongBinder() {
        return this.mParcel.readStrongBinder();
    }

    public <T extends Parcelable> T s() {
        return this.mParcel.readParcelable(getClass().getClassLoader());
    }

    public void writeBoolean(boolean z) {
        this.mParcel.writeInt(z ? 1 : 0);
    }

    public void writeBundle(Bundle bundle) {
        this.mParcel.writeBundle(bundle);
    }

    public void writeByteArray(byte[] bArr) {
        if (bArr != null) {
            this.mParcel.writeInt(bArr.length);
            this.mParcel.writeByteArray(bArr);
            return;
        }
        this.mParcel.writeInt(-1);
    }

    public void writeByteArray(byte[] bArr, int i, int i2) {
        if (bArr != null) {
            this.mParcel.writeInt(bArr.length);
            this.mParcel.writeByteArray(bArr, i, i2);
            return;
        }
        this.mParcel.writeInt(-1);
    }

    public void writeDouble(double d) {
        this.mParcel.writeDouble(d);
    }

    public void writeFloat(float f) {
        this.mParcel.writeFloat(f);
    }

    public void writeInt(int i) {
        this.mParcel.writeInt(i);
    }

    public void writeLong(long j) {
        this.mParcel.writeLong(j);
    }

    public void writeString(String str) {
        this.mParcel.writeString(str);
    }

    public void writeStrongBinder(IBinder iBinder) {
        this.mParcel.writeStrongBinder(iBinder);
    }

    public void writeStrongInterface(IInterface iInterface) {
        this.mParcel.writeStrongInterface(iInterface);
    }
}
