.class public abstract Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;
.super Ljava/lang/Object;
.source "BaseInterceptor.java"


# instance fields
.field private isEnabled:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;->isEnabled:Z

    return-void
.end method


# virtual methods
.method public enable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;->isEnabled:Z

    return-void
.end method

.method public abstract intercept(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)Z
.end method

.method public isEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;->isEnabled:Z

    return v0
.end method
