.class Landroid/support/v4/view/ViewCompat$JbMr1ViewCompatImpl;
.super Landroid/support/v4/view/ViewCompat$JBViewCompatImpl;
.source "ViewCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/ViewCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "JbMr1ViewCompatImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 506
    invoke-direct {p0}, Landroid/support/v4/view/ViewCompat$JBViewCompatImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public getLabelFor(Landroid/view/View;)I
    .locals 1
    .parameter "view"

    .prologue
    .line 510
    invoke-static {p1}, Landroid/support/v4/view/ViewCompatJellybeanMr1;->getLabelFor(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method public getLayoutDirection(Landroid/view/View;)I
    .locals 1
    .parameter "view"

    .prologue
    .line 525
    invoke-static {p1}, Landroid/support/v4/view/ViewCompatJellybeanMr1;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method public setLabelFor(Landroid/view/View;I)V
    .locals 0
    .parameter "view"
    .parameter "id"

    .prologue
    .line 515
    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompatJellybeanMr1;->setLabelFor(Landroid/view/View;I)V

    .line 516
    return-void
.end method

.method public setLayerPaint(Landroid/view/View;Landroid/graphics/Paint;)V
    .locals 0
    .parameter "view"
    .parameter "paint"

    .prologue
    .line 520
    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompatJellybeanMr1;->setLayerPaint(Landroid/view/View;Landroid/graphics/Paint;)V

    .line 521
    return-void
.end method

.method public setLayoutDirection(Landroid/view/View;I)V
    .locals 0
    .parameter "view"
    .parameter "layoutDirection"

    .prologue
    .line 530
    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompatJellybeanMr1;->setLayoutDirection(Landroid/view/View;I)V

    .line 531
    return-void
.end method
