.class public Lcom/ss/android/ttve/nativePort/TEEffectUtils;
.super Ljava/lang/Object;
.source "TEEffectUtils.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    invoke-static {}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->loadLibrary()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native getEffectVersion()Ljava/lang/String;
.end method
