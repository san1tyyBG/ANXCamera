.class Lcom/android/gallery3d/exif/ExifModifier;
.super Ljava/lang/Object;
.source "ExifModifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/gallery3d/exif/ExifModifier$TagOffset;
    }
.end annotation


# static fields
.field public static final DEBUG:Z = false

.field public static final TAG:Ljava/lang/String; = "ExifModifier"


# instance fields
.field private final mByteBuffer:Ljava/nio/ByteBuffer;

.field private final mInterface:Lcom/android/gallery3d/exif/ExifInterface;

.field private mOffsetBase:I

.field private final mTagOffsets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/gallery3d/exif/ExifModifier$TagOffset;",
            ">;"
        }
    .end annotation
.end field

.field private final mTagToModified:Lcom/android/gallery3d/exif/ExifData;


# direct methods
.method protected constructor <init>(Ljava/nio/ByteBuffer;Lcom/android/gallery3d/exif/ExifInterface;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/gallery3d/exif/ExifInvalidFormatException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifModifier;->mTagOffsets:Ljava/util/List;

    iput-object p1, p0, Lcom/android/gallery3d/exif/ExifModifier;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    iput v0, p0, Lcom/android/gallery3d/exif/ExifModifier;->mOffsetBase:I

    iput-object p2, p0, Lcom/android/gallery3d/exif/ExifModifier;->mInterface:Lcom/android/gallery3d/exif/ExifInterface;

    nop

    const/4 p2, 0x0

    :try_start_0
    new-instance v0, Lcom/android/gallery3d/exif/ByteBufferInputStream;

    invoke-direct {v0, p1}, Lcom/android/gallery3d/exif/ByteBufferInputStream;-><init>(Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object p1, p0, Lcom/android/gallery3d/exif/ExifModifier;->mInterface:Lcom/android/gallery3d/exif/ExifInterface;

    invoke-static {v0, p1}, Lcom/android/gallery3d/exif/ExifParser;->parse(Ljava/io/InputStream;Lcom/android/gallery3d/exif/ExifInterface;)Lcom/android/gallery3d/exif/ExifParser;

    move-result-object p1

    new-instance p2, Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifParser;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-direct {p2, v1}, Lcom/android/gallery3d/exif/ExifData;-><init>(Ljava/nio/ByteOrder;)V

    iput-object p2, p0, Lcom/android/gallery3d/exif/ExifModifier;->mTagToModified:Lcom/android/gallery3d/exif/ExifData;

    iget p2, p0, Lcom/android/gallery3d/exif/ExifModifier;->mOffsetBase:I

    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifParser;->getTiffStartPosition()I

    move-result p1

    add-int/2addr p2, p1

    iput p2, p0, Lcom/android/gallery3d/exif/ExifModifier;->mOffsetBase:I

    iget-object p1, p0, Lcom/android/gallery3d/exif/ExifModifier;->mByteBuffer:Ljava/nio/ByteBuffer;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v0}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    nop

    return-void

    :catchall_0
    move-exception p1

    goto :goto_0

    :catchall_1
    move-exception p1

    move-object v0, p2

    :goto_0
    invoke-static {v0}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    throw p1
.end method

.method private modify()V
    .locals 3

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifModifier;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifModifier;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifModifier;->mTagOffsets:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/gallery3d/exif/ExifModifier$TagOffset;

    iget-object v2, v1, Lcom/android/gallery3d/exif/ExifModifier$TagOffset;->mTag:Lcom/android/gallery3d/exif/ExifTag;

    iget v1, v1, Lcom/android/gallery3d/exif/ExifModifier$TagOffset;->mOffset:I

    invoke-direct {p0, v2, v1}, Lcom/android/gallery3d/exif/ExifModifier;->writeTagValue(Lcom/android/gallery3d/exif/ExifTag;I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private writeTagValue(Lcom/android/gallery3d/exif/ExifTag;I)V
    .locals 5

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifModifier;->mByteBuffer:Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/android/gallery3d/exif/ExifModifier;->mOffsetBase:I

    add-int/2addr p2, v1

    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getDataType()S

    move-result p2

    const/4 v0, 0x0

    packed-switch p2, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_3

    :pswitch_1
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result p2

    :goto_0
    if-ge v0, p2, :cond_0

    invoke-virtual {p1, v0}, Lcom/android/gallery3d/exif/ExifTag;->getRational(I)Lcom/android/gallery3d/exif/Rational;

    move-result-object v1

    iget-object v2, p0, Lcom/android/gallery3d/exif/ExifModifier;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Lcom/android/gallery3d/exif/Rational;->getNumerator()J

    move-result-wide v3

    long-to-int v3, v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/android/gallery3d/exif/ExifModifier;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Lcom/android/gallery3d/exif/Rational;->getDenominator()J

    move-result-wide v3

    long-to-int v1, v3

    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    goto :goto_3

    :pswitch_2
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result p2

    :goto_1
    if-ge v0, p2, :cond_1

    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifModifier;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Lcom/android/gallery3d/exif/ExifTag;->getValueAt(I)J

    move-result-wide v2

    long-to-int v2, v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    goto :goto_3

    :pswitch_3
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result p2

    :goto_2
    if-ge v0, p2, :cond_3

    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifModifier;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Lcom/android/gallery3d/exif/ExifTag;->getValueAt(I)J

    move-result-wide v2

    long-to-int v2, v2

    int-to-short v2, v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :pswitch_4
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getStringByte()[B

    move-result-object p2

    array-length v1, p2

    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result p1

    if-ne v1, p1, :cond_2

    array-length p1, p2

    add-int/lit8 p1, p1, -0x1

    aput-byte v0, p2, p1

    iget-object p1, p0, Lcom/android/gallery3d/exif/ExifModifier;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    goto :goto_3

    :cond_2
    iget-object p1, p0, Lcom/android/gallery3d/exif/ExifModifier;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    iget-object p1, p0, Lcom/android/gallery3d/exif/ExifModifier;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_3

    :pswitch_5
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result p2

    new-array p2, p2, [B

    invoke-virtual {p1, p2}, Lcom/android/gallery3d/exif/ExifTag;->getBytes([B)V

    iget-object p1, p0, Lcom/android/gallery3d/exif/ExifModifier;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    nop

    :cond_3
    :goto_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_5
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method protected commit()Z
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/gallery3d/exif/ExifInvalidFormatException;
        }
    .end annotation

    nop

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lcom/android/gallery3d/exif/ByteBufferInputStream;

    iget-object v2, p0, Lcom/android/gallery3d/exif/ExifModifier;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-direct {v1, v2}, Lcom/android/gallery3d/exif/ByteBufferInputStream;-><init>(Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    nop

    const/4 v2, 0x5

    :try_start_1
    new-array v3, v2, [Lcom/android/gallery3d/exif/IfdData;

    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifModifier;->mTagToModified:Lcom/android/gallery3d/exif/ExifData;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v4

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifModifier;->mTagToModified:Lcom/android/gallery3d/exif/ExifData;

    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v4

    aput-object v4, v3, v6

    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifModifier;->mTagToModified:Lcom/android/gallery3d/exif/ExifData;

    const/4 v7, 0x2

    invoke-virtual {v4, v7}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v4

    aput-object v4, v3, v7

    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifModifier;->mTagToModified:Lcom/android/gallery3d/exif/ExifData;

    const/4 v8, 0x3

    invoke-virtual {v4, v8}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v4

    aput-object v4, v3, v8

    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifModifier;->mTagToModified:Lcom/android/gallery3d/exif/ExifData;

    const/4 v9, 0x4

    invoke-virtual {v4, v9}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v4

    aput-object v4, v3, v9

    aget-object v4, v3, v5

    if-eqz v4, :cond_0

    nop

    move v4, v6

    goto :goto_0

    :cond_0
    move v4, v5

    :goto_0
    aget-object v10, v3, v6

    if-eqz v10, :cond_1

    or-int/lit8 v4, v4, 0x2

    :cond_1
    aget-object v7, v3, v7

    if-eqz v7, :cond_2

    or-int/lit8 v4, v4, 0x4

    :cond_2
    aget-object v7, v3, v9

    if-eqz v7, :cond_3

    or-int/lit8 v4, v4, 0x8

    :cond_3
    aget-object v7, v3, v8

    if-eqz v7, :cond_4

    or-int/lit8 v4, v4, 0x10

    :cond_4
    iget-object v7, p0, Lcom/android/gallery3d/exif/ExifModifier;->mInterface:Lcom/android/gallery3d/exif/ExifInterface;

    invoke-static {v1, v4, v7}, Lcom/android/gallery3d/exif/ExifParser;->parse(Ljava/io/InputStream;ILcom/android/gallery3d/exif/ExifInterface;)Lcom/android/gallery3d/exif/ExifParser;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/gallery3d/exif/ExifParser;->next()I

    move-result v7

    nop

    :goto_1
    if-eq v7, v2, :cond_8

    packed-switch v7, :pswitch_data_0

    goto :goto_3

    :pswitch_0
    invoke-virtual {v4}, Lcom/android/gallery3d/exif/ExifParser;->getTag()Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/gallery3d/exif/ExifTag;->getTagId()S

    move-result v8

    invoke-virtual {v0, v8}, Lcom/android/gallery3d/exif/IfdData;->getTag(S)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v8

    if-eqz v8, :cond_7

    invoke-virtual {v8}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result v9

    invoke-virtual {v7}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result v10

    if-ne v9, v10, :cond_6

    invoke-virtual {v8}, Lcom/android/gallery3d/exif/ExifTag;->getDataType()S

    move-result v9

    invoke-virtual {v7}, Lcom/android/gallery3d/exif/ExifTag;->getDataType()S

    move-result v10

    if-eq v9, v10, :cond_5

    goto :goto_2

    :cond_5
    iget-object v9, p0, Lcom/android/gallery3d/exif/ExifModifier;->mTagOffsets:Ljava/util/List;

    new-instance v10, Lcom/android/gallery3d/exif/ExifModifier$TagOffset;

    invoke-virtual {v7}, Lcom/android/gallery3d/exif/ExifTag;->getOffset()I

    move-result v11

    invoke-direct {v10, v8, v11}, Lcom/android/gallery3d/exif/ExifModifier$TagOffset;-><init>(Lcom/android/gallery3d/exif/ExifTag;I)V

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v7}, Lcom/android/gallery3d/exif/ExifTag;->getTagId()S

    move-result v7

    invoke-virtual {v0, v7}, Lcom/android/gallery3d/exif/IfdData;->removeTag(S)V

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/IfdData;->getTagCount()I

    move-result v7

    if-nez v7, :cond_7

    invoke-virtual {v4}, Lcom/android/gallery3d/exif/ExifParser;->skipRemainingTagsInCurrentIfd()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :cond_6
    :goto_2
    nop

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    return v5

    :pswitch_1
    :try_start_2
    invoke-virtual {v4}, Lcom/android/gallery3d/exif/ExifParser;->getCurrentIfd()I

    move-result v0

    aget-object v0, v3, v0

    if-nez v0, :cond_7

    invoke-virtual {v4}, Lcom/android/gallery3d/exif/ExifParser;->skipRemainingTagsInCurrentIfd()V

    :cond_7
    :goto_3
    invoke-virtual {v4}, Lcom/android/gallery3d/exif/ExifParser;->next()I

    move-result v7

    goto :goto_1

    :cond_8
    array-length v0, v3

    move v2, v5

    :goto_4
    if-ge v2, v0, :cond_a

    aget-object v4, v3, v2

    if-eqz v4, :cond_9

    invoke-virtual {v4}, Lcom/android/gallery3d/exif/IfdData;->getTagCount()I

    move-result v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-lez v4, :cond_9

    nop

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    return v5

    :cond_9
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_a
    :try_start_3
    invoke-direct {p0}, Lcom/android/gallery3d/exif/ExifModifier;->modify()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    nop

    return v6

    :catchall_0
    move-exception v0

    goto :goto_5

    :catchall_1
    move-exception v1

    move-object v12, v1

    move-object v1, v0

    move-object v0, v12

    :goto_5
    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->closeSilently(Ljava/io/Closeable;)V

    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected getByteOrder()Ljava/nio/ByteOrder;
    .locals 1

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifModifier;->mTagToModified:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    return-object v0
.end method

.method public modifyTag(Lcom/android/gallery3d/exif/ExifTag;)V
    .locals 1

    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifModifier;->mTagToModified:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0, p1}, Lcom/android/gallery3d/exif/ExifData;->addTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    return-void
.end method
