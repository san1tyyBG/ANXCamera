.class public final synthetic Lcom/android/camera/fragment/top/-$$Lambda$FragmentTopConfig$Uy_-7rnc78YPJCtjcxZpRQmIxk0;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/android/camera/fragment/top/FragmentTopConfig;

.field private final synthetic f$1:Lcom/android/camera/fragment/top/FragmentTopAlert;

.field private final synthetic f$2:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/camera/fragment/top/FragmentTopConfig;Lcom/android/camera/fragment/top/FragmentTopAlert;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/top/-$$Lambda$FragmentTopConfig$Uy_-7rnc78YPJCtjcxZpRQmIxk0;->f$0:Lcom/android/camera/fragment/top/FragmentTopConfig;

    iput-object p2, p0, Lcom/android/camera/fragment/top/-$$Lambda$FragmentTopConfig$Uy_-7rnc78YPJCtjcxZpRQmIxk0;->f$1:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iput-boolean p3, p0, Lcom/android/camera/fragment/top/-$$Lambda$FragmentTopConfig$Uy_-7rnc78YPJCtjcxZpRQmIxk0;->f$2:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/top/-$$Lambda$FragmentTopConfig$Uy_-7rnc78YPJCtjcxZpRQmIxk0;->f$0:Lcom/android/camera/fragment/top/FragmentTopConfig;

    iget-object v1, p0, Lcom/android/camera/fragment/top/-$$Lambda$FragmentTopConfig$Uy_-7rnc78YPJCtjcxZpRQmIxk0;->f$1:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iget-boolean v2, p0, Lcom/android/camera/fragment/top/-$$Lambda$FragmentTopConfig$Uy_-7rnc78YPJCtjcxZpRQmIxk0;->f$2:Z

    invoke-static {v0, v1, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->lambda$reInitAlert$0(Lcom/android/camera/fragment/top/FragmentTopConfig;Lcom/android/camera/fragment/top/FragmentTopAlert;Z)V

    return-void
.end method
