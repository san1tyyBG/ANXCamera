.class public Lcom/android/camera/fragment/BaseFragmentOperation;
.super Ljava/lang/Object;
.source "BaseFragmentOperation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/BaseFragmentOperation$OperateFragment;
    }
.end annotation


# static fields
.field public static final OPERATE_HIDE_CURRENT:I = 0x7

.field public static final OPERATE_POP_AND_CLEAR_OTHERS:I = 0x5

.field public static final OPERATE_PUSH:I = 0x4

.field public static final OPERATE_REMOVE:I = 0x2

.field public static final OPERATE_REMOVE_CURRENT:I = 0x3

.field public static final OPERATE_REPLACE:I = 0x1

.field public static final OPERATE_SHOW:I = 0x6

.field public static final OPERATE_UNKNOWN:I = -0x1


# instance fields
.field public containerViewId:I
    .annotation build Landroid/support/annotation/IdRes;
    .end annotation
.end field

.field public operateType:I

.field public pendingFragmentInfo:I


# direct methods
.method private constructor <init>(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    iput p1, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->containerViewId:I

    return-void
.end method

.method private checkOperation()V
    .locals 2

    iget v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    if-gtz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "already set!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static create(I)Lcom/android/camera/fragment/BaseFragmentOperation;
    .locals 1
    .param p0    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param

    new-instance v0, Lcom/android/camera/fragment/BaseFragmentOperation;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/BaseFragmentOperation;-><init>(I)V

    return-object v0
.end method


# virtual methods
.method public hideCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragmentOperation;->checkOperation()V

    const/4 v0, 0x7

    iput v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    return-object p0
.end method

.method public popAndClearOthers(I)Lcom/android/camera/fragment/BaseFragmentOperation;
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragmentOperation;->checkOperation()V

    const/4 v0, 0x5

    iput v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    iput p1, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->pendingFragmentInfo:I

    return-object p0
.end method

.method public push(I)Lcom/android/camera/fragment/BaseFragmentOperation;
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragmentOperation;->checkOperation()V

    const/4 v0, 0x4

    iput v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    iput p1, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->pendingFragmentInfo:I

    return-object p0
.end method

.method public remove(I)Lcom/android/camera/fragment/BaseFragmentOperation;
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragmentOperation;->checkOperation()V

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    iput p1, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->pendingFragmentInfo:I

    return-object p0
.end method

.method public removeCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragmentOperation;->checkOperation()V

    const/4 v0, 0x3

    iput v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    return-object p0
.end method

.method public replaceWith(I)Lcom/android/camera/fragment/BaseFragmentOperation;
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragmentOperation;->checkOperation()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    iput p1, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->pendingFragmentInfo:I

    return-object p0
.end method

.method public show(I)Lcom/android/camera/fragment/BaseFragmentOperation;
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragmentOperation;->checkOperation()V

    const/4 v0, 0x6

    iput v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    iput p1, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->pendingFragmentInfo:I

    return-object p0
.end method
