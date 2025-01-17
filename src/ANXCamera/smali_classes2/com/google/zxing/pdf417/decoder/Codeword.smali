.class final Lcom/google/zxing/pdf417/decoder/Codeword;
.super Ljava/lang/Object;
.source "Codeword.java"


# static fields
.field private static final BARCODE_ROW_UNKNOWN:I = -0x1


# instance fields
.field private final bucket:I

.field private final endX:I

.field private rowNumber:I

.field private final startX:I

.field private final value:I


# direct methods
.method constructor <init>(IIII)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->rowNumber:I

    iput p1, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->startX:I

    iput p2, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->endX:I

    iput p3, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->bucket:I

    iput p4, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->value:I

    return-void
.end method


# virtual methods
.method getBucket()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->bucket:I

    return v0
.end method

.method getEndX()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->endX:I

    return v0
.end method

.method getRowNumber()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->rowNumber:I

    return v0
.end method

.method getStartX()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->startX:I

    return v0
.end method

.method getValue()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->value:I

    return v0
.end method

.method getWidth()I
    .registers 3

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->endX:I

    iget v1, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->startX:I

    sub-int/2addr v0, v1

    return v0
.end method

.method hasValidRowNumber()Z
    .registers 2

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->rowNumber:I

    invoke-virtual {p0, v0}, Lcom/google/zxing/pdf417/decoder/Codeword;->isValidRowNumber(I)Z

    move-result v0

    return v0
.end method

.method isValidRowNumber(I)Z
    .registers 4

    const/4 v0, -0x1

    if-eq p1, v0, :cond_d

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->bucket:I

    rem-int/lit8 v1, p1, 0x3

    mul-int/lit8 v1, v1, 0x3

    if-ne v0, v1, :cond_d

    const/4 v0, 0x1

    return v0

    :cond_d
    const/4 v0, 0x0

    return v0
.end method

.method setRowNumber(I)V
    .registers 2

    iput p1, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->rowNumber:I

    return-void
.end method

.method setRowNumberAsRowIndicatorColumn()V
    .registers 3

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->value:I

    div-int/lit8 v0, v0, 0x1e

    mul-int/lit8 v0, v0, 0x3

    iget v1, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->bucket:I

    div-int/lit8 v1, v1, 0x3

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->rowNumber:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->rowNumber:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/pdf417/decoder/Codeword;->value:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
