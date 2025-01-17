.class public Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;
.super Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;
.source "ExtraSlideFocusAdapter.java"

# interfaces
.implements Lcom/android/camera/ui/HorizontalSlideView$OnItemSelectListener;


# static fields
.field private static final ENTRY_GAP:I = 0xa

.field private static final MAX_ENTRY_SECTION:I = 0xa

.field private static final MAX_POSITION:I = 0x3e8

.field private static final MAX_SECTION:I = 0x64

.field private static final MAX_VALUE:I = 0x64

.field private static final sTextActivatedColorState:[I

.field private static final sTextDefaultColorState:[I


# instance fields
.field private mComponentData:Lcom/android/camera/data/data/ComponentData;

.field private mCurrentMode:I

.field private mCurrentValue:Ljava/lang/String;

.field private mEntries:[Ljava/lang/CharSequence;

.field private mLineColorDefault:I

.field private mLineHalfHeight:F

.field private mLineLineGap:I

.field private mLineTextGap:I

.field private mLineWidth:I

.field private mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

.field private mMinimumFocusDistance:F

.field private mPaint:Landroid/graphics/Paint;

.field private mTextColor:Landroid/content/res/ColorStateList;

.field private mTextSize:I

.field private mTrackedFocusPosition:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    const v3, 0x10102fe

    aput v3, v1, v2

    sput-object v1, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->sTextActivatedColorState:[I

    new-array v0, v0, [I

    aput v2, v0, v2

    sput-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->sTextDefaultColorState:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;-><init>()V

    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iput p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentMode:I

    iput-object p4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentMode:I

    invoke-virtual {p2, p3}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentValue:Ljava/lang/String;

    :try_start_0
    iget-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentValue:Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    iput p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTrackedFocusPosition:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    const/16 p2, 0x3e8

    iput p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTrackedFocusPosition:I

    :goto_0
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->initStyle(Landroid/content/Context;)V

    const/16 p2, 0xb

    new-array p2, p2, [Ljava/lang/CharSequence;

    nop

    const/4 p3, 0x0

    :goto_1
    const/16 p4, 0xa

    if-gt p3, p4, :cond_0

    mul-int/lit8 p4, p3, 0xa

    invoke-direct {p0, p1, p4}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->getDisplayedFocusValue(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p4

    aput-object p4, p2, p3

    add-int/lit8 p3, p3, 0x1

    goto :goto_1

    :cond_0
    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mEntries:[Ljava/lang/CharSequence;

    return-void
.end method

.method private drawText(ILandroid/graphics/Canvas;)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->ascent()F

    move-result v0

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->descent()F

    move-result v1

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mEntries:[Ljava/lang/CharSequence;

    aget-object p1, v1, p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    neg-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {p2, p1, v2, v0, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method private getDisplayedFocusValue(Landroid/content/Context;I)Ljava/lang/String;
    .locals 0

    if-nez p2, :cond_0

    const p2, 0x7f090053

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private initStyle(Landroid/content/Context;)V
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    const v1, 0x7f0d0012

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    iget v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTextSize:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTextSize:I

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a001b

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    iput v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineHalfHeight:F

    const v0, 0x7f0a001c

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineWidth:I

    const v0, 0x7f0a001d

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineLineGap:I

    const v0, 0x7f0a001e

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineTextGap:I

    const v0, 0x7f0b0050

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineColorDefault:I

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineWidth:I

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTextSize:I

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    return-void

    nop

    :array_0
    .array-data 4
        0x1010095
        0x1010098
    .end array-data
.end method

.method private mapIndexToFocus(I)I
    .locals 0

    mul-int/lit16 p1, p1, 0x3e8

    div-int/lit8 p1, p1, 0x64

    rsub-int p1, p1, 0x3e8

    return p1
.end method


# virtual methods
.method public draw(ILandroid/graphics/Canvas;Z)V
    .locals 6

    rem-int/lit8 v0, p1, 0xa

    const/4 v1, 0x0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTextColor:Landroid/content/res/ColorStateList;

    sget-object v2, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->sTextActivatedColorState:[I

    invoke-virtual {p3, v2, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p3

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTextColor:Landroid/content/res/ColorStateList;

    sget-object v2, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->sTextDefaultColorState:[I

    invoke-virtual {p3, v2, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p3

    :goto_0
    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->setColor(I)V

    div-int/lit8 p1, p1, 0xa

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->drawText(ILandroid/graphics/Canvas;)V

    goto :goto_2

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    if-eqz p3, :cond_2

    iget-object p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTextColor:Landroid/content/res/ColorStateList;

    sget-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->sTextActivatedColorState:[I

    invoke-virtual {p3, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p3

    goto :goto_1

    :cond_2
    iget p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineColorDefault:I

    :goto_1
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    const/4 v1, 0x0

    iget p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineHalfHeight:F

    neg-float v2, p1

    const/4 v3, 0x0

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineHalfHeight:F

    iget-object v5, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    move-object v0, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :goto_2
    return-void
.end method

.method public getAlign(I)Landroid/graphics/Paint$Align;
    .locals 0

    sget-object p1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    return-object p1
.end method

.method public getCount()I
    .locals 1

    const/16 v0, 0x65

    return v0
.end method

.method public mapFocusToIndex(I)I
    .locals 2

    const/4 v0, 0x0

    const/16 v1, 0x3e8

    invoke-static {p1, v0, v1}, Lcom/android/camera/Util;->clamp(III)I

    move-result p1

    nop

    div-int/lit8 p1, p1, 0xa

    rsub-int/lit8 p1, p1, 0x64

    return p1
.end method

.method public measureGap(I)F
    .locals 1

    rem-int/lit8 v0, p1, 0xa

    if-eqz v0, :cond_1

    add-int/lit8 p1, p1, 0x1

    rem-int/lit8 p1, p1, 0xa

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineLineGap:I

    int-to-float p1, p1

    return p1

    :cond_1
    :goto_0
    iget p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineTextGap:I

    int-to-float p1, p1

    return p1
.end method

.method public measureWidth(I)F
    .locals 2

    rem-int/lit8 v0, p1, 0xa

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mEntries:[Ljava/lang/CharSequence;

    div-int/lit8 p1, p1, 0xa

    aget-object p1, v1, p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result p1

    return p1

    :cond_0
    iget p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineWidth:I

    int-to-float p1, p1

    return p1
.end method

.method public onItemSelect(Lcom/android/camera/ui/HorizontalSlideView;I)V
    .locals 3

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mapIndexToFocus(I)I

    move-result p2

    invoke-virtual {p1}, Lcom/android/camera/ui/HorizontalSlideView;->isScrolling()Z

    move-result p1

    if-nez p1, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTrackedFocusPosition:I

    if-eq p1, p2, :cond_0

    iput p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTrackedFocusPosition:I

    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackFocusPositionChanged(I)V

    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentValue:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    iget-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentMode:I

    invoke-virtual {p2, v0, p1}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    iget-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentValue:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-interface {p2, v0, v1, p1, v2}, Lcom/android/camera/fragment/manually/ManuallyListener;->onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V

    :cond_1
    iput-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentValue:Ljava/lang/String;

    :cond_2
    return-void
.end method
