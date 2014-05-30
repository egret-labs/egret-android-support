.class public Lorg/egret/egretframeworknative/MainFrameLayout;
.super Landroid/widget/FrameLayout;
.source "MainFrameLayout.java"


# static fields
.field private static count:I


# instance fields
.field _is_keyboard_show:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const/4 v0, 0x0

    sput v0, Lorg/egret/egretframeworknative/MainFrameLayout;->count:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 11
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 16
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 1
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 28
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 30
    sget-object v0, Lorg/egret/egretframeworknative/GL2JNIView;->_gl2jniview:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/GL2JNIView;->getEGTEditText()Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    move-result-object v0

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/egretjni/EGTEditText;->isFocused()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/egret/egretframeworknative/GL2JNIView;->isHandleOpenKeyboardMessage()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 31
    iget-boolean v0, p0, Lorg/egret/egretframeworknative/MainFrameLayout;->_is_keyboard_show:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lorg/egret/egretframeworknative/MainFrameLayout;->_is_keyboard_show:Z

    .line 32
    iget-boolean v0, p0, Lorg/egret/egretframeworknative/MainFrameLayout;->_is_keyboard_show:Z

    if-nez v0, :cond_0

    .line 33
    invoke-static {}, Lorg/egret/egretframeworknative/GL2JNIView;->closeIMEKeyboard()V

    .line 36
    :cond_0
    return-void

    .line 31
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method
