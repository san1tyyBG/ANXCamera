.class final Lcom/google/zxing/datamatrix/decoder/Version$ECB;
.super Ljava/lang/Object;
.source "Version.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/zxing/datamatrix/decoder/Version;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ECB"
.end annotation


# instance fields
.field private final count:I

.field private final dataCodewords:I


# direct methods
.method private constructor <init>(II)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/zxing/datamatrix/decoder/Version$ECB;->count:I

    iput p2, p0, Lcom/google/zxing/datamatrix/decoder/Version$ECB;->dataCodewords:I

    return-void
.end method

.method synthetic constructor <init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(II)V

    return-void
.end method


# virtual methods
.method getCount()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/datamatrix/decoder/Version$ECB;->count:I

    return v0
.end method

.method getDataCodewords()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/datamatrix/decoder/Version$ECB;->dataCodewords:I

    return v0
.end method
