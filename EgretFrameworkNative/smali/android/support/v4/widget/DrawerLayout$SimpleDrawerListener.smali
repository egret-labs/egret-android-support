.class public abstract Landroid/support/v4/widget/DrawerLayout$SimpleDrawerListener;
.super Ljava/lang/Object;
.source "DrawerLayout.java"

# interfaces
.implements Landroid/support/v4/widget/DrawerLayout$DrawerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/widget/DrawerLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SimpleDrawerListener"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 198
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDrawerClosed(Landroid/view/View;)V
    .locals 0
    .parameter "drawerView"

    .prologue
    .line 209
    return-void
.end method

.method public onDrawerOpened(Landroid/view/View;)V
    .locals 0
    .parameter "drawerView"

    .prologue
    .line 205
    return-void
.end method

.method public onDrawerSlide(Landroid/view/View;F)V
    .locals 0
    .parameter "drawerView"
    .parameter "slideOffset"

    .prologue
    .line 201
    return-void
.end method

.method public onDrawerStateChanged(I)V
    .locals 0
    .parameter "newState"

    .prologue
    .line 213
    return-void
.end method
