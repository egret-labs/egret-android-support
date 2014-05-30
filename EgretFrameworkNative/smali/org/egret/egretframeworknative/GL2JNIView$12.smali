.class Lorg/egret/egretframeworknative/GL2JNIView$12;
.super Landroid/os/Handler;
.source "GL2JNIView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/egret/egretframeworknative/GL2JNIView;->init(ZII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/egret/egretframeworknative/GL2JNIView;


# direct methods
.method constructor <init>(Lorg/egret/egretframeworknative/GL2JNIView;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/egret/egretframeworknative/GL2JNIView$12;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    .line 324
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .parameter "msg"

    .prologue
    const/4 v5, 0x0

    .line 327
    iget v2, p1, Landroid/os/Message;->what:I

    invoke-static {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->access$3(I)V

    .line 328
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 364
    :cond_0
    :goto_0
    return-void

    .line 330
    :pswitch_0
    const-string v2, "GL2JNIView"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "HANDLER_OPEN_IME_KEYBOARD edittext isfocused = "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lorg/egret/egretframeworknative/GL2JNIView$12;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;
    invoke-static {v4}, Lorg/egret/egretframeworknative/GL2JNIView;->access$4(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    move-result-object v4

    invoke-virtual {v4}, Lorg/egret/egretframeworknative/egretjni/EGTEditText;->isFocused()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    iget-object v2, p0, Lorg/egret/egretframeworknative/GL2JNIView$12;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;
    invoke-static {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->access$4(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/egret/egretframeworknative/GL2JNIView$12;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;
    invoke-static {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->access$4(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    move-result-object v2

    invoke-virtual {v2}, Lorg/egret/egretframeworknative/egretjni/EGTEditText;->requestFocus()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 334
    iget-object v2, p0, Lorg/egret/egretframeworknative/GL2JNIView$12;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;
    invoke-static {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->access$4(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    move-result-object v2

    invoke-static {}, Lorg/egret/egretframeworknative/GL2JNIView;->access$5()Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/egret/egretframeworknative/egretjni/EGTEditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 336
    iget-object v2, p0, Lorg/egret/egretframeworknative/GL2JNIView$12;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;
    invoke-static {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->access$4(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Lorg/egret/egretframeworknative/egretjni/EGTEditText;->setText(Ljava/lang/CharSequence;)V

    .line 337
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    .line 338
    .local v1, text:Ljava/lang/String;
    iget-object v2, p0, Lorg/egret/egretframeworknative/GL2JNIView$12;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;
    invoke-static {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->access$4(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/egret/egretframeworknative/egretjni/EGTEditText;->append(Ljava/lang/CharSequence;)V

    .line 339
    invoke-static {}, Lorg/egret/egretframeworknative/GL2JNIView;->access$5()Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;->setOriginText(Ljava/lang/String;)V

    .line 340
    iget-object v2, p0, Lorg/egret/egretframeworknative/GL2JNIView$12;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;
    invoke-static {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->access$4(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    move-result-object v2

    invoke-static {}, Lorg/egret/egretframeworknative/GL2JNIView;->access$5()Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/egret/egretframeworknative/egretjni/EGTEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 341
    sget-object v2, Lorg/egret/egretframeworknative/GL2JNIView;->_gl2jniview:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "input_method"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 342
    .local v0, imm:Landroid/view/inputmethod/InputMethodManager;
    sget-object v2, Lorg/egret/egretframeworknative/GL2JNIView;->_gl2jniview:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;
    invoke-static {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->access$4(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    move-result-object v2

    invoke-virtual {v0, v2, v5}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 344
    sget-object v2, Lorg/egret/egretframeworknative/GL2JNIView;->_gl2jniview:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->myrenderer:Lorg/egret/egretframeworknative/MyRenderer;
    invoke-static {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->access$2(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/MyRenderer;

    move-result-object v2

    invoke-virtual {v2}, Lorg/egret/egretframeworknative/MyRenderer;->handleKeyboardDidShow()V

    .line 346
    const-string v2, "GL2JNIView"

    const-string v3, "showSoftInput"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 352
    .end local v0           #imm:Landroid/view/inputmethod/InputMethodManager;
    .end local v1           #text:Ljava/lang/String;
    :pswitch_1
    const-string v2, "GL2JNIView"

    const-string v3, "HANDLER_CLOSE_IME_KEYBOARD"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 353
    iget-object v2, p0, Lorg/egret/egretframeworknative/GL2JNIView$12;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;
    invoke-static {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->access$4(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 354
    iget-object v2, p0, Lorg/egret/egretframeworknative/GL2JNIView$12;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;
    invoke-static {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->access$4(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    move-result-object v2

    invoke-static {}, Lorg/egret/egretframeworknative/GL2JNIView;->access$5()Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/egret/egretframeworknative/egretjni/EGTEditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 355
    sget-object v2, Lorg/egret/egretframeworknative/GL2JNIView;->_gl2jniview:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "input_method"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 356
    .restart local v0       #imm:Landroid/view/inputmethod/InputMethodManager;
    sget-object v2, Lorg/egret/egretframeworknative/GL2JNIView;->_gl2jniview:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;
    invoke-static {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->access$4(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    move-result-object v2

    invoke-virtual {v2}, Lorg/egret/egretframeworknative/egretjni/EGTEditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v0, v2, v5}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 357
    iget-object v2, p0, Lorg/egret/egretframeworknative/GL2JNIView$12;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->requestFocus()Z

    .line 359
    sget-object v2, Lorg/egret/egretframeworknative/GL2JNIView;->_gl2jniview:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->myrenderer:Lorg/egret/egretframeworknative/MyRenderer;
    invoke-static {v2}, Lorg/egret/egretframeworknative/GL2JNIView;->access$2(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/MyRenderer;

    move-result-object v2

    invoke-virtual {v2}, Lorg/egret/egretframeworknative/MyRenderer;->handleKeyboardDidHide()V

    .line 360
    const-string v2, "GLSurfaceView"

    const-string v3, "HideSoftInput"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 328
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
