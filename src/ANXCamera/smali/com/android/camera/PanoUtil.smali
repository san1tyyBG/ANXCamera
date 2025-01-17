.class public Lcom/android/camera/PanoUtil;
.super Ljava/lang/Object;
.source "PanoUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static calculateDifferenceBetweenAngles(DD)D
    .locals 7

    sub-double v0, p2, p0

    const-wide v2, 0x4076800000000000L    # 360.0

    rem-double/2addr v0, v2

    const-wide/16 v4, 0x0

    cmpg-double v6, v0, v4

    if-gez v6, :cond_0

    add-double/2addr v0, v2

    :cond_0
    sub-double/2addr p0, p2

    rem-double/2addr p0, v2

    cmpg-double p2, p0, v4

    if-gez p2, :cond_1

    add-double/2addr p0, v2

    :cond_1
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->min(DD)D

    move-result-wide p0

    return-wide p0
.end method

.method public static createByteBuffer([B)Ljava/nio/ByteBuffer;
    .locals 2

    array-length v0, p0

    invoke-static {v0}, Lcom/android/camera/panorama/NativeMemoryAllocator;->allocateBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    return-object v0
.end method

.method public static createName(Ljava/lang/String;J)Ljava/lang/String;
    .locals 1

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    new-instance p1, Ljava/text/SimpleDateFormat;

    invoke-direct {p1, p0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static decodeYUV420SPQuarterRes([I[BII)V
    .locals 17

    move/from16 v0, p2

    move/from16 v1, p3

    mul-int v2, v0, v1

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_0
    if-ge v4, v1, :cond_9

    shr-int/lit8 v6, v4, 0x1

    mul-int/2addr v6, v0

    add-int/2addr v6, v2

    move v7, v3

    move v8, v7

    move v9, v5

    move v5, v8

    :goto_1
    if-ge v5, v0, :cond_8

    mul-int v10, v4, v0

    add-int/2addr v10, v5

    aget-byte v10, p1, v10

    const/16 v11, 0xff

    and-int/2addr v10, v11

    add-int/lit8 v10, v10, -0x10

    if-gez v10, :cond_0

    nop

    move v10, v3

    :cond_0
    and-int/lit8 v12, v5, 0x1

    if-nez v12, :cond_1

    add-int/lit8 v7, v6, 0x1

    aget-byte v6, p1, v6

    and-int/2addr v6, v11

    add-int/lit8 v6, v6, -0x80

    add-int/lit8 v8, v7, 0x1

    aget-byte v7, p1, v7

    and-int/2addr v7, v11

    add-int/lit8 v7, v7, -0x80

    add-int/lit8 v8, v8, 0x2

    move/from16 v16, v7

    move v7, v6

    move v6, v8

    move/from16 v8, v16

    :cond_1
    const/16 v12, 0x4a8

    mul-int/2addr v12, v10

    const/16 v10, 0x662

    mul-int/2addr v10, v7

    add-int/2addr v10, v12

    const/16 v13, 0x341

    mul-int/2addr v13, v7

    sub-int v13, v12, v13

    const/16 v14, 0x190

    mul-int/2addr v14, v8

    sub-int/2addr v13, v14

    const/16 v14, 0x812

    mul-int/2addr v14, v8

    add-int/2addr v12, v14

    const v14, 0x3ffff

    if-gez v10, :cond_2

    nop

    move v10, v3

    goto :goto_2

    :cond_2
    if-le v10, v14, :cond_3

    nop

    move v10, v14

    :cond_3
    :goto_2
    if-gez v13, :cond_4

    nop

    move v13, v3

    goto :goto_3

    :cond_4
    if-le v13, v14, :cond_5

    nop

    move v13, v14

    :cond_5
    :goto_3
    if-gez v12, :cond_6

    nop

    move v12, v3

    goto :goto_4

    :cond_6
    if-le v12, v14, :cond_7

    nop

    move v12, v14

    :cond_7
    :goto_4
    const/high16 v14, -0x1000000

    shl-int/lit8 v10, v10, 0x6

    const/high16 v15, 0xff0000

    and-int/2addr v10, v15

    or-int/2addr v10, v14

    shr-int/lit8 v13, v13, 0x2

    const v14, 0xff00

    and-int/2addr v13, v14

    or-int/2addr v10, v13

    shr-int/lit8 v12, v12, 0xa

    and-int/2addr v11, v12

    or-int/2addr v10, v11

    aput v10, p0, v9

    add-int/lit8 v5, v5, 0x4

    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    :cond_8
    add-int/lit8 v4, v4, 0x4

    move v5, v9

    goto/16 :goto_0

    :cond_9
    return-void
.end method
