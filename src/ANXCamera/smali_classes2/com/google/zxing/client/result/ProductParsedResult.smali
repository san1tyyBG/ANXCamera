.class public final Lcom/google/zxing/client/result/ProductParsedResult;
.super Lcom/google/zxing/client/result/ParsedResult;
.source "ProductParsedResult.java"


# instance fields
.field private final normalizedProductID:Ljava/lang/String;

.field private final productID:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1, p1}, Lcom/google/zxing/client/result/ProductParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    sget-object v0, Lcom/google/zxing/client/result/ParsedResultType;->PRODUCT:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-direct {p0, v0}, Lcom/google/zxing/client/result/ParsedResult;-><init>(Lcom/google/zxing/client/result/ParsedResultType;)V

    iput-object p1, p0, Lcom/google/zxing/client/result/ProductParsedResult;->productID:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/zxing/client/result/ProductParsedResult;->normalizedProductID:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDisplayResult()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ProductParsedResult;->productID:Ljava/lang/String;

    return-object v0
.end method

.method public getNormalizedProductID()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ProductParsedResult;->normalizedProductID:Ljava/lang/String;

    return-object v0
.end method

.method public getProductID()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ProductParsedResult;->productID:Ljava/lang/String;

    return-object v0
.end method
