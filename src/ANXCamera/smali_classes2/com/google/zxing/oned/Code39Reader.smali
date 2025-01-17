.class public final Lcom/google/zxing/oned/Code39Reader;
.super Lcom/google/zxing/oned/OneDReader;
.source "Code39Reader.java"


# static fields
.field private static final ALPHABET:[C

.field static final ALPHABET_STRING:Ljava/lang/String; = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%"

.field private static final ASTERISK_ENCODING:I

.field static final CHARACTER_ENCODINGS:[I


# instance fields
.field private final counters:[I

.field private final decodeRowResult:Ljava/lang/StringBuilder;

.field private final extendedMode:Z

.field private final usingCheckDigit:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-string v0, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/google/zxing/oned/Code39Reader;->ALPHABET:[C

    const/16 v0, 0x2c

    new-array v0, v0, [I

    fill-array-data v0, :array_20

    nop

    nop

    nop

    nop

    nop

    sput-object v0, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    sget-object v0, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    const/16 v1, 0x27

    aget v0, v0, v1

    sput v0, Lcom/google/zxing/oned/Code39Reader;->ASTERISK_ENCODING:I

    return-void

    nop

    :array_20
    .array-data 4
        0x34
        0x121
        0x61
        0x160
        0x31
        0x130
        0x70
        0x25
        0x124
        0x64
        0x109
        0x49
        0x148
        0x19
        0x118
        0x58
        0xd
        0x10c
        0x4c
        0x1c
        0x103
        0x43
        0x142
        0x13
        0x112
        0x52
        0x7
        0x106
        0x46
        0x16
        0x181
        0xc1
        0x1c0
        0x91
        0x190
        0xd0
        0x85
        0x184
        0xc4
        0x94
        0xa8
        0xa2
        0x8a
        0x2a
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/zxing/oned/Code39Reader;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Z)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/zxing/oned/Code39Reader;-><init>(ZZ)V

    return-void
.end method

.method public constructor <init>(ZZ)V
    .registers 5

    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    iput-boolean p1, p0, Lcom/google/zxing/oned/Code39Reader;->usingCheckDigit:Z

    iput-boolean p2, p0, Lcom/google/zxing/oned/Code39Reader;->extendedMode:Z

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/google/zxing/oned/Code39Reader;->decodeRowResult:Ljava/lang/StringBuilder;

    const/16 v0, 0x9

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/Code39Reader;->counters:[I

    return-void
.end method

.method private static decodeExtended(Ljava/lang/CharSequence;)Ljava/lang/String;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v2, 0x0

    :goto_a
    if-lt v2, v0, :cond_11

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    :cond_11
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    const/16 v4, 0x2f

    const/16 v5, 0x2b

    if-eq v3, v5, :cond_2a

    const/16 v6, 0x24

    if-eq v3, v6, :cond_2a

    const/16 v6, 0x25

    if-eq v3, v6, :cond_2a

    if-ne v3, v4, :cond_26

    goto :goto_2a

    :cond_26
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_87

    :cond_2a
    :goto_2a
    add-int/lit8 v6, v2, 0x1

    invoke-interface {p0, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    const/4 v7, 0x0

    const/16 v8, 0x5a

    const/16 v9, 0x41

    if-eq v3, v5, :cond_79

    if-eq v3, v4, :cond_65

    packed-switch v3, :pswitch_data_90

    goto :goto_81

    :pswitch_3d
    if-lt v6, v9, :cond_47

    const/16 v4, 0x45

    if-gt v6, v4, :cond_47

    add-int/lit8 v4, v6, -0x26

    int-to-char v7, v4

    goto :goto_81

    :cond_47
    const/16 v4, 0x46

    if-lt v6, v4, :cond_53

    const/16 v4, 0x57

    if-gt v6, v4, :cond_53

    add-int/lit8 v4, v6, -0xb

    int-to-char v7, v4

    goto :goto_81

    :cond_53
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v4

    throw v4

    :pswitch_58
    if-lt v6, v9, :cond_60

    if-gt v6, v8, :cond_60

    add-int/lit8 v4, v6, -0x40

    int-to-char v7, v4

    goto :goto_81

    :cond_60
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v4

    throw v4

    :cond_65
    if-lt v6, v9, :cond_6f

    const/16 v4, 0x4f

    if-gt v6, v4, :cond_6f

    add-int/lit8 v4, v6, -0x20

    int-to-char v7, v4

    goto :goto_81

    :cond_6f
    if-ne v6, v8, :cond_74

    const/16 v7, 0x3a

    goto :goto_81

    :cond_74
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v4

    throw v4

    :cond_79
    if-lt v6, v9, :cond_8a

    if-gt v6, v8, :cond_8a

    add-int/lit8 v4, v6, 0x20

    int-to-char v7, v4

    nop

    :goto_81
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    nop

    :goto_87
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    :cond_8a
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v4

    throw v4

    nop

    :pswitch_data_90
    .packed-switch 0x24
        :pswitch_58
        :pswitch_3d
    .end packed-switch
.end method

.method private static findAsteriskPattern(Lcom/google/zxing/common/BitArray;[I)[I
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v2

    const/4 v3, 0x0

    move v4, v2

    const/4 v5, 0x0

    array-length v6, p1

    move v7, v2

    :goto_e
    if-ge v7, v0, :cond_63

    invoke-virtual {p0, v7}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v8

    xor-int/2addr v8, v5

    const/4 v9, 0x1

    if-eqz v8, :cond_1e

    aget v8, p1, v3

    add-int/2addr v8, v9

    aput v8, p1, v3

    goto :goto_60

    :cond_1e
    add-int/lit8 v8, v6, -0x1

    if-ne v3, v8, :cond_57

    invoke-static {p1}, Lcom/google/zxing/oned/Code39Reader;->toNarrowWidePattern([I)I

    move-result v8

    sget v10, Lcom/google/zxing/oned/Code39Reader;->ASTERISK_ENCODING:I

    const/4 v11, 0x2

    if-ne v8, v10, :cond_41

    sub-int v8, v7, v4

    div-int/2addr v8, v11

    sub-int v8, v4, v8

    invoke-static {v1, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    invoke-virtual {p0, v8, v4, v1}, Lcom/google/zxing/common/BitArray;->isRange(IIZ)Z

    move-result v8

    if-eqz v8, :cond_41

    new-array v8, v11, [I

    aput v4, v8, v1

    aput v7, v8, v9

    return-object v8

    :cond_41
    aget v8, p1, v1

    aget v10, p1, v9

    add-int/2addr v8, v10

    add-int/2addr v4, v8

    add-int/lit8 v8, v6, -0x2

    invoke-static {p1, v11, p1, v1, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v8, v6, -0x2

    aput v1, p1, v8

    add-int/lit8 v8, v6, -0x1

    aput v1, p1, v8

    add-int/lit8 v3, v3, -0x1

    goto :goto_59

    :cond_57
    add-int/lit8 v3, v3, 0x1

    :goto_59
    aput v9, p1, v3

    if-eqz v5, :cond_5f

    move v9, v1

    nop

    :cond_5f
    move v5, v9

    :goto_60
    add-int/lit8 v7, v7, 0x1

    goto :goto_e

    :cond_63
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method private static patternToChar(I)C
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/4 v0, 0x0

    :goto_1
    sget-object v1, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    array-length v1, v1

    if-ge v0, v1, :cond_14

    sget-object v1, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    aget v1, v1, v0

    if-ne v1, p0, :cond_11

    sget-object v1, Lcom/google/zxing/oned/Code39Reader;->ALPHABET:[C

    aget-char v1, v1, v0

    return v1

    :cond_11
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_14
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method private static toNarrowWidePattern([I)I
    .registers 12

    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_3
    const v3, 0x7fffffff

    array-length v4, p0

    move v5, v3

    move v3, v1

    :goto_9
    if-lt v3, v4, :cond_42

    move v6, v5

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x0

    :goto_10
    if-lt v7, v0, :cond_31

    const/4 v7, 0x3

    const/4 v8, -0x1

    if-ne v2, v7, :cond_2b

    const/4 v1, 0x0

    :goto_17
    if-ge v1, v0, :cond_2a

    if-gtz v2, :cond_1c

    goto :goto_2a

    :cond_1c
    aget v7, p0, v1

    if-le v7, v6, :cond_27

    add-int/lit8 v2, v2, -0x1

    mul-int/lit8 v9, v7, 0x2

    if-lt v9, v3, :cond_27

    return v8

    :cond_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    :cond_2a
    :goto_2a
    return v4

    :cond_2b
    nop

    if-gt v2, v7, :cond_2f

    return v8

    :cond_2f
    move v2, v6

    goto :goto_3

    :cond_31
    aget v8, p0, v7

    if-le v8, v6, :cond_3f

    add-int/lit8 v9, v0, -0x1

    sub-int/2addr v9, v7

    const/4 v10, 0x1

    shl-int v9, v10, v9

    or-int/2addr v4, v9

    add-int/lit8 v2, v2, 0x1

    add-int/2addr v3, v8

    :cond_3f
    add-int/lit8 v7, v7, 0x1

    goto :goto_10

    :cond_42
    aget v6, p0, v3

    if-ge v6, v5, :cond_49

    if-le v6, v2, :cond_49

    move v5, v6

    :cond_49
    add-int/lit8 v3, v3, 0x1

    goto :goto_9
.end method


# virtual methods
.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    iget-object v3, v0, Lcom/google/zxing/oned/Code39Reader;->counters:[I

    const/4 v4, 0x0

    invoke-static {v3, v4}, Ljava/util/Arrays;->fill([II)V

    iget-object v5, v0, Lcom/google/zxing/oned/Code39Reader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    invoke-static {v2, v3}, Lcom/google/zxing/oned/Code39Reader;->findAsteriskPattern(Lcom/google/zxing/common/BitArray;[I)[I

    move-result-object v6

    const/4 v7, 0x1

    aget v8, v6, v7

    invoke-virtual {v2, v8}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v8

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v9

    :goto_20
    invoke-static {v2, v8, v3}, Lcom/google/zxing/oned/Code39Reader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    invoke-static {v3}, Lcom/google/zxing/oned/Code39Reader;->toNarrowWidePattern([I)I

    move-result v10

    if-ltz v10, :cond_10b

    invoke-static {v10}, Lcom/google/zxing/oned/Code39Reader;->patternToChar(I)C

    move-result v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v12, v8

    array-length v13, v3

    move v14, v8

    move v8, v4

    :goto_34
    if-lt v8, v13, :cond_f9

    invoke-virtual {v2, v14}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v8

    const/16 v10, 0x2a

    if-ne v11, v10, :cond_f5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    sub-int/2addr v10, v7

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->setLength(I)V

    const/4 v10, 0x0

    array-length v13, v3

    move v14, v10

    move v10, v4

    :goto_4a
    if-lt v10, v13, :cond_e3

    sub-int v10, v8, v12

    sub-int/2addr v10, v14

    if-eq v8, v9, :cond_5b

    mul-int/lit8 v13, v10, 0x2

    if-lt v13, v14, :cond_56

    goto :goto_5b

    :cond_56
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v4

    throw v4

    :cond_5b
    :goto_5b
    iget-boolean v13, v0, Lcom/google/zxing/oned/Code39Reader;->usingCheckDigit:Z

    if-eqz v13, :cond_97

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v13

    sub-int/2addr v13, v7

    const/4 v15, 0x0

    const/16 v16, 0x0

    move/from16 v20, v16

    move/from16 v16, v15

    move/from16 v15, v20

    :goto_6d
    if-lt v15, v13, :cond_84

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v15

    sget-object v17, Lcom/google/zxing/oned/Code39Reader;->ALPHABET:[C

    rem-int/lit8 v18, v16, 0x2b

    aget-char v4, v17, v18

    if-ne v15, v4, :cond_7f

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_97

    :cond_7f
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v4

    throw v4

    :cond_84
    const-string v4, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%"

    iget-object v7, v0, Lcom/google/zxing/oned/Code39Reader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    add-int v16, v16, v4

    add-int/lit8 v15, v15, 0x1

    const/4 v4, 0x0

    const/4 v7, 0x1

    goto :goto_6d

    :cond_97
    :goto_97
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-eqz v4, :cond_dc

    iget-boolean v4, v0, Lcom/google/zxing/oned/Code39Reader;->extendedMode:Z

    if-eqz v4, :cond_a6

    invoke-static {v5}, Lcom/google/zxing/oned/Code39Reader;->decodeExtended(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    goto :goto_aa

    :cond_a6
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_aa
    const/4 v7, 0x1

    aget v13, v6, v7

    const/4 v7, 0x0

    aget v15, v6, v7

    add-int/2addr v13, v15

    int-to-float v7, v13

    const/high16 v13, 0x40000000    # 2.0f

    div-float/2addr v7, v13

    int-to-float v15, v12

    int-to-float v0, v14

    div-float/2addr v0, v13

    add-float/2addr v15, v0

    new-instance v0, Lcom/google/zxing/Result;

    nop

    nop

    const/4 v13, 0x2

    new-array v13, v13, [Lcom/google/zxing/ResultPoint;

    new-instance v2, Lcom/google/zxing/ResultPoint;

    move-object/from16 v19, v5

    int-to-float v5, v1

    invoke-direct {v2, v7, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v5, 0x0

    aput-object v2, v13, v5

    new-instance v2, Lcom/google/zxing/ResultPoint;

    int-to-float v5, v1

    invoke-direct {v2, v15, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/16 v16, 0x1

    aput-object v2, v13, v16

    sget-object v2, Lcom/google/zxing/BarcodeFormat;->CODE_39:Lcom/google/zxing/BarcodeFormat;

    const/4 v5, 0x0

    invoke-direct {v0, v4, v5, v13, v2}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v0

    :cond_dc
    move-object/from16 v19, v5

    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    :cond_e3
    move-object/from16 v19, v5

    move/from16 v16, v7

    move v5, v4

    aget v0, v3, v10

    add-int/2addr v14, v0

    add-int/lit8 v10, v10, 0x1

    move-object/from16 v5, v19

    move-object/from16 v0, p0

    move-object/from16 v2, p2

    goto/16 :goto_4a

    :cond_f5
    move-object/from16 v19, v5

    goto/16 :goto_20

    :cond_f9
    move-object/from16 v19, v5

    move/from16 v16, v7

    move v5, v4

    aget v0, v3, v8

    add-int/2addr v14, v0

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v5, v19

    move-object/from16 v0, p0

    move-object/from16 v2, p2

    goto/16 :goto_34

    :cond_10b
    move-object/from16 v19, v5

    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method
