.class Lorg/egret/egretframeworknative/GL2JNIView$3;
.super Ljava/lang/Object;
.source "GL2JNIView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/egret/egretframeworknative/GL2JNIView;->onKeyDown(ILandroid/view/KeyEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/egret/egretframeworknative/GL2JNIView;

.field private final synthetic val$pKeyCode:I


# direct methods
.method constructor <init>(Lorg/egret/egretframeworknative/GL2JNIView;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/egret/egretframeworknative/GL2JNIView$3;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    iput p2, p0, Lorg/egret/egretframeworknative/GL2JNIView$3;->val$pKeyCode:I

    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 152
    iget-object v0, p0, Lorg/egret/egretframeworknative/GL2JNIView$3;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->myrenderer:Lorg/egret/egretframeworknative/MyRenderer;
    invoke-static {v0}, Lorg/egret/egretframeworknative/GL2JNIView;->access$2(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/MyRenderer;

    move-result-object v1

    iget v0, p0, Lorg/egret/egretframeworknative/GL2JNIView$3;->val$pKeyCode:I

    const/4 v2, 0x4

    if-ne v0, v2, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Lorg/egret/egretframeworknative/MyRenderer;->handleReturnOrMenuKeyDown(I)V

    .line 153
    return-void

    .line 152
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
