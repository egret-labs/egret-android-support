.class Landroid/support/v4/view/GravityCompatJellybeanMr1;
.super Ljava/lang/Object;
.source "GravityCompatJellybeanMr1.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(IIILandroid/graphics/Rect;IILandroid/graphics/Rect;I)V
    .locals 0
    .parameter "gravity"
    .parameter "w"
    .parameter "h"
    .parameter "container"
    .parameter "xAdj"
    .parameter "yAdj"
    .parameter "outRect"
    .parameter "layoutDirection"

    .prologue
    .line 36
    invoke-static/range {p0 .. p7}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;IILandroid/graphics/Rect;I)V

    .line 37
    return-void
.end method

.method public static apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;I)V
    .locals 0
    .parameter "gravity"
    .parameter "w"
    .parameter "h"
    .parameter "container"
    .parameter "outRect"
    .parameter "layoutDirection"

    .prologue
    .line 31
    invoke-static/range {p0 .. p5}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;I)V

    .line 32
    return-void
.end method

.method public static applyDisplay(ILandroid/graphics/Rect;Landroid/graphics/Rect;I)V
    .locals 0
    .parameter "gravity"
    .parameter "display"
    .parameter "inoutObj"
    .parameter "layoutDirection"

    .prologue
    .line 40
    invoke-static {p0, p1, p2, p3}, Landroid/view/Gravity;->applyDisplay(ILandroid/graphics/Rect;Landroid/graphics/Rect;I)V

    .line 41
    return-void
.end method

.method public static getAbsoluteGravity(II)I
    .locals 1
    .parameter "gravity"
    .parameter "layoutDirection"

    .prologue
    .line 26
    invoke-static {p0, p1}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result v0

    return v0
.end method
