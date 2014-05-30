.class public Lorg/egret/egretframeworknative/MyRenderer;
.super Ljava/lang/Object;
.source "MyRenderer.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;


# instance fields
.field _screenh:I

.field _screenw:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static exitApp()V
    .locals 1

    .prologue
    .line 68
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 69
    return-void
.end method

.method private static native mainloop()V
.end method

.method private static native nativeDeleteBackward()V
.end method

.method private static native nativeGetContentText()Ljava/lang/String;
.end method

.method private static native nativeInit(II)V
.end method

.method private static native nativeInsertText(Ljava/lang/String;)V
.end method

.method private static native nativeKeyboardDidHide()V
.end method

.method private static native nativeKeyboardDidShow()V
.end method

.method private static native nativeOnPause()V
.end method

.method private static native nativeOnResume()V
.end method

.method private static native nativeReturnOrMenuKeyDown(I)V
.end method

.method private static native nativeTouchesBegin(IFF)V
.end method

.method private static native nativeTouchesCancel([I[F[F)V
.end method

.method private static native nativeTouchesEnd(IFF)V
.end method

.method private static native nativeTouchesMove([I[F[F)V
.end method


# virtual methods
.method public getContentText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    invoke-static {}, Lorg/egret/egretframeworknative/MyRenderer;->nativeGetContentText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public handleActionCancel([I[F[F)V
    .locals 0
    .parameter "ids"
    .parameter "xs"
    .parameter "ys"

    .prologue
    .line 52
    invoke-static {p1, p2, p3}, Lorg/egret/egretframeworknative/MyRenderer;->nativeTouchesCancel([I[F[F)V

    .line 53
    return-void
.end method

.method public handleActionDown(IFF)V
    .locals 0
    .parameter "idPointerDown"
    .parameter "xPointerDown"
    .parameter "yPointerDown"

    .prologue
    .line 36
    invoke-static {p1, p2, p3}, Lorg/egret/egretframeworknative/MyRenderer;->nativeTouchesBegin(IFF)V

    .line 38
    return-void
.end method

.method public handleActionMove([I[F[F)V
    .locals 0
    .parameter "ids"
    .parameter "xs"
    .parameter "ys"

    .prologue
    .line 42
    invoke-static {p1, p2, p3}, Lorg/egret/egretframeworknative/MyRenderer;->nativeTouchesMove([I[F[F)V

    .line 43
    return-void
.end method

.method public handleActionUp(IFF)V
    .locals 0
    .parameter "idPointerUp"
    .parameter "xPointerUp"
    .parameter "yPointerUp"

    .prologue
    .line 47
    invoke-static {p1, p2, p3}, Lorg/egret/egretframeworknative/MyRenderer;->nativeTouchesEnd(IFF)V

    .line 48
    return-void
.end method

.method public handleDeleteBackward()V
    .locals 0

    .prologue
    .line 76
    invoke-static {}, Lorg/egret/egretframeworknative/MyRenderer;->nativeDeleteBackward()V

    .line 77
    return-void
.end method

.method public handleInsertText(Ljava/lang/String;)V
    .locals 0
    .parameter "pText"

    .prologue
    .line 72
    invoke-static {p1}, Lorg/egret/egretframeworknative/MyRenderer;->nativeInsertText(Ljava/lang/String;)V

    .line 73
    return-void
.end method

.method public handleKeyboardDidHide()V
    .locals 0

    .prologue
    .line 84
    invoke-static {}, Lorg/egret/egretframeworknative/MyRenderer;->nativeKeyboardDidHide()V

    .line 85
    return-void
.end method

.method public handleKeyboardDidShow()V
    .locals 0

    .prologue
    .line 80
    invoke-static {}, Lorg/egret/egretframeworknative/MyRenderer;->nativeKeyboardDidShow()V

    .line 81
    return-void
.end method

.method public handleOnPause()V
    .locals 0

    .prologue
    .line 56
    invoke-static {}, Lorg/egret/egretframeworknative/MyRenderer;->nativeOnPause()V

    .line 57
    return-void
.end method

.method public handleOnResume()V
    .locals 0

    .prologue
    .line 60
    invoke-static {}, Lorg/egret/egretframeworknative/MyRenderer;->nativeOnResume()V

    .line 61
    return-void
.end method

.method public handleReturnOrMenuKeyDown(I)V
    .locals 0
    .parameter "pKeyCode"

    .prologue
    .line 64
    invoke-static {p1}, Lorg/egret/egretframeworknative/MyRenderer;->nativeReturnOrMenuKeyDown(I)V

    .line 65
    return-void
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 0
    .parameter "gl"

    .prologue
    .line 15
    invoke-static {}, Lorg/egret/egretframeworknative/MyRenderer;->mainloop()V

    .line 16
    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 0
    .parameter "gl"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 26
    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 3
    .parameter "gl"
    .parameter "config"

    .prologue
    .line 30
    const-string v0, "MyRenderer"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "MyRenderer::onSurfaceCreated ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lorg/egret/egretframeworknative/MyRenderer;->_screenw:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/egret/egretframeworknative/MyRenderer;->_screenh:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    iget v0, p0, Lorg/egret/egretframeworknative/MyRenderer;->_screenw:I

    iget v1, p0, Lorg/egret/egretframeworknative/MyRenderer;->_screenh:I

    invoke-static {v0, v1}, Lorg/egret/egretframeworknative/MyRenderer;->nativeInit(II)V

    .line 32
    return-void
.end method

.method public setScreenWidthAndHeight(II)V
    .locals 0
    .parameter "width"
    .parameter "height"

    .prologue
    .line 19
    iput p1, p0, Lorg/egret/egretframeworknative/MyRenderer;->_screenw:I

    .line 20
    iput p2, p0, Lorg/egret/egretframeworknative/MyRenderer;->_screenh:I

    .line 22
    return-void
.end method
