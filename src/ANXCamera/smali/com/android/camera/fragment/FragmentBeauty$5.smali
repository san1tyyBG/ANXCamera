.class Lcom/android/camera/fragment/FragmentBeauty$5;
.super Ljava/lang/Object;
.source "FragmentBeauty.java"

# interfaces
.implements Landroid/support/v4/view/ViewPropertyAnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentBeauty;->showHideEyeLighting(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentBeauty;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentBeauty;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$5;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$5;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-static {p1}, Lcom/android/camera/fragment/FragmentBeauty;->access$500(Lcom/android/camera/fragment/FragmentBeauty;)Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$5;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-static {p1}, Lcom/android/camera/fragment/FragmentBeauty;->access$500(Lcom/android/camera/fragment/FragmentBeauty;)Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$5;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-static {p1}, Lcom/android/camera/fragment/FragmentBeauty;->access$500(Lcom/android/camera/fragment/FragmentBeauty;)Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->userVisibleHint()V

    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/view/View;)V
    .locals 0

    return-void
.end method
