.class Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatStubImpl;
.super Ljava/lang/Object;
.source "ViewGroupCompat.java"

# interfaces
.implements Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/ViewGroupCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewGroupCompatStubImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getLayoutMode(Landroid/view/ViewGroup;)I
    .locals 1
    .parameter "group"

    .prologue
    .line 67
    const/4 v0, 0x0

    return v0
.end method

.method public onRequestSendAccessibilityEvent(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1
    .parameter "group"
    .parameter "child"
    .parameter "event"

    .prologue
    .line 58
    const/4 v0, 0x1

    return v0
.end method

.method public setLayoutMode(Landroid/view/ViewGroup;I)V
    .locals 0
    .parameter "group"
    .parameter "mode"

    .prologue
    .line 73
    return-void
.end method

.method public setMotionEventSplittingEnabled(Landroid/view/ViewGroup;Z)V
    .locals 0
    .parameter "group"
    .parameter "split"

    .prologue
    .line 63
    return-void
.end method
