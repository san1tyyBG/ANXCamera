.class public Lmiui/maml/animation/interpolater/CubicEaseInOutInterpolater;
.super Ljava/lang/Object;
.source "CubicEaseInOutInterpolater.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 5

    const/high16 v0, 0x40000000    # 2.0f

    mul-float v1, p1, v0

    move p1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v1, v1, v2

    const/high16 v2, 0x3f000000    # 0.5f

    if-gez v1, :cond_11

    mul-float/2addr v2, p1

    mul-float/2addr v2, p1

    mul-float/2addr v2, p1

    return v2

    :cond_11
    sub-float v1, p1, v0

    move p1, v1

    mul-float/2addr v1, p1

    mul-float/2addr v1, p1

    add-float/2addr v1, v0

    mul-float/2addr v2, v1

    return v2
.end method
