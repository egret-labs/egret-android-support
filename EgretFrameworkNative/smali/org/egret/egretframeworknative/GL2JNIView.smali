.class public Lorg/egret/egretframeworknative/GL2JNIView;
.super Landroid/opengl/GLSurfaceView;
.source "GL2JNIView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/egret/egretframeworknative/GL2JNIView$ConfigChooser;,
        Lorg/egret/egretframeworknative/GL2JNIView$ContextFactory;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final HANDLER_CLOSE_IME_KEYBOARD:I = 0x3

.field private static final HANDLER_OPEN_IME_KEYBOARD:I = 0x2

.field private static TAG:Ljava/lang/String;

.field public static _gl2jniview:Lorg/egret/egretframeworknative/GL2JNIView;

.field private static _handler:Landroid/os/Handler;

.field private static _textinputwrapper:Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;

.field private static context:Landroid/content/Context;

.field private static keyBoardMessage:I


# instance fields
.field private _egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;

.field private myrenderer:Lorg/egret/egretframeworknative/MyRenderer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 74
    const-string v0, "GL2JNIView"

    sput-object v0, Lorg/egret/egretframeworknative/GL2JNIView;->TAG:Ljava/lang/String;

    .line 81
    const/4 v0, 0x0

    sput-object v0, Lorg/egret/egretframeworknative/GL2JNIView;->context:Landroid/content/Context;

    .line 309
    const/4 v0, 0x3

    sput v0, Lorg/egret/egretframeworknative/GL2JNIView;->keyBoardMessage:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    const/4 v0, 0x0

    .line 91
    invoke-direct {p0, p1}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 92
    sput-object p1, Lorg/egret/egretframeworknative/GL2JNIView;->context:Landroid/content/Context;

    .line 93
    invoke-direct {p0, v0, v0, v0}, Lorg/egret/egretframeworknative/GL2JNIView;->init(ZII)V

    .line 94
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ZII)V
    .locals 0
    .parameter "context"
    .parameter "translucent"
    .parameter "depth"
    .parameter "stencil"

    .prologue
    .line 97
    invoke-direct {p0, p1}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 98
    sput-object p1, Lorg/egret/egretframeworknative/GL2JNIView;->context:Landroid/content/Context;

    .line 99
    invoke-direct {p0, p2, p3, p4}, Lorg/egret/egretframeworknative/GL2JNIView;->init(ZII)V

    .line 100
    return-void
.end method

.method static synthetic access$0()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    sget-object v0, Lorg/egret/egretframeworknative/GL2JNIView;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Ljava/lang/String;Ljavax/microedition/khronos/egl/EGL10;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 412
    invoke-static {p0, p1}, Lorg/egret/egretframeworknative/GL2JNIView;->checkEglError(Ljava/lang/String;Ljavax/microedition/khronos/egl/EGL10;)V

    return-void
.end method

