.class public Lorg/egret/egretframeworknative/egretjni/EGTEditText;
.super Landroid/widget/EditText;
.source "EGTEditText.java"


# instance fields
.field private _glview:Lorg/egret/egretframeworknative/GL2JNIView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 18
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 28
    return-void
.end method


# virtual methods
.method public onBeginBatchEdit()V
    .locals 3

    .prologue
    .line 42
    invoke-super {p0}, Landroid/widget/EditText;->onBeginBatchEdit()V

    .line 43
    const-string v0, "EGTEditText"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onBeginBatchEdit isFocused = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lorg/egret/egretframeworknative/egretjni/EGTEditText;->isFocused()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    return-void
.end method

.method public onEditorAction(I)V
    .locals 3
    .parameter "actionCode"

    .prologue
    .line 36
    invoke-super {p0, p1}, Landroid/widget/EditText;->onEditorAction(I)V

    .line 37
    const-string v0, "EGTEditText"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "actionCode="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    return-void
.end method

.method public onEndBatchEdit()V
    .locals 0

    .prologue
    .line 48
    invoke-super {p0}, Landroid/widget/EditText;->onEndBatchEdit()V

    .line 51
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .parameter "pKeyCode"
    .parameter "pKeyEvent"

    .prologue
    .line 55
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 56
    const-string v0, "EGTEditText"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onKeyDown = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";pKeyEvent="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 59
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTEditText;->_glview:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/GL2JNIView;->requestFocus()Z

    .line 62
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public setGL2JNIView(Lorg/egret/egretframeworknative/GL2JNIView;)V
    .locals 0
    .parameter "view"

    .prologue
    .line 31
    iput-object p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTEditText;->_glview:Lorg/egret/egretframeworknative/GL2JNIView;

    .line 32
    return-void
.end method
