.class Lcom/android/camera2/vendortag/struct/AWBFrameControl$MarshalQueryableAWBFrameControl$MarshalerAWBFrameControl;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "AWBFrameControl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/vendortag/struct/AWBFrameControl$MarshalQueryableAWBFrameControl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerAWBFrameControl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler<",
        "Lcom/android/camera2/vendortag/struct/AWBFrameControl;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera2/vendortag/struct/AWBFrameControl$MarshalQueryableAWBFrameControl;


# direct methods
.method protected constructor <init>(Lcom/android/camera2/vendortag/struct/AWBFrameControl$MarshalQueryableAWBFrameControl;Landroid/hardware/camera2/utils/TypeReference;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference<",
            "Lcom/android/camera2/vendortag/struct/AWBFrameControl;",
            ">;I)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/camera2/vendortag/struct/AWBFrameControl$MarshalQueryableAWBFrameControl$MarshalerAWBFrameControl;->this$0:Lcom/android/camera2/vendortag/struct/AWBFrameControl$MarshalQueryableAWBFrameControl;

    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    return-void
.end method


# virtual methods
.method public getNativeSize()I
    .locals 1

    const/16 v0, 0x10

    return v0
.end method

.method public marshal(Lcom/android/camera2/vendortag/struct/AWBFrameControl;Ljava/nio/ByteBuffer;)V
    .locals 1

    iget v0, p1, Lcom/android/camera2/vendortag/struct/AWBFrameControl;->mRGain:F

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    iget v0, p1, Lcom/android/camera2/vendortag/struct/AWBFrameControl;->mGGain:F

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    iget v0, p1, Lcom/android/camera2/vendortag/struct/AWBFrameControl;->mBGain:F

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    iget p1, p1, Lcom/android/camera2/vendortag/struct/AWBFrameControl;->mColorTemperature:I

    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .locals 0

    check-cast p1, Lcom/android/camera2/vendortag/struct/AWBFrameControl;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera2/vendortag/struct/AWBFrameControl$MarshalQueryableAWBFrameControl$MarshalerAWBFrameControl;->marshal(Lcom/android/camera2/vendortag/struct/AWBFrameControl;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Lcom/android/camera2/vendortag/struct/AWBFrameControl;
    .locals 4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result p1

    new-instance v3, Lcom/android/camera2/vendortag/struct/AWBFrameControl;

    invoke-direct {v3, v0, v1, v2, p1}, Lcom/android/camera2/vendortag/struct/AWBFrameControl;-><init>(FFFI)V

    return-object v3
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/android/camera2/vendortag/struct/AWBFrameControl$MarshalQueryableAWBFrameControl$MarshalerAWBFrameControl;->unmarshal(Ljava/nio/ByteBuffer;)Lcom/android/camera2/vendortag/struct/AWBFrameControl;

    move-result-object p1

    return-object p1
.end method
