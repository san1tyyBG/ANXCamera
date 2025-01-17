.class public Lcom/android/camera/ui/PanoMovingIndicatorView;
.super Landroid/view/View;
.source "PanoMovingIndicatorView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;
    }
.end annotation


# static fields
.field private static final DRAW_TAIL:I = 0x1

.field private static final MAX_GAP:I

.field private static final MAX_SPEED_THRESHOLD:I = 0x1b58

.field private static final MOVING_LEFT_TO_RIGHT:I = 0x0

.field private static final MOVING_RIGHT_TO_LEFT:I = 0x1

.field private static final SHOW_ALIGN_THRESHOLD:F = 0.25f

.field private static final SPEED_DEVIATION:I

.field private static final SPEED_FILTER_THRESHOLD:F = 0.1f

.field private static final STONE_WIDTH:I

.field public static final TAG:Ljava/lang/String;

.field private static sBlockWidth:[I

.field private static sGapWidth:[I

.field private static sTimesMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mArrowMargin:I

.field private mCurrentFramePos:Landroid/graphics/Point;

.field private mDirection:I

.field private mDisplayCenterY:I

.field private mFast:Z

.field private mFilterMoveSpeed:I

.field private mHalfStoneHeight:I

.field private mHandler:Landroid/os/Handler;

.field private mLatestSpeed:I

.field private mMovingDirectionIc:Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;

.field private mOffsetX:I

.field protected mOrientation:I

.field private mPointGap:F

.field private mPreviewCenterY:I

.field private mStateChangeTrigger:Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mTailPaint:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const-class v0, Lcom/android/camera/ui/PanoMovingIndicatorView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->TAG:Ljava/lang/String;

    const/high16 v0, 0x40c00000    # 6.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->MAX_GAP:I

    const v0, 0x412ab852    # 10.67f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->STONE_WIDTH:I

    sget v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->MAX_GAP:I

    const/16 v1, 0x9c4

    div-int/2addr v1, v0

    sput v1, Lcom/android/camera/ui/PanoMovingIndicatorView;->SPEED_DEVIATION:I

    const/4 v0, 0x3

    new-array v1, v0, [I

    const v2, 0x3f2b851f    # 0.67f

    invoke-static {v2}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v2

    const/4 v3, 0x0

    aput v2, v1, v3

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v2}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v4

    const/4 v5, 0x1

    aput v4, v1, v5

    const v4, 0x4055c28f    # 3.34f

    invoke-static {v4}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v4

    const/4 v6, 0x2

    aput v4, v1, v6

    sput-object v1, Lcom/android/camera/ui/PanoMovingIndicatorView;->sBlockWidth:[I

    new-array v0, v0, [I

    const v1, 0x402ae148    # 2.67f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    aput v1, v0, v3

    invoke-static {v2}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    aput v1, v0, v5

    const v1, 0x3fab851f    # 1.34f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    aput v1, v0, v6

    sput-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->sGapWidth:[I

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v6}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->sTimesMap:Ljava/util/HashMap;

    sget-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->sTimesMap:Ljava/util/HashMap;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->sTimesMap:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p2, Landroid/graphics/Point;

    invoke-direct {p2}, Landroid/graphics/Point;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    nop

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0a0028

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p2

    iput p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mArrowMargin:I

    const/high16 p2, -0x40800000    # -1.0f

    iput p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    new-instance p2, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sget-object v1, Lcom/android/camera/ui/PanoMovingIndicatorView;->sTimesMap:Ljava/util/HashMap;

    invoke-direct {p2, p0, v0, v1}, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;-><init>(Lcom/android/camera/ui/PanoMovingIndicatorView;Ljava/lang/Object;Ljava/util/HashMap;)V

    iput-object p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mStateChangeTrigger:Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;

    new-instance p2, Lcom/android/camera/ui/PanoMovingIndicatorView$1;

    invoke-direct {p2, p0}, Lcom/android/camera/ui/PanoMovingIndicatorView$1;-><init>(Lcom/android/camera/ui/PanoMovingIndicatorView;)V

    iput-object p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHandler:Landroid/os/Handler;

    new-instance p2, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;

    invoke-direct {p2}, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mMovingDirectionIc:Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;

    iget-object p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mMovingDirectionIc:Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0029

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->setWidth(I)V

    iget-object p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mMovingDirectionIc:Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a002a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->setHeight(I)V

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mTailPaint:Landroid/graphics/Paint;

    iget-object p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mTailPaint:Landroid/graphics/Paint;

    const/4 v0, -0x1

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a002b

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHalfStoneHeight:I

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/ui/PanoMovingIndicatorView;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mLatestSpeed:I

    return p0
.end method

.method static synthetic access$100(Lcom/android/camera/ui/PanoMovingIndicatorView;I)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/PanoMovingIndicatorView;->getPointGap(I)I

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/android/camera/ui/PanoMovingIndicatorView;)F
    .locals 0

    iget p0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/ui/PanoMovingIndicatorView;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/PanoMovingIndicatorView;->filterSpeed(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/camera/ui/PanoMovingIndicatorView;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/ui/PanoMovingIndicatorView;->applyNewGap()V

    return-void
.end method

.method private applyNewGap()V
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mFilterMoveSpeed:I

    invoke-direct {p0, v0}, Lcom/android/camera/ui/PanoMovingIndicatorView;->getPointGap(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    invoke-virtual {p0}, Lcom/android/camera/ui/PanoMovingIndicatorView;->invalidate()V

    return-void
.end method

.method private filterSpeed(I)V
    .locals 2

    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mFilterMoveSpeed:I

    int-to-float v0, v0

    const v1, 0x3f666666    # 0.9f

    mul-float/2addr v0, v1

    int-to-float p1, p1

    const v1, 0x3dcccccd    # 0.1f

    mul-float/2addr p1, v1

    add-float/2addr v0, p1

    float-to-int p1, v0

    iput p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mFilterMoveSpeed:I

    return-void
.end method

.method private getPointGap(I)I
    .locals 2

    nop

    const/16 v0, 0x1194

    if-le p1, v0, :cond_0

    sget v1, Lcom/android/camera/ui/PanoMovingIndicatorView;->MAX_GAP:I

    sub-int/2addr p1, v0

    sget v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->SPEED_DEVIATION:I

    add-int/2addr p1, v0

    mul-int/2addr v1, p1

    div-int/lit16 v1, v1, 0x9c4

    goto :goto_0

    :cond_0
    const/4 v1, -0x1

    :goto_0
    return v1
.end method


# virtual methods
.method public isFar()Z
    .locals 4

    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->y:I

    const/4 v1, 0x0

    const/high16 v2, -0x80000000

    if-eq v0, v2, :cond_2

    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPreviewCenterY:I

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->y:I

    iget v2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPreviewCenterY:I

    sub-int/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v2, 0x3e800000    # 0.25f

    iget v3, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPreviewCenterY:I

    int-to-float v3, v3

    mul-float/2addr v2, v3

    cmpl-float v0, v0, v2

    if-ltz v0, :cond_1

    sget-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "too far current relative y is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->y:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " refy is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPreviewCenterY:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    return v0

    :cond_1
    return v1

    :cond_2
    :goto_0
    return v1
.end method

.method public isTooFast()Z
    .locals 2

    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v7, p1

    sget-object v1, Lcom/android/camera/ui/PanoMovingIndicatorView;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onDraw mPointGap="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->x:I

    const/high16 v2, -0x80000000

    if-eq v1, v2, :cond_7

    iget-object v1, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->y:I

    if-ne v1, v2, :cond_0

    goto/16 :goto_4

    :cond_0
    iget-object v1, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->x:I

    iget v2, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mArrowMargin:I

    iget-object v8, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mMovingDirectionIc:Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;

    iget v3, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mDirection:I

    const/4 v9, 0x1

    if-nez v3, :cond_2

    iget v3, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mOffsetX:I

    add-int/2addr v3, v2

    add-int/2addr v1, v3

    :cond_1
    :goto_0
    move v10, v1

    goto :goto_1

    :cond_2
    iget v3, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mDirection:I

    if-ne v9, v3, :cond_1

    iget v3, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mOffsetX:I

    add-int/2addr v3, v2

    sub-int/2addr v1, v3

    goto :goto_0

    :goto_1
    iget v1, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mDisplayCenterY:I

    iget-object v2, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->y:I

    add-int/2addr v1, v2

    iget v2, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPreviewCenterY:I

    sub-int v11, v1, v2

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    int-to-float v1, v10

    int-to-float v2, v11

    invoke-virtual {v7, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    iget v1, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mDirection:I

    if-ne v9, v1, :cond_3

    const/high16 v1, 0x43340000    # 180.0f

    invoke-virtual {v7, v1}, Landroid/graphics/Canvas;->rotate(F)V

    :cond_3
    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    neg-int v1, v1

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    neg-int v2, v2

    div-int/lit8 v2, v2, 0x2

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    const/4 v12, 0x0

    invoke-virtual {v8, v1, v2, v12, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {v8, v7}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-virtual {v7, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    int-to-float v1, v1

    sget v2, Lcom/android/camera/ui/PanoMovingIndicatorView;->STONE_WIDTH:I

    int-to-float v2, v2

    iget v3, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    add-float/2addr v2, v3

    sub-float/2addr v1, v2

    float-to-int v1, v1

    iget v2, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    float-to-int v2, v2

    move v15, v1

    move v14, v2

    move v13, v12

    :goto_2
    sget-object v1, Lcom/android/camera/ui/PanoMovingIndicatorView;->sGapWidth:[I

    array-length v1, v1

    if-ge v13, v1, :cond_5

    if-lez v14, :cond_5

    int-to-float v2, v15

    iget v1, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHalfStoneHeight:I

    neg-int v1, v1

    int-to-float v3, v1

    sget-object v1, Lcom/android/camera/ui/PanoMovingIndicatorView;->sBlockWidth:[I

    aget v1, v1, v13

    add-int/2addr v1, v15

    int-to-float v4, v1

    iget v1, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHalfStoneHeight:I

    int-to-float v5, v1

    iget-object v6, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mTailPaint:Landroid/graphics/Paint;

    move-object v1, v7

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    sget-object v1, Lcom/android/camera/ui/PanoMovingIndicatorView;->sBlockWidth:[I

    aget v1, v1, v13

    add-int/2addr v15, v1

    sget-object v1, Lcom/android/camera/ui/PanoMovingIndicatorView;->sGapWidth:[I

    aget v1, v1, v13

    if-lt v14, v1, :cond_4

    add-int/lit8 v15, v15, 0x8

    add-int/lit8 v1, v14, -0x8

    move v14, v1

    goto :goto_3

    :cond_4
    add-int/2addr v15, v14

    nop

    move v14, v12

    :goto_3
    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    :cond_5
    int-to-float v2, v15

    iget v1, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHalfStoneHeight:I

    neg-int v1, v1

    int-to-float v3, v1

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    neg-int v1, v1

    int-to-float v4, v1

    iget v1, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHalfStoneHeight:I

    int-to-float v5, v1

    iget-object v6, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mTailPaint:Landroid/graphics/Paint;

    move-object v1, v7

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget v0, v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mDirection:I

    if-ne v9, v0, :cond_6

    const/high16 v0, -0x3ccc0000    # -180.0f

    invoke-virtual {v7, v0}, Landroid/graphics/Canvas;->rotate(F)V

    :cond_6
    neg-int v0, v10

    int-to-float v0, v0

    neg-int v1, v11

    int-to-float v1, v1

    invoke-virtual {v7, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    return-void

    :cond_7
    :goto_4
    return-void
.end method

.method public setDisplayCenterY(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mDisplayCenterY:I

    return-void
.end method

.method public setMovingAttribute(III)V
    .locals 0

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/4 p1, 0x1

    iput p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mDirection:I

    goto :goto_0

    :pswitch_1
    iput p3, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mDirection:I

    nop

    :goto_0
    iput p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mOffsetX:I

    iput-boolean p3, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mFast:Z

    const/16 p1, 0x1194

    iput p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mFilterMoveSpeed:I

    iget-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mStateChangeTrigger:Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;

    iget-boolean p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mFast:Z

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->setCurrentState(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    const/high16 p2, -0x80000000

    invoke-virtual {p1, p2, p2}, Landroid/graphics/Point;->set(II)V

    const/high16 p1, -0x40800000    # -1.0f

    iput p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setPosition(Landroid/graphics/Point;I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v1, p1, Landroid/graphics/Point;->x:I

    iget p1, p1, Landroid/graphics/Point;->y:I

    invoke-virtual {v0, v1, p1}, Landroid/graphics/Point;->set(II)V

    iput p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPreviewCenterY:I

    invoke-virtual {p0}, Lcom/android/camera/ui/PanoMovingIndicatorView;->invalidate()V

    return-void
.end method

.method public setTooFast(ZI)V
    .locals 3

    sget-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setTooFast moveSpeed="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " fastFlag:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/16 p1, 0x1b58

    if-le p2, p1, :cond_0

    goto :goto_0

    :cond_0
    move p1, p2

    :goto_0
    iput p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mLatestSpeed:I

    iget p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mLatestSpeed:I

    invoke-direct {p0, p1}, Lcom/android/camera/ui/PanoMovingIndicatorView;->getPointGap(I)I

    move-result p1

    int-to-float p1, p1

    iget p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    cmpl-float p1, p1, p2

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHandler:Landroid/os/Handler;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_1
    return-void
.end method
