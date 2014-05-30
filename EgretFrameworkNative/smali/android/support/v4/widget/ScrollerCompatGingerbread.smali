.class Landroid/support/v4/widget/ScrollerCompatGingerbread;
.super Ljava/lang/Object;
.source "ScrollerCompatGingerbread.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static abortAnimation(Ljava/lang/Object;)V
    .locals 0
    .parameter "scroller"

    .prologue
    .line 67
    check-cast p0, Landroid/widget/OverScroller;

    .end local p0
    invoke-virtual {p0}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 68
    return-void
.end method

.method public static computeScrollOffset(Ljava/lang/Object;)Z
    .locals 1
    .parameter "scroller"

    .prologue
    .line 43
    check-cast p0, Landroid/widget/OverScroller;

    .end local p0
    invoke-virtual {p0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    move-result v0

    return v0
.end method

.method public static createScroller(Landroid/content/Context;Landroid/view/animation/Interpolator;)Ljava/lang/Object;
    .locals 1
    .parameter "context"
    .parameter "interpolator"

    .prologue
    .line 26
    if-eqz p1, :cond_0

    new-instance v0, Landroid/widget/OverScroller;

    invoke-direct {v0, p0, p1}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Landroid/widget/OverScroller;

    invoke-direct {v0, p0}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;)V

    goto :goto_0
.end method

.method public static fling(Ljava/lang/Object;IIIIIIII)V
    .locals 9
    .parameter "scroller"
    .parameter "startX"
    .parameter "startY"
    .parameter "velX"
    .parameter "velY"
    .parameter "minX"
    .parameter "maxX"
    .parameter "minY"
    .parameter "maxY"

    .prologue
    .line 57
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v8}, Landroid/widget/OverScroller;->fling(IIIIIIII)V

    .line 58
    return-void
.end method

.method public static fling(Ljava/lang/Object;IIIIIIIIII)V
    .locals 11
    .parameter "scroller"
    .parameter "startX"
    .parameter "startY"
    .parameter "velX"
    .parameter "velY"
    .parameter "minX"
    .parameter "maxX"
    .parameter "minY"
    .parameter "maxY"
    .parameter "overX"
    .parameter "overY"

    .prologue
    .line 62
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    invoke-virtual/range {v0 .. v10}, Landroid/widget/OverScroller;->fling(IIIIIIIIII)V

    .line 64
    return-void
.end method

.method public static getCurrX(Ljava/lang/Object;)I
    .locals 1
    .parameter "scroller"

    .prologue
    .line 35
    check-cast p0, Landroid/widget/OverScroller;

    .end local p0
    invoke-virtual {p0}, Landroid/widget/OverScroller;->getCurrX()I

    move-result v0

    return v0
.end method

.method public static getCurrY(Ljava/lang/Object;)I
    .locals 1
    .parameter "scroller"

    .prologue
    .line 39
    check-cast p0, Landroid/widget/OverScroller;

    .end local p0
    invoke-virtual {p0}, Landroid/widget/OverScroller;->getCurrY()I

    move-result v0

    return v0
.end method

.method public static getFinalX(Ljava/lang/Object;)I
    .locals 1
    .parameter "scroller"

    .prologue
    .line 84
    check-cast p0, Landroid/widget/OverScroller;

    .end local p0
    invoke-virtual {p0}, Landroid/widget/OverScroller;->getFinalX()I

    move-result v0

    return v0
.end method

.method public static getFinalY(Ljava/lang/Object;)I
    .locals 1
    .parameter "scroller"

    .prologue
    .line 88
    check-cast p0, Landroid/widget/OverScroller;

    .end local p0
    invoke-virtual {p0}, Landroid/widget/OverScroller;->getFinalY()I

    move-result v0

    return v0
.end method

.method public static isFinished(Ljava/lang/Object;)Z
    .locals 1
    .parameter "scroller"

    .prologue
    .line 31
    check-cast p0, Landroid/widget/OverScroller;

    .end local p0
    invoke-virtual {p0}, Landroid/widget/OverScroller;->isFinished()Z

    move-result v0

    return v0
.end method

.method public static isOverScrolled(Ljava/lang/Object;)Z
    .locals 1
    .parameter "scroller"

    .prologue
    .line 80
    check-cast p0, Landroid/widget/OverScroller;

    .end local p0
    invoke-virtual {p0}, Landroid/widget/OverScroller;->isOverScrolled()Z

    move-result v0

    return v0
.end method

.method public static notifyHorizontalEdgeReached(Ljava/lang/Object;III)V
    .locals 0
    .parameter "scroller"
    .parameter "startX"
    .parameter "finalX"
    .parameter "overX"

    .prologue
    .line 72
    check-cast p0, Landroid/widget/OverScroller;

    .end local p0
    invoke-virtual {p0, p1, p2, p3}, Landroid/widget/OverScroller;->notifyHorizontalEdgeReached(III)V

    .line 73
    return-void
.end method

.method public static notifyVerticalEdgeReached(Ljava/lang/Object;III)V
    .locals 0
    .parameter "scroller"
    .parameter "startY"
    .parameter "finalY"
    .parameter "overY"

    .prologue
    .line 76
    check-cast p0, Landroid/widget/OverScroller;

    .end local p0
    invoke-virtual {p0, p1, p2, p3}, Landroid/widget/OverScroller;->notifyVerticalEdgeReached(III)V

    .line 77
    return-void
.end method

.method public static startScroll(Ljava/lang/Object;IIII)V
    .locals 0
    .parameter "scroller"
    .parameter "startX"
    .parameter "startY"
    .parameter "dx"
    .parameter "dy"

    .prologue
    .line 47
    check-cast p0, Landroid/widget/OverScroller;

    .end local p0
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/widget/OverScroller;->startScroll(IIII)V

    .line 48
    return-void
.end method

.method public static startScroll(Ljava/lang/Object;IIIII)V
    .locals 6
    .parameter "scroller"
    .parameter "startX"
    .parameter "startY"
    .parameter "dx"
    .parameter "dy"
    .parameter "duration"

    .prologue
    .line 52
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 53
    return-void
.end method
