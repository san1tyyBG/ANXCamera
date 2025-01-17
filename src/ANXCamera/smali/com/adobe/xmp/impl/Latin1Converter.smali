.class public Lcom/adobe/xmp/impl/Latin1Converter;
.super Ljava/lang/Object;
.source "Latin1Converter.java"


# static fields
.field private static final STATE_START:I = 0x0

.field private static final STATE_UTF8CHAR:I = 0xb


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convert(Lcom/adobe/xmp/impl/ByteBuffer;)Lcom/adobe/xmp/impl/ByteBuffer;
    .locals 12

    const-string v0, "UTF-8"

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/ByteBuffer;->getEncoding()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/16 v0, 0x8

    new-array v1, v0, [B

    nop

    nop

    new-instance v2, Lcom/adobe/xmp/impl/ByteBuffer;

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/ByteBuffer;->length()I

    move-result v3

    mul-int/lit8 v3, v3, 0x4

    div-int/lit8 v3, v3, 0x3

    invoke-direct {v2, v3}, Lcom/adobe/xmp/impl/ByteBuffer;-><init>(I)V

    nop

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    move v6, v5

    move v7, v6

    :goto_0
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/ByteBuffer;->length()I

    move-result v8

    const/16 v9, 0xb

    if-ge v4, v8, :cond_6

    invoke-virtual {p0, v4}, Lcom/adobe/xmp/impl/ByteBuffer;->charAt(I)I

    move-result v8

    const/16 v10, 0x80

    if-eq v5, v9, :cond_3

    const/16 v11, 0x7f

    if-ge v8, v11, :cond_0

    int-to-byte v8, v8

    invoke-virtual {v2, v8}, Lcom/adobe/xmp/impl/ByteBuffer;->append(B)V

    goto :goto_3

    :cond_0
    const/16 v11, 0xc0

    if-lt v8, v11, :cond_2

    nop

    nop

    const/4 v5, -0x1

    move v6, v8

    :goto_1
    if-ge v5, v0, :cond_1

    and-int/lit16 v11, v6, 0x80

    if-ne v11, v10, :cond_1

    add-int/lit8 v5, v5, 0x1

    shl-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v6, v7, 0x1

    int-to-byte v8, v8

    aput-byte v8, v1, v7

    nop

    nop

    move v7, v6

    move v6, v5

    move v5, v9

    goto :goto_3

    :cond_2
    int-to-byte v8, v8

    invoke-static {v8}, Lcom/adobe/xmp/impl/Latin1Converter;->convertToUTF8(B)[B

    move-result-object v8

    invoke-virtual {v2, v8}, Lcom/adobe/xmp/impl/ByteBuffer;->append([B)V

    goto :goto_3

    :cond_3
    if-lez v6, :cond_5

    and-int/lit16 v9, v8, 0xc0

    if-ne v9, v10, :cond_5

    add-int/lit8 v9, v7, 0x1

    int-to-byte v8, v8

    aput-byte v8, v1, v7

    add-int/lit8 v6, v6, -0x1

    if-nez v6, :cond_4

    invoke-virtual {v2, v1, v3, v9}, Lcom/adobe/xmp/impl/ByteBuffer;->append([BII)V

    nop

    goto :goto_2

    :cond_4
    move v7, v9

    goto :goto_3

    :cond_5
    aget-byte v5, v1, v3

    invoke-static {v5}, Lcom/adobe/xmp/impl/Latin1Converter;->convertToUTF8(B)[B

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/adobe/xmp/impl/ByteBuffer;->append([B)V

    sub-int/2addr v4, v7

    nop

    nop

    :goto_2
    move v5, v3

    move v7, v5

    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_6
    if-ne v5, v9, :cond_7

    :goto_4
    if-ge v3, v7, :cond_7

    aget-byte p0, v1, v3

    invoke-static {p0}, Lcom/adobe/xmp/impl/Latin1Converter;->convertToUTF8(B)[B

    move-result-object p0

    invoke-virtual {v2, p0}, Lcom/adobe/xmp/impl/ByteBuffer;->append([B)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_7
    return-object v2

    :cond_8
    return-object p0
.end method

.method private static convertToUTF8(B)[B
    .locals 5

    and-int/lit16 v0, p0, 0xff

    const/16 v1, 0x80

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lt v0, v1, :cond_2

    const/16 v1, 0x81

    if-eq v0, v1, :cond_1

    const/16 v1, 0x8d

    if-eq v0, v1, :cond_1

    const/16 v1, 0x8f

    if-eq v0, v1, :cond_1

    const/16 v1, 0x90

    if-eq v0, v1, :cond_1

    const/16 v1, 0x9d

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    new-instance v0, Ljava/lang/String;

    new-array v1, v3, [B

    aput-byte p0, v1, v2

    const-string v4, "cp1252"

    invoke-direct {v0, v1, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0

    :cond_1
    :goto_0
    new-array v0, v3, [B

    const/16 v1, 0x20

    aput-byte v1, v0, v2
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    goto :goto_1

    :cond_2
    nop

    :goto_1
    new-array v0, v3, [B

    aput-byte p0, v0, v2

    return-object v0
.end method
