.class public Lbytedance/framwork/core/sdkmonitor/HttpResponseException;
.super Ljava/lang/Exception;
.source "HttpResponseException.java"


# instance fields
.field public message:Ljava/lang/String;

.field public statusCode:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    iput p1, p0, Lbytedance/framwork/core/sdkmonitor/HttpResponseException;->statusCode:I

    iput-object p2, p0, Lbytedance/framwork/core/sdkmonitor/HttpResponseException;->message:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getMsg()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/HttpResponseException;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/HttpResponseException;->statusCode:I

    return v0
.end method
