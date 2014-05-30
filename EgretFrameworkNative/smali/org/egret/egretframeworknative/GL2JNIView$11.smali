.class Lorg/egret/egretframeworknative/GL2JNIView$11;
.super Ljava/lang/Object;
.source "GL2JNIView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/egret/egretframeworknative/GL2JNIView;->deleteBackward()V
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
    iput-object p1, p0, Lorg/egret/egretframeworknative/GL2JNIView$11;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    .line 300
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 303
    iget-object v0, p0, Lorg/egret/egretframeworknative/GL2JNIView$11;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->myrenderer:Lorg/egret/egretframeworknative/MyRenderer;
    invoke-static {v0}, Lorg/egret/egretframeworknative/GL2JNIView;->access$2(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/MyRenderer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/MyRenderer;->handleDeleteBackward()V

    .line 304
    return-void
.end method
