.class public Lorg/egret/egretframeworknative/egretjni/EGTBitmap;
.super Ljava/lang/Object;
.source "EGTBitmap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;
    }
.end annotation


# static fields
.field private static final HORIZONTALALIGN_CENTER:I = 0x3

.field private static final HORIZONTALALIGN_LEFT:I = 0x1

.field private static final HORIZONTALALIGN_RIGHT:I = 0x2

.field private static final VERTICALALIGN_BOTTOM:I = 0x2

.field private static final VERTICALALIGN_CENTER:I = 0x3

.field private static final VERTICALALIGN_TOP:I = 0x1

.field private static sContext:Landroid/content/Context;

.field private static final sTypefaceCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->sTypefaceCache:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static computeTextProperty(Ljava/lang/String;IILandroid/graphics/Paint;)Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;
    .locals 10
    .parameter "pString"
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pPaint"

    .prologue
    const/4 v7, 0x0

    .line 269
    invoke-virtual {p3}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    .line 270
    .local v0, fm:Landroid/graphics/Paint$FontMetricsInt;
    iget v6, v0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iget v8, v0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    sub-int/2addr v6, v8

    int-to-double v8, v6

    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v8

    double-to-int v1, v8

    .line 271
    .local v1, h:I
    const/4 v4, 0x0

    .line 273
    .local v4, maxContentWidth:I
    invoke-static {p0, p1, p2, p3}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->splitString(Ljava/lang/String;IILandroid/graphics/Paint;)[Ljava/lang/String;

    move-result-object v3

    .line 276
    .local v3, lines:[Ljava/lang/String;
    if-eqz p1, :cond_1

    .line 277
    move v4, p1

    .line 290
    :cond_0
    new-instance v6, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;

    invoke-direct {v6, v4, v1, v3}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;-><init>(II[Ljava/lang/String;)V

    return-object v6

    .line 280
    :cond_1
    const/4 v5, 0x0

    .line 281
    .local v5, temp:I
    array-length v8, v3

    move v6, v7

    :goto_0
    if-ge v6, v8, :cond_0

    aget-object v2, v3, v6

    .line 283
    .local v2, line:Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    .line 282
    invoke-virtual {p3, v2, v7, v9}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v9

    invoke-static {v9}, Landroid/util/FloatMath;->ceil(F)F

    move-result v9

    float-to-int v5, v9

    .line 284
    if-le v5, v4, :cond_2

    .line 285
    move v4, v5

    .line 281
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0
.end method

.method private static computeX(Ljava/lang/String;II)I
    .locals 1
    .parameter "pText"
    .parameter "pMaxWidth"
    .parameter "pHorizontalAlignment"

    .prologue
    .line 320
    const/4 v0, 0x0

    .line 322
    .local v0, ret:I
    packed-switch p2, :pswitch_data_0

    .line 334
    :goto_0
    return v0

    .line 324
    :pswitch_0
    div-int/lit8 v0, p1, 0x2

    .line 325
    goto :goto_0

    .line 327
    :pswitch_1
    move v0, p1

    .line 328
    goto :goto_0

    .line 322
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static computeY(Landroid/graphics/Paint$FontMetricsInt;III)I
    .locals 3
    .parameter "pFontMetricsInt"
    .parameter "pConstrainHeight"
    .parameter "pTotalHeight"
    .parameter "pVerticalAlignment"

    .prologue
    .line 296
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    neg-int v0, v1

    .line 298
    .local v0, y:I
    if-le p1, p2, :cond_0

    .line 299
    packed-switch p3, :pswitch_data_0

    .line 315
    :cond_0
    :goto_0
    return v0

    .line 301
    :pswitch_0
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    neg-int v0, v1

    .line 302
    goto :goto_0

    .line 304
    :pswitch_1
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    neg-int v1, v1

    sub-int v2, p1, p2

    .line 305
    div-int/lit8 v2, v2, 0x2

    .line 304
    add-int v0, v1, v2

    .line 306
    goto :goto_0

    .line 308
    :pswitch_2
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    neg-int v1, v1

    sub-int v2, p1, p2

    add-int v0, v1, v2

    .line 309
    goto :goto_0

    .line 299
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static createTextBitmapShadowStroke(Ljava/lang/String;Ljava/lang/String;IFFFIIIZFFFFZFFFF)Z
    .locals 32
    .parameter "string"
    .parameter "fontName"
    .parameter "fontSize"
    .parameter "fontTintR"
    .parameter "fontTintG"
    .parameter "fontTintB"
    .parameter "alignment"
    .parameter "width"
    .parameter "height"
    .parameter "shadow"
    .parameter "shadowDX"
    .parameter "shadowDY"
    .parameter "shadowBlur"
    .parameter "shadowOpacity"
    .parameter "stroke"
    .parameter "strokeR"
    .parameter "strokeG"
    .parameter "strokeB"
    .parameter "strokeSize"

    .prologue
    .line 64
    and-int/lit8 v12, p6, 0xf

    .line 65
    .local v12, horizontalAlignment:I
    shr-int/lit8 v25, p6, 0x4

    and-int/lit8 v22, v25, 0xf

    .line 67
    .local v22, verticalAlignment:I
    invoke-static/range {p0 .. p0}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->refactorString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 68
    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v0, v1, v12}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->newPaint(Ljava/lang/String;II)Landroid/graphics/Paint;

    move-result-object v16

    .line 72
    .local v16, paint:Landroid/graphics/Paint;
    if-eqz p7, :cond_0

    .line 74
    const/16 v25, 0x0

    const/16 v26, 0x1

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v25

    invoke-static/range {v25 .. v25}, Landroid/util/FloatMath;->ceil(F)F

    move-result v25

    move/from16 v0, v25

    float-to-int v10, v0

    .line 75
    .local v10, firstWordWidth:I
    move/from16 v0, p7

    if-le v10, v0, :cond_0

    .line 77
    const-string v25, "createTextBitmapShadowStroke warning:"

    const-string v26, "the input width is less than the width of the pString\'s first word\n"

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    const/16 v25, 0x0

    .line 166
    .end local v10           #firstWordWidth:I
    :goto_0
    return v25

    .line 84
    :cond_0
    const/16 v25, 0xff

    const-wide v26, 0x406fe00000000000L

    move/from16 v0, p3

    float-to-double v0, v0

    move-wide/from16 v28, v0

    mul-double v26, v26, v28

    move-wide/from16 v0, v26

    double-to-int v0, v0

    move/from16 v26, v0

    const-wide v27, 0x406fe00000000000L

    move/from16 v0, p4

    float-to-double v0, v0

    move-wide/from16 v29, v0

    mul-double v27, v27, v29

    move-wide/from16 v0, v27

    double-to-int v0, v0

    move/from16 v27, v0

    const-wide v28, 0x406fe00000000000L

    move/from16 v0, p5

    float-to-double v0, v0

    move-wide/from16 v30, v0

    mul-double v28, v28, v30

    move-wide/from16 v0, v28

    double-to-int v0, v0

    move/from16 v28, v0

    move-object/from16 v0, v16

    move/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v27

    move/from16 v4, v28

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 86
    move-object/from16 v0, p0

    move/from16 v1, p7

    move/from16 v2, p8

    move-object/from16 v3, v16

    invoke-static {v0, v1, v2, v3}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->computeTextProperty(Ljava/lang/String;IILandroid/graphics/Paint;)Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;

    move-result-object v21

    .line 87
    .local v21, textProperty:Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;
    if-nez p8, :cond_4

    #getter for: Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mTotalHeight:I
    invoke-static/range {v21 .. v21}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->access$0(Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;)I

    move-result v8

    .line 90
    .local v8, bitmapTotalHeight:I
    :goto_1
    const/4 v6, 0x0

    .line 91
    .local v6, bitmapPaddingX:F
    const/4 v7, 0x0

    .line 92
    .local v7, bitmapPaddingY:F
    const/16 v18, 0x0

    .line 93
    .local v18, renderTextDeltaX:F
    const/16 v19, 0x0

    .line 95
    .local v19, renderTextDeltaY:F
    if-eqz p9, :cond_2

    .line 97
    const/high16 v25, 0x437f

    mul-float v25, v25, p13

    move/from16 v0, v25

    float-to-int v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    shl-int/lit8 v20, v25, 0x18

    .line 98
    .local v20, shadowColor:I
    move-object/from16 v0, v16

    move/from16 v1, p12

    move/from16 v2, p10

    move/from16 v3, p11

    move/from16 v4, v20

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 100
    invoke-static/range {p10 .. p10}, Ljava/lang/Math;->abs(F)F

    move-result v6

    .line 101
    invoke-static/range {p11 .. p11}, Ljava/lang/Math;->abs(F)F

    move-result v7

    .line 103
    move/from16 v0, p10

    float-to-double v0, v0

    move-wide/from16 v25, v0

    const-wide/16 v27, 0x0

    cmpg-double v25, v25, v27

    if-gez v25, :cond_1

    .line 105
    move/from16 v18, v6

    .line 108
    :cond_1
    move/from16 v0, p11

    float-to-double v0, v0

    move-wide/from16 v25, v0

    const-wide/16 v27, 0x0

    cmpg-double v25, v25, v27

    if-gez v25, :cond_2

    .line 110
    move/from16 v19, v7

    .line 114
    .end local v20           #shadowColor:I
    :cond_2
    #getter for: Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mMaxWidth:I
    invoke-static/range {v21 .. v21}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->access$1(Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;)I

    move-result v25

    if-eqz v25, :cond_3

    if-nez v8, :cond_5

    .line 116
    :cond_3
    const-string v25, "createTextBitmapShadowStroke warning:"

    const-string v26, "textProperty MaxWidth is 0 or bitMapTotalHeight is 0\n"

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    const/16 v25, 0x0

    goto/16 :goto_0

    .end local v6           #bitmapPaddingX:F
    .end local v7           #bitmapPaddingY:F
    .end local v8           #bitmapTotalHeight:I
    .end local v18           #renderTextDeltaX:F
    .end local v19           #renderTextDeltaY:F
    :cond_4
    move/from16 v8, p8

    .line 87
    goto :goto_1

    .line 121
    .restart local v6       #bitmapPaddingX:F
    .restart local v7       #bitmapPaddingY:F
    .restart local v8       #bitmapTotalHeight:I
    .restart local v18       #renderTextDeltaX:F
    .restart local v19       #renderTextDeltaY:F
    :cond_5
    #getter for: Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mMaxWidth:I
    invoke-static/range {v21 .. v21}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->access$1(Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;)I

    move-result v25

    float-to-int v0, v6

    move/from16 v26, v0

    add-int v25, v25, v26

    .line 122
    float-to-int v0, v7

    move/from16 v26, v0

    add-int v26, v26, v8

    sget-object v27, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 121
    invoke-static/range {v25 .. v27}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 124
    .local v5, bitmap:Landroid/graphics/Bitmap;
    new-instance v9, Landroid/graphics/Canvas;

    invoke-direct {v9, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 127
    .local v9, canvas:Landroid/graphics/Canvas;
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v11

    .line 129
    .local v11, fontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;
    const/16 v23, 0x0

    .line 130
    .local v23, x:I
    #getter for: Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mTotalHeight:I
    invoke-static/range {v21 .. v21}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->access$0(Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;)I

    move-result v25

    move/from16 v0, p8

    move/from16 v1, v25

    move/from16 v2, v22

    invoke-static {v11, v0, v1, v2}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->computeY(Landroid/graphics/Paint$FontMetricsInt;III)I

    move-result v24

    .line 132
    .local v24, y:I
    #getter for: Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mLines:[Ljava/lang/String;
    invoke-static/range {v21 .. v21}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->access$2(Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;)[Ljava/lang/String;

    move-result-object v14

    .line 134
    .local v14, lines:[Ljava/lang/String;
    array-length v0, v14

    move/from16 v26, v0

    const/16 v25, 0x0

    :goto_2
    move/from16 v0, v25

    move/from16 v1, v26

    if-lt v0, v1, :cond_7

    .line 143
    if-eqz p14, :cond_6

    .line 145
    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v0, v1, v12}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->newPaint(Ljava/lang/String;II)Landroid/graphics/Paint;

    move-result-object v17

    .line 146
    .local v17, paintStroke:Landroid/graphics/Paint;
    sget-object v25, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    move-object/from16 v0, v17

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 147
    const/high16 v25, 0x3f00

    mul-float v25, v25, p18

    move-object/from16 v0, v17

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 148
    const/16 v25, 0xff

    const/high16 v26, 0x437f

    mul-float v26, v26, p15

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v26, v0

    const/high16 v27, 0x437f

    mul-float v27, v27, p16

    move/from16 v0, v27

    float-to-int v0, v0

    move/from16 v27, v0

    const/high16 v28, 0x437f

    mul-float v28, v28, p17

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    move-object/from16 v0, v17

    move/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v27

    move/from16 v4, v28

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 150
    const/16 v23, 0x0

    .line 151
    #getter for: Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mTotalHeight:I
    invoke-static/range {v21 .. v21}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->access$0(Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;)I

    move-result v25

    move/from16 v0, p8

    move/from16 v1, v25

    move/from16 v2, v22

    invoke-static {v11, v0, v1, v2}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->computeY(Landroid/graphics/Paint$FontMetricsInt;III)I

    move-result v24

    .line 152
    #getter for: Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mLines:[Ljava/lang/String;
    invoke-static/range {v21 .. v21}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->access$2(Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;)[Ljava/lang/String;

    move-result-object v15

    .line 154
    .local v15, lines2:[Ljava/lang/String;
    array-length v0, v15

    move/from16 v26, v0

    const/16 v25, 0x0

    :goto_3
    move/from16 v0, v25

    move/from16 v1, v26

    if-lt v0, v1, :cond_8

    .line 164
    .end local v15           #lines2:[Ljava/lang/String;
    .end local v17           #paintStroke:Landroid/graphics/Paint;
    :cond_6
    invoke-static {v5}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->initNativeObject(Landroid/graphics/Bitmap;)V

    .line 166
    const/16 v25, 0x1

    goto/16 :goto_0

    .line 134
    :cond_7
    aget-object v13, v14, v25

    .line 136
    .local v13, line:Ljava/lang/String;
    #getter for: Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mMaxWidth:I
    invoke-static/range {v21 .. v21}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->access$1(Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;)I

    move-result v27

    move/from16 v0, v27

    invoke-static {v13, v0, v12}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->computeX(Ljava/lang/String;II)I

    move-result v23

    .line 137
    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v27, v0

    add-float v27, v27, v18

    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v28, v0

    add-float v28, v28, v19

    move/from16 v0, v27

    move/from16 v1, v28

    move-object/from16 v2, v16

    invoke-virtual {v9, v13, v0, v1, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 138
    #getter for: Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mHeightPerLine:I
    invoke-static/range {v21 .. v21}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->access$3(Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;)I

    move-result v27

    add-int v24, v24, v27

    .line 134
    add-int/lit8 v25, v25, 0x1

    goto/16 :goto_2

    .line 154
    .end local v13           #line:Ljava/lang/String;
    .restart local v15       #lines2:[Ljava/lang/String;
    .restart local v17       #paintStroke:Landroid/graphics/Paint;
    :cond_8
    aget-object v13, v15, v25

    .line 156
    .restart local v13       #line:Ljava/lang/String;
    #getter for: Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mMaxWidth:I
    invoke-static/range {v21 .. v21}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->access$1(Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;)I

    move-result v27

    move/from16 v0, v27

    invoke-static {v13, v0, v12}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->computeX(Ljava/lang/String;II)I

    move-result v23

    .line 157
    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v27, v0

    add-float v27, v27, v18

    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v28, v0

    add-float v28, v28, v19

    move/from16 v0, v27

    move/from16 v1, v28

    move-object/from16 v2, v17

    invoke-virtual {v9, v13, v0, v1, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 158
    #getter for: Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mHeightPerLine:I
    invoke-static/range {v21 .. v21}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->access$3(Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;)I

    move-result v27

    add-int v24, v24, v27

    .line 154
    add-int/lit8 v25, v25, 0x1

    goto :goto_3
.end method

.method private static divideStringWithMaxWidth(Ljava/lang/String;ILandroid/graphics/Paint;)Ljava/util/LinkedList;
    .locals 8
    .parameter "pString"
    .parameter "pMaxWidth"
    .parameter "pPaint"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Landroid/graphics/Paint;",
            ")",
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 398
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 399
    .local v0, charLength:I
    const/4 v3, 0x0

    .line 400
    .local v3, start:I
    const/4 v5, 0x0

    .line 401
    .local v5, tempWidth:I
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 404
    .local v4, strList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    const/4 v1, 0x1

    .local v1, i:I
    :goto_0
    if-le v1, v0, :cond_1

    .line 436
    if-ge v3, v0, :cond_0

    .line 437
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 440
    :cond_0
    return-object v4

    .line 405
    :cond_1
    invoke-virtual {p2, p0, v3, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v6

    invoke-static {v6}, Landroid/util/FloatMath;->ceil(F)F

    move-result v6

    float-to-int v5, v6

    .line 407
    if-lt v5, p1, :cond_3

    .line 408
    const/4 v6, 0x0

    invoke-virtual {p0, v6, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 409
    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    .line 411
    .local v2, lastIndexOfSpace:I
    const/4 v6, -0x1

    if-eq v2, v6, :cond_4

    if-le v2, v3, :cond_4

    .line 413
    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 414
    add-int/lit8 v1, v2, 0x1

    .line 427
    :goto_1
    if-ge v1, v0, :cond_2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x20

    if-eq v6, v7, :cond_6

    .line 431
    :cond_2
    move v3, v1

    .line 404
    .end local v2           #lastIndexOfSpace:I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 417
    .restart local v2       #lastIndexOfSpace:I
    :cond_4
    if-le v5, p1, :cond_5

    .line 418
    add-int/lit8 v6, v1, -0x1

    invoke-virtual {p0, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 420
    add-int/lit8 v1, v1, -0x1

    .line 421
    goto :goto_1

    .line 422
    :cond_5
    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 428
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public static declared-synchronized get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;
    .locals 3
    .parameter "pContext"
    .parameter "pAssetName"

    .prologue
    .line 41
    const-class v2, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->sTypefaceCache:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 42
    const/4 v0, 0x0

    .line 43
    .local v0, typeface:Landroid/graphics/Typeface;
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 45
    invoke-static {p1}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    .line 51
    :goto_0
    sget-object v1, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->sTypefaceCache:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .end local v0           #typeface:Landroid/graphics/Typeface;
    :cond_0
    sget-object v1, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->sTypefaceCache:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Typeface;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    return-object v1

    .line 49
    .restart local v0       #typeface:Landroid/graphics/Typeface;
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 41
    .end local v0           #typeface:Landroid/graphics/Typeface;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method private static getPixels(Landroid/graphics/Bitmap;)[B
    .locals 4
    .parameter "pBitmap"

    .prologue
    .line 170
    if-eqz p0, :cond_0

    .line 171
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    .line 172
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    .line 171
    mul-int/2addr v2, v3

    mul-int/lit8 v2, v2, 0x4

    new-array v1, v2, [B

    .line 173
    .local v1, pixels:[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 174
    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 175
    invoke-virtual {p0, v0}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 179
    .end local v0           #buf:Ljava/nio/ByteBuffer;
    .end local v1           #pixels:[B
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static initNativeObject(Landroid/graphics/Bitmap;)V
    .locals 3
    .parameter "pBitmap"

    .prologue
    .line 183
    invoke-static {p0}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->getPixels(Landroid/graphics/Bitmap;)[B

    move-result-object v0

    .line 184
    .local v0, pixels:[B
    if-nez v0, :cond_0

    .line 190
    :goto_0
    return-void

    .line 188
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    .line 189
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    .line 188
    invoke-static {v1, v2, v0}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->nativeInitBitmapDC(II[B)V

    goto :goto_0
.end method

.method private static native nativeInitBitmapDC(II[B)V
.end method

.method private static newPaint(Ljava/lang/String;II)Landroid/graphics/Paint;
    .locals 7
    .parameter "pFontName"
    .parameter "pFontSize"
    .parameter "pHorizontalAlignment"

    .prologue
    const/4 v6, 0x0

    .line 229
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 230
    .local v1, paint:Landroid/graphics/Paint;
    const/4 v3, -0x1

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 231
    int-to-float v3, p1

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 232
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 235
    const-string v3, ".ttf"

    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 238
    :try_start_0
    sget-object v3, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->sContext:Landroid/content/Context;

    .line 237
    invoke-static {v3, p0}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    .line 239
    .local v2, typeFace:Landroid/graphics/Typeface;
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 251
    .end local v2           #typeFace:Landroid/graphics/Typeface;
    :goto_0
    packed-switch p2, :pswitch_data_0

    .line 260
    sget-object v3, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 264
    :goto_1
    return-object v1

    .line 240
    :catch_0
    move-exception v0

    .line 241
    .local v0, e:Ljava/lang/Exception;
    const-string v3, "Cocos2dxBitmap"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "error to create ttf type face: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 242
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 241
    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    invoke-static {p0, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_0

    .line 248
    .end local v0           #e:Ljava/lang/Exception;
    :cond_0
    invoke-static {p0, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_0

    .line 253
    :pswitch_0
    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_1

    .line 256
    :pswitch_1
    sget-object v3, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_1

    .line 251
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static refactorString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "pString"

    .prologue
    .line 197
    const-string v3, ""

    invoke-virtual {p0, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_0

    .line 198
    const-string v3, " "

    .line 223
    :goto_0
    return-object v3

    .line 205
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 206
    .local v2, strBuilder:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 207
    .local v1, start:I
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 208
    .local v0, index:I
    :goto_1
    const/4 v3, -0x1

    if-ne v0, v3, :cond_2

    .line 223
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 209
    :cond_2
    if-eqz v0, :cond_3

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    const/16 v4, 0xa

    if-ne v3, v4, :cond_4

    .line 210
    :cond_3
    const-string v3, " "

    invoke-virtual {v2, v1, v3}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    add-int/lit8 v1, v0, 0x2

    .line 216
    :goto_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-gt v1, v3, :cond_1

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eq v0, v3, :cond_1

    .line 220
    const-string v3, "\n"

    invoke-virtual {v2, v3, v1}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_1

    .line 213
    :cond_4
    add-int/lit8 v1, v0, 0x1

    goto :goto_2
.end method

.method public static setContext(Landroid/content/Context;)V
    .locals 0
    .parameter "pContext"

    .prologue
    .line 34
    sput-object p0, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->sContext:Landroid/content/Context;

    .line 35
    return-void
.end method

.method private static splitString(Ljava/lang/String;IILandroid/graphics/Paint;)[Ljava/lang/String;
    .locals 12
    .parameter "pString"
    .parameter "pMaxWidth"
    .parameter "pMaxHeight"
    .parameter "pPaint"

    .prologue
    .line 344
    const-string v9, "\\n"

    invoke-virtual {p0, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 345
    .local v5, lines:[Ljava/lang/String;
    const/4 v7, 0x0

    .line 346
    .local v7, ret:[Ljava/lang/String;
    invoke-virtual {p3}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    .line 347
    .local v0, fm:Landroid/graphics/Paint$FontMetricsInt;
    iget v9, v0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iget v10, v0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    sub-int/2addr v9, v10

    int-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v9

    double-to-int v1, v9

    .line 348
    .local v1, heightPerLine:I
    div-int v6, p2, v1

    .line 350
    .local v6, maxLines:I
    if-eqz p1, :cond_6

    .line 351
    new-instance v8, Ljava/util/LinkedList;

    invoke-direct {v8}, Ljava/util/LinkedList;-><init>()V

    .line 352
    .local v8, strList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    array-length v10, v5

    const/4 v9, 0x0

    :goto_0
    if-lt v9, v10, :cond_2

    .line 373
    :cond_0
    if-lez v6, :cond_1

    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v9

    if-le v9, v6, :cond_1

    .line 374
    :goto_1
    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v9

    if-gt v9, v6, :cond_5

    .line 379
    :cond_1
    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v9

    new-array v7, v9, [Ljava/lang/String;

    .line 380
    invoke-virtual {v8, v7}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 393
    .end local v8           #strList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    :goto_2
    return-object v7

    .line 352
    .restart local v8       #strList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_2
    aget-object v3, v5, v9

    .line 358
    .local v3, line:Ljava/lang/String;
    invoke-virtual {p3, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v11

    .line 357
    invoke-static {v11}, Landroid/util/FloatMath;->ceil(F)F

    move-result v11

    float-to-int v4, v11

    .line 359
    .local v4, lineWidth:I
    if-le v4, p1, :cond_4

    .line 360
    invoke-static {v3, p1, p3}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->divideStringWithMaxWidth(Ljava/lang/String;ILandroid/graphics/Paint;)Ljava/util/LinkedList;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 367
    :goto_3
    if-lez v6, :cond_3

    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v11

    if-ge v11, v6, :cond_0

    .line 352
    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 363
    :cond_4
    invoke-virtual {v8, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 375
    .end local v3           #line:Ljava/lang/String;
    .end local v4           #lineWidth:I
    :cond_5
    invoke-virtual {v8}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    goto :goto_1

    .line 381
    .end local v8           #strList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_6
    if-eqz p2, :cond_8

    array-length v9, v5

    if-le v9, v6, :cond_8

    .line 383
    new-instance v8, Ljava/util/LinkedList;

    invoke-direct {v8}, Ljava/util/LinkedList;-><init>()V

    .line 384
    .restart local v8       #strList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, i:I
    :goto_4
    if-lt v2, v6, :cond_7

    .line 387
    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v9

    new-array v7, v9, [Ljava/lang/String;

    .line 388
    invoke-virtual {v8, v7}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    goto :goto_2

    .line 385
    :cond_7
    aget-object v9, v5, v2

    invoke-virtual {v8, v9}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 384
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 390
    .end local v2           #i:I
    .end local v8           #strList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_8
    move-object v7, v5

    goto :goto_2
.end method
