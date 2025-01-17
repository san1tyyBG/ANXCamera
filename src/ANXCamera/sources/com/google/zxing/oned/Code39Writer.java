package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.Map;

public final class Code39Writer extends OneDimensionalCodeWriter {
    private static void toIntArray(int i, int[] iArr) {
        for (int i2 = 0; i2 < 9; i2++) {
            int i3 = 1;
            if (((1 << (8 - i2)) & i) != 0) {
                i3 = 2;
            }
            iArr[i2] = i3;
        }
    }

    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException {
        if (barcodeFormat == BarcodeFormat.CODE_39) {
            return super.encode(str, barcodeFormat, i, i2, map);
        }
        StringBuilder sb = new StringBuilder("Can only encode CODE_39, but got ");
        sb.append(barcodeFormat);
        throw new IllegalArgumentException(sb.toString());
    }

    public boolean[] encode(String str) {
        int length = str.length();
        if (length <= 80) {
            int[] iArr = new int[9];
            int i = 25 + length;
            int i2 = 0;
            while (true) {
                if (i2 >= length) {
                    boolean[] zArr = new boolean[i];
                    toIntArray(Code39Reader.CHARACTER_ENCODINGS[39], iArr);
                    int appendPattern = appendPattern(zArr, 0, iArr, true);
                    int[] iArr2 = {1};
                    int appendPattern2 = appendPattern + appendPattern(zArr, appendPattern, iArr2, false);
                    for (int i3 = 0; i3 < length; i3++) {
                        toIntArray(Code39Reader.CHARACTER_ENCODINGS["0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%".indexOf(str.charAt(i3))], iArr);
                        int appendPattern3 = appendPattern2 + appendPattern(zArr, appendPattern2, iArr, true);
                        appendPattern2 = appendPattern3 + appendPattern(zArr, appendPattern3, iArr2, false);
                    }
                    toIntArray(Code39Reader.CHARACTER_ENCODINGS[39], iArr);
                    appendPattern(zArr, appendPattern2, iArr, true);
                    return zArr;
                }
                int indexOf = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%".indexOf(str.charAt(i2));
                if (indexOf >= 0) {
                    toIntArray(Code39Reader.CHARACTER_ENCODINGS[indexOf], iArr);
                    for (int i4 : iArr) {
                        i += i4;
                    }
                    i2++;
                } else {
                    StringBuilder sb = new StringBuilder("Bad contents: ");
                    sb.append(str);
                    throw new IllegalArgumentException(sb.toString());
                }
            }
        } else {
            StringBuilder sb2 = new StringBuilder("Requested contents should be less than 80 digits long, but got ");
            sb2.append(length);
            throw new IllegalArgumentException(sb2.toString());
        }
    }
}
