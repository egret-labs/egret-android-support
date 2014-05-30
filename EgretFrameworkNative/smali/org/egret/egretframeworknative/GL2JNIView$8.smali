.class Lorg/egret/egretframeworknative/GL2JNIView$8;
.super Ljava/lang/Object;
.source "GL2JNIView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/egret/egretframeworknative/GL2JNIView;->onTouchEvent(Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/egret/egretframeworknative/GL2JNIView;

.field private final synthetic val$idUp:I

.field private final synthetic val$xUp:F

.field private final synthetic val$yUp:F


# direct methods
.method constructor <init>(Lorg/egret/egretframeworknative/GL2JNIView;IFF)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/egret/egretframeworknative/GL2JNIView$8;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    iput p2, p0, Lorg/egret/egretframeworknative/GL2JNIView$8;->val$idUp:I

    iput p3, p0, Lorg/egret/egretframeworknative/GL2JNIView$8;->val$xUp:F

    iput p4, p0, Lorg/egret/egretframeworknative/GL2JNIView$8;->val$yUp:F

    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 236
    iget-object v0, p0, Lorg/egret/egretframeworknative/GL2JNIView$8;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->myrenderer:Lorg/egret/egretframeworknative/MyRenderer;
    invoke-static {v0}, Lorg/egret/egretframeworknative/GL2JNIView;->access$2(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/MyRenderer;

    move-result-object v0

    iget v1, p0, Lorg/egret/egretframeworknative/GL2JNIView$8;->val$idUp:I

    iget v2, p0, Lorg/egret/egretframeworknative/GL2JNIView$8;->val$xUp:F

    iget v3, p0, Lorg/egret/egretframeworknative/GL2JNIView$8;->val$yUp:F

    invoke-virtual {v0, v1, v2, v3}, Lorg/egret/egretframeworknative/MyRenderer;->handleActionUp(IFF)V

    .line 237
    return-void
.end method
