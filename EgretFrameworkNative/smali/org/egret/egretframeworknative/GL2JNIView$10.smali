.class Lorg/egret/egretframeworknative/GL2JNIView$10;
.super Ljava/lang/Object;
.source "GL2JNIView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/egret/egretframeworknative/GL2JNIView;->insertText(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/egret/egretframeworknative/GL2JNIView;

.field private final synthetic val$pText:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/egret/egretframeworknative/GL2JNIView;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/egret/egretframeworknative/GL2JNIView$10;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    iput-object p2, p0, Lorg/egret/egretframeworknative/GL2JNIView$10;->val$pText:Ljava/lang/String;

    .line 291
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 294
    iget-object v0, p0, Lorg/egret/egretframeworknative/GL2JNIView$10;->this$0:Lorg/egret/egretframeworknative/GL2JNIView;

    #getter for: Lorg/egret/egretframeworknative/GL2JNIView;->myrenderer:Lorg/egret/egretframeworknative/MyRenderer;
    invoke-static {v0}, Lorg/egret/egretframeworknative/GL2JNIView;->access$2(Lorg/egret/egretframeworknative/GL2JNIView;)Lorg/egret/egretframeworknative/MyRenderer;

    move-result-object v0

    iget-object v1, p0, Lorg/egret/egretframeworknative/GL2JNIView$10;->val$pText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/egret/egretframeworknative/MyRenderer;->handleInsertText(Ljava/lang/String;)V

    .line 295
    return-void
.end method