.method static synthetic access$2(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/MyRenderer;
    .locals 1
    .parameter

    .prologue
    .line 79
    iget-object v0, p0, Lorg/egret/egretframeworknative/GL2JNIView;->myrenderer:Lorg/egret/egretframeworknative/MyRenderer;

    return-object v0
.end method

.method static synthetic access$3(I)V
    .locals 0
    .parameter

    .prologue
    .line 309
    sput p0, Lorg/egret/egretframeworknative/GL2JNIView;->keyBoardMessage:I

    return-void
.end method

.method static synthetic access$4(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/egretjni/EGTEditText;
    .locals 1
    .parameter

    .prologue
    .line 88
    iget-object v0, p0, Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    return-object v0
.end method

.method static synthetic access$5()Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;
    .locals 1

    .prologue
    .line 86
    sget-object v0, Lorg/egret/egretframeworknative/GL2JNIView;->_textinputwrapper:Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;

    return-object v0
.end method

.method private static checkEglError(Ljava/lang/String;Ljavax/microedition/khronos/egl/EGL10;)V
    .locals 6
    .parameter "prompt"
    .parameter "egl"

    .prologue
    .line 414
    :goto_0
    invoke-interface {p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    .local v0, error:I
    const/16 v1, 0x3000

    if-ne v0, v1, :cond_0

    .line 417
    return-void

    .line 415
    :cond_0
    sget-object v1, Lorg/egret/egretframeworknative/GL2JNIView;->TAG:Ljava/lang/String;

    const-string v2, "%s: EGL error: 0x%x"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    const/4 v4, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static closeIMEKeyboard()V
    .locals 2

    .prologue
    .line 285
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 286
    .local v0, msg:Landroid/os/Message;
    const/4 v1, 0x3

    iput v1, v0, Landroid/os/Message;->what:I

    .line 287
    sget-object v1, Lorg/egret/egretframeworknative/GL2JNIView;->_handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 288
    return-void
.end method

.method private getContentText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 274
    iget-object v0, p0, Lorg/egret/egretframeworknative/GL2JNIView;->myrenderer:Lorg/egret/egretframeworknative/MyRenderer;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/MyRenderer;->getContentText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private init(ZII)V
    .locals 7
    .parameter "translucent"
    .parameter "depth"
    .parameter "stencil"

    .prologue
    const/4 v5, 0x5

    const/16 v1, 0x8

    .line 317
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lorg/egret/egretframeworknative/GL2JNIView;->setEGLContextClientVersion(I)V

    .line 318
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/egret/egretframeworknative/GL2JNIView;->setFocusableInTouchMode(Z)V

    .line 320
    sput-object p0, Lorg/egret/egretframeworknative/GL2JNIView;->_gl2jniview:Lorg/egret/egretframeworknative/GL2JNIView;

    .line 322
    new-instance v0, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;

    invoke-direct {v0, p0}, Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;-><init>(Lorg/egret/egretframeworknative/GL2JNIView;)V

    sput-object v0, Lorg/egret/egretframeworknative/GL2JNIView;->_textinputwrapper:Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;

    .line 324
    new-instance v0, Lorg/egret/egretframeworknative/GL2JNIView$12;

    invoke-direct {v0, p0}, Lorg/egret/egretframeworknative/GL2JNIView$12;-><init>(Lorg/egret/egretframeworknative/GL2JNIView;)V

    sput-object v0, Lorg/egret/egretframeworknative/GL2JNIView;->_handler:Landroid/os/Handler;

    .line 373
    if-eqz p1, :cond_0

    .line 374
    invoke-virtual {p0}, Lorg/egret/egretframeworknative/GL2JNIView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v2, -0x3

    invoke-interface {v0, v2}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 380
    :cond_0
    new-instance v0, Lorg/egret/egretframeworknative/GL2JNIView$ContextFactory;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lorg/egret/egretframeworknative/GL2JNIView$ContextFactory;-><init>(Lorg/egret/egretframeworknative/GL2JNIView$ContextFactory;)V

    invoke-virtual {p0, v0}, Lorg/egret/egretframeworknative/GL2JNIView;->setEGLContextFactory(Landroid/opengl/GLSurfaceView$EGLContextFactory;)V

    .line 387
    if-eqz p1, :cond_1

    .line 388
    new-instance v0, Lorg/egret/egretframeworknative/GL2JNIView$ConfigChooser;

    move v2, v1

    move v3, v1

    move v4, v1

    move v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lorg/egret/egretframeworknative/GL2JNIView$ConfigChooser;-><init>(IIIIII)V

    .line 387
    :goto_0
    invoke-virtual {p0, v0}, Lorg/egret/egretframeworknative/GL2JNIView;->setEGLConfigChooser(Landroid/opengl/GLSurfaceView$EGLConfigChooser;)V

    .line 392
    new-instance v0, Lorg/egret/egretframeworknative/MyRenderer;

    invoke-direct {v0}, Lorg/egret/egretframeworknative/MyRenderer;-><init>()V

    iput-object v0, p0, Lorg/egret/egretframeworknative/GL2JNIView;->myrenderer:Lorg/egret/egretframeworknative/MyRenderer;

    .line 393
    iget-object v0, p0, Lorg/egret/egretframeworknative/GL2JNIView;->myrenderer:Lorg/egret/egretframeworknative/MyRenderer;

    invoke-virtual {p0, v0}, Lorg/egret/egretframeworknative/GL2JNIView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    .line 394
    return-void

    .line 389
    :cond_1
    new-instance v0, Lorg/egret/egretframeworknative/GL2JNIView$ConfigChooser;

    const/4 v2, 0x6

    const/4 v4, 0x0

    move v1, v5

    move v3, v5

    move v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lorg/egret/egretframeworknative/GL2JNIView$ConfigChooser;-><init>(IIIIII)V

    goto :goto_0
.end method

.method public static isHandleOpenKeyboardMessage()Z
    .locals 2

    .prologue
    .line 313
    sget v0, Lorg/egret/egretframeworknative/GL2JNIView;->keyBoardMessage:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static openIMEKeyboard()V
    .locals 2

    .prologue
    .line 278
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 279
    .local v0, msg:Landroid/os/Message;
    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    .line 280
    sget-object v1, Lorg/egret/egretframeworknative/GL2JNIView;->_gl2jniview:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-direct {v1}, Lorg/egret/egretframeworknative/GL2JNIView;->getContentText()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 281
    sget-object v1, Lorg/egret/egretframeworknative/GL2JNIView;->_handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 282
    return-void
.end method


# virtual methods
.method public deleteBackward()V
    .locals 1

    .prologue
    .line 300
    new-instance v0, Lorg/egret/egretframeworknative/GL2JNIView$11;

    invoke-direct {v0, p0}, Lorg/egret/egretframeworknative/GL2JNIView$11;-><init>(Lorg/egret/egretframeworknative/GL2JNIView;)V

    invoke-virtual {p0, v0}, Lorg/egret/egretframeworknative/GL2JNIView;->queueEvent(Ljava/lang/Runnable;)V

    .line 306
    return-void
.end method

.method public getEGTEditText()Lorg/egret/egretframeworknative/egretjni/EGTEditText;
    .locals 1

    .prologue
    .line 260
    iget-object v0, p0, Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    return-object v0
.end method

.method public insertText(Ljava/lang/String;)V
    .locals 1
    .parameter "pText"

    .prologue
    .line 291
    new-instance v0, Lorg/egret/egretframeworknative/GL2JNIView$10;

    invoke-direct {v0, p0, p1}, Lorg/egret/egretframeworknative/GL2JNIView$10;-><init>(Lorg/egret/egretframeworknative/GL2JNIView;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/egret/egretframeworknative/GL2JNIView;->queueEvent(Ljava/lang/Runnable;)V

    .line 297
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .parameter "pKeyCode"
    .parameter "pKeyEvent"

    .prologue
    .line 144
    const-string v0, "GL2JNIView"

    const-string v1, "onKeyDown"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    sparse-switch p1, :sswitch_data_0

    .line 157
    invoke-super {p0, p1, p2}, Landroid/opengl/GLSurfaceView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    :goto_0
    return v0

    .line 148
    :sswitch_0
    const-string v1, "GL2JNIView"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v0, "onKeyDown pKeyCode = "

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    const-string v0, "KeyEvent.KEYCODE_BACK"

    :goto_1
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    new-instance v0, Lorg/egret/egretframeworknative/GL2JNIView$3;

    invoke-direct {v0, p0, p1}, Lorg/egret/egretframeworknative/GL2JNIView$3;-><init>(Lorg/egret/egretframeworknative/GL2JNIView;I)V

    invoke-virtual {p0, v0}, Lorg/egret/egretframeworknative/GL2JNIView;->queueEvent(Ljava/lang/Runnable;)V

    .line 155
    const/4 v0, 0x1

    goto :goto_0

    .line 148
    :cond_0
    const-string v0, "KeyEvent.KEYCODE_KEYCODE_MENU"

    goto :goto_1

    .line 145
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_0
        0x52 -> :sswitch_0
    .end sparse-switch
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 116
    sget-object v0, Lorg/egret/egretframeworknative/GL2JNIView;->TAG:Ljava/lang/String;

    const-string v1, "onPuse"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    new-instance v0, Lorg/egret/egretframeworknative/GL2JNIView$1;

    invoke-direct {v0, p0}, Lorg/egret/egretframeworknative/GL2JNIView$1;-><init>(Lorg/egret/egretframeworknative/GL2JNIView;)V

    invoke-virtual {p0, v0}, Lorg/egret/egretframeworknative/GL2JNIView;->queueEvent(Ljava/lang/Runnable;)V

    .line 127
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 131
    sget-object v0, Lorg/egret/egretframeworknative/GL2JNIView;->TAG:Ljava/lang/String;

    const-string v1, "onResume"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    invoke-super {p0}, Landroid/opengl/GLSurfaceView;->onResume()V

    .line 134
    new-instance v0, Lorg/egret/egretframeworknative/GL2JNIView$2;

    invoke-direct {v0, p0}, Lorg/egret/egretframeworknative/GL2JNIView$2;-><init>(Lorg/egret/egretframeworknative/GL2JNIView;)V

    invoke-virtual {p0, v0}, Lorg/egret/egretframeworknative/GL2JNIView;->queueEvent(Ljava/lang/Runnable;)V

    .line 140
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 3
    .parameter "pNewSurfaceWidth"
    .parameter "pNewSurfaceHeight"
    .parameter "pOldSurfaceWidth"
    .parameter "pOldSurfaceHeight"

    .prologue
    .line 108
    invoke-virtual {p0}, Lorg/egret/egretframeworknative/GL2JNIView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 109
    const-string v0, "GL2JNIView"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GL2JNIView::onSizeChanged ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    iget-object v0, p0, Lorg/egret/egretframeworknative/GL2JNIView;->myrenderer:Lorg/egret/egretframeworknative/MyRenderer;

    invoke-virtual {v0, p1, p2}, Lorg/egret/egretframeworknative/MyRenderer;->setScreenWidthAndHeight(II)V

    .line 112
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 24
    .parameter "pMotionEvent"

    .prologue
    .line 164
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v12

    .line 165
    .local v12, pointerNumber:I
    new-array v9, v12, [I

    .line 166
    .local v9, ids:[I
    new-array v0, v12, [F

    move-object/from16 v17, v0

    .line 167
    .local v17, xs:[F
    new-array v0, v12, [F

    move-object/from16 v22, v0

    .line 169
    .local v22, ys:[F
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-lt v4, v12, :cond_0

    .line 175
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v23

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    packed-switch v23, :pswitch_data_0

    .line 252
    :goto_1
    :pswitch_0
    const/16 v23, 0x1

    return v23

    .line 170
    :cond_0
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v23

    aput v23, v9, v4

    .line 171
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v23

    aput v23, v17, v4

    .line 172
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v23

    aput v23, v22, v4

    .line 169
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 177
    :pswitch_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v23

    shr-int/lit8 v11, v23, 0x8

    .line 178
    .local v11, indexPointerDown:I
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    .line 179
    .local v6, idPointerDown:I
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getX(I)F

    move-result v14

    .line 180
    .local v14, xPointerDown:F
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getY(I)F

    move-result v19

    .line 182
    .local v19, yPointerDown:F
    new-instance v23, Lorg/egret/egretframeworknative/GL2JNIView$4;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move/from16 v2, v19

    invoke-direct {v0, v1, v6, v14, v2}, Lorg/egret/egretframeworknative/GL2JNIView$4;-><init>(Lorg/egret/egretframeworknative/GL2JNIView;IFF)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/egret/egretframeworknative/GL2JNIView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 192
    .end local v6           #idPointerDown:I
    .end local v11           #indexPointerDown:I
    .end local v14           #xPointerDown:F
    .end local v19           #yPointerDown:F
    :pswitch_2
    const/16 v23, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    .line 193
    .local v5, idDown:I
    const/16 v23, 0x0

    aget v13, v17, v23

    .line 194
    .local v13, xDown:F
    const/16 v23, 0x0

    aget v18, v22, v23

    .line 196
    .local v18, yDown:F
    new-instance v23, Lorg/egret/egretframeworknative/GL2JNIView$5;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move/from16 v2, v18

    invoke-direct {v0, v1, v5, v13, v2}, Lorg/egret/egretframeworknative/GL2JNIView$5;-><init>(Lorg/egret/egretframeworknative/GL2JNIView;IFF)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/egret/egretframeworknative/GL2JNIView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 205
    .end local v5           #idDown:I
    .end local v13           #xDown:F
    .end local v18           #yDown:F
    :pswitch_3
    new-instance v23, Lorg/egret/egretframeworknative/GL2JNIView$6;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v17

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v9, v2, v3}, Lorg/egret/egretframeworknative/GL2JNIView$6;-><init>(Lorg/egret/egretframeworknative/GL2JNIView;[I[F[F)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/egret/egretframeworknative/GL2JNIView;->queueEvent(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 214
    :pswitch_4
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v23

    shr-int/lit8 v10, v23, 0x8

    .line 215
    .local v10, indexPointUp:I
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v7

    .line 216
    .local v7, idPointerUp:I
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Landroid/view/MotionEvent;->getX(I)F

    move-result v15

    .line 217
    .local v15, xPointerUp:F
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Landroid/view/MotionEvent;->getY(I)F

    move-result v20

    .line 219
    .local v20, yPointerUp:F
    new-instance v23, Lorg/egret/egretframeworknative/GL2JNIView$7;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move/from16 v2, v20

    invoke-direct {v0, v1, v7, v15, v2}, Lorg/egret/egretframeworknative/GL2JNIView$7;-><init>(Lorg/egret/egretframeworknative/GL2JNIView;IFF)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/egret/egretframeworknative/GL2JNIView;->queueEvent(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 229
    .end local v7           #idPointerUp:I
    .end local v10           #indexPointUp:I
    .end local v15           #xPointerUp:F
    .end local v20           #yPointerUp:F
    :pswitch_5
    const/16 v23, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v8

    .line 230
    .local v8, idUp:I
    const/16 v23, 0x0

    aget v16, v17, v23

    .line 231
    .local v16, xUp:F
    const/16 v23, 0x0

    aget v21, v22, v23

    .line 233
    .local v21, yUp:F
    new-instance v23, Lorg/egret/egretframeworknative/GL2JNIView$8;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move/from16 v2, v16

    move/from16 v3, v21

    invoke-direct {v0, v1, v8, v2, v3}, Lorg/egret/egretframeworknative/GL2JNIView$8;-><init>(Lorg/egret/egretframeworknative/GL2JNIView;IFF)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/egret/egretframeworknative/GL2JNIView;->queueEvent(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 242
    .end local v8           #idUp:I
    .end local v16           #xUp:F
    .end local v21           #yUp:F
    :pswitch_6
    new-instance v23, Lorg/egret/egretframeworknative/GL2JNIView$9;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v17

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v9, v2, v3}, Lorg/egret/egretframeworknative/GL2JNIView$9;-><init>(Lorg/egret/egretframeworknative/GL2JNIView;[I[F[F)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/egret/egretframeworknative/GL2JNIView;->queueEvent(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 175
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_5
        :pswitch_3
        :pswitch_6
        :pswitch_0
        :pswitch_1
        :pswitch_4
    .end packed-switch
.end method

.method public setEGTEditText(Lorg/egret/egretframeworknative/egretjni/EGTEditText;)V
    .locals 2
    .parameter "edittext"

    .prologue
    .line 264
    iput-object p1, p0, Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    .line 265
    iget-object v0, p0, Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    if-eqz v0, :cond_0

    sget-object v0, Lorg/egret/egretframeworknative/GL2JNIView;->_textinputwrapper:Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;

    if-eqz v0, :cond_0

    .line 266
    iget-object v0, p0, Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    sget-object v1, Lorg/egret/egretframeworknative/GL2JNIView;->_textinputwrapper:Lorg/egret/egretframeworknative/egretjni/EGTTextInputWrapper;

    invoke-virtual {v0, v1}, Lorg/egret/egretframeworknative/egretjni/EGTEditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 267
    iget-object v0, p0, Lorg/egret/egretframeworknative/GL2JNIView;->_egt_edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    invoke-virtual {v0, p0}, Lorg/egret/egretframeworknative/egretjni/EGTEditText;->setGL2JNIView(Lorg/egret/egretframeworknative/GL2JNIView;)V

    .line 268
    invoke-virtual {p0}, Lorg/egret/egretframeworknative/GL2JNIView;->requestFocus()Z

    .line 270
    :cond_0
    return-void
.end method
