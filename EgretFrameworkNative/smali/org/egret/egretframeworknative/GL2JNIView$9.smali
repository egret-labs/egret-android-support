.class Lorg/egret/egretframeworknative/GL2JNIView$9;
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

.field private final synthetic val$ids:[I

.field private final synthetic val$xs:[F

.field private final synthetic val$ys:[F


# direct methods
.method constructor <init>(Lorg/egret/egretframeworknative/GL2JNIView;[I[F[F)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/egret/egretframeworknative/GL2JNIView$9;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    iput-object p2, p0, Lorg/egret/egretframeworknative/GL2JNIView$9;->val$ids:[I

    iput-object p3, p0, Lorg/egret/egretframeworknative/GL2JNIView$9;->val$xs:[F

    iput-object p4, p0, Lorg/egret/egretframeworknative/GL2JNIView$9;->val$ys:[F

    .line 242
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 245
    iget-object v0, p0, Lorg/egret/egretframeworknative/GL2JNIView$9;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->myrenderer:Lorg/egret/egretframeworknative/MyRenderer;
    invoke-static {v0}, Lorg/egret/egretframeworknative/GL2JNIView;->access$2(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/MyRenderer;

    move-result-object v0

    iget-object v1, p0, Lorg/egret/egretframeworknative/GL2JNIView$9;->val$ids:[I

    iget-object v2, p0, Lorg/egret/egretframeworknative/GL2JNIView$9;->val$xs:[F

    iget-object v3, p0, Lorg/egret/egretframeworknative/GL2JNIView$9;->val$ys:[F

    invoke-virtual {v0, v1, v2, v3}, Lorg/egret/egretframeworknative/MyRenderer;->handleActionCancel([I[F[F)V

    .line 246
    return-void
.end method
