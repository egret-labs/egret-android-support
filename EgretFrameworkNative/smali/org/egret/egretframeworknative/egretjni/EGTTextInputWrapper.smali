.class public Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;
.super Ljava/lang/Object;
.source "EGTTextInputWrapper.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Landroid/widget/TextView$OnEditorActionListener;


# static fields
.field private static LOG_TAG:Ljava/lang/String;


# instance fields
.field private _glview:Lorg/egret/egretframeworknative/GL2JNIView;

.field private mOriginText:Ljava/lang/String;

.field private mText:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-string v0, "EGTTextInputWrapper"

    sput-object v0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/egret/egretframeworknative/GL2JNIView;)V
    .locals 0
    .parameter "glview"

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->_glview:Lorg/egret/egretframeworknative/GL2JNIView;

    .line 24
    return-void
.end method

.method private isFullScreenEdit()Z
    .locals 4

    .prologue
    .line 27
    iget-object v2, p0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->_glview:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->getEGTEditText()Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    move-result-object v1

    .line 28
    .local v1, textField:Landroid/widget/TextView;
    invoke-virtual {v1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "input_method"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 29
    .local v0, imm:Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {v0}, Landroid/view/inputmethod/InputMethodManager;->isFullscreenMode()Z

    move-result v2

    return v2
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 5
    .parameter "s"

    .prologue
    .line 78
    sget-object v2, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "afterTextChanged Editable= "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    invoke-direct {p0}, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->isFullScreenEdit()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 102
    :cond_0
    :goto_0
    return-void

    .line 83
    :cond_1
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v2

    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->mText:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    sub-int v1, v2, v3

    .line 84
    .local v1, modified:I
    if-lez v1, :cond_2

    .line 86
    iget-object v2, p0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->mText:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v3

    invoke-interface {p1, v2, v3}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, insertText:Ljava/lang/String;
    const-string v2, "EGTTextInputWrapper"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "mText="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->mText:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ";s = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    iget-object v2, p0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->_glview:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v2, v0}, Lorg/egret/egretframeworknative/GL2JNIView;->insertText(Ljava/lang/String;)V

    goto :goto_0

    .line 93
    .end local v0           #insertText:Ljava/lang/String;
    :cond_2
    const-string v2, "EGTTextInputWrapper"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "deleteBackward modified = "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    :goto_1
    if-gez v1, :cond_0

    .line 96
    iget-object v2, p0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->_glview:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->deleteBackward()V

    .line 95
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 3
    .parameter "char_seequence"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 107
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "beforeTextChanged char_seequence= "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " start= "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ; count="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";after="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->mText:Ljava/lang/String;

    .line 110
    return-void
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 7
    .parameter "textview"
    .parameter "pActionID"
    .parameter "keyevent"

    .prologue
    const/16 v6, 0xa

    .line 39
    sget-object v3, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "onEditorAction pActionID= "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " keyevent= "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->_glview:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v3}, Lorg/egret/egretframeworknative/GL2JNIView;->getEGTEditText()Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    move-result-object v3

    if-ne v3, p1, :cond_2

    invoke-direct {p0}, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->isFullScreenEdit()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 42
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->mOriginText:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    .local v0, i:I
    :goto_0
    if-gtz v0, :cond_4

    .line 48
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 51
    .local v2, text:Ljava/lang/String;
    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_0

    .line 52
    const-string v2, "\n"

    .line 55
    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v6, v3, :cond_1

    .line 56
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 59
    :cond_1
    move-object v1, v2

    .line 60
    .local v1, insertText:Ljava/lang/String;
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->_glview:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v3, v1}, Lorg/egret/egretframeworknative/GL2JNIView;->insertText(Ljava/lang/String;)V

    .line 68
    .end local v0           #i:I
    .end local v1           #insertText:Ljava/lang/String;
    .end local v2           #text:Ljava/lang/String;
    :cond_2
    const/4 v3, 0x6

    if-ne p2, v3, :cond_3

    .line 69
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->_glview:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v3}, Lorg/egret/egretframeworknative/GL2JNIView;->requestFocus()Z

    .line 71
    :cond_3
    const/4 v3, 0x0

    return v3

    .line 43
    .restart local v0       #i:I
    :cond_4
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->_glview:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v3}, Lorg/egret/egretframeworknative/GL2JNIView;->deleteBackward()V

    .line 45
    sget-object v3, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->LOG_TAG:Ljava/lang/String;

    const-string v4, "deleteBackward"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 3
    .parameter "char_seequence"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 116
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onTextChanged char_seequence= "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " start= "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ; count="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";after="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    return-void
.end method

.method public setOriginText(Ljava/lang/String;)V
    .locals 0
    .parameter "pOriginText"

    .prologue
    .line 33
    iput-object p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->mOriginText:Ljava/lang/String;

    .line 34
    return-void
.end method
