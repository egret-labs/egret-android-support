.class public Lorg/egret/egretframeworknative/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# static fields
.field private static _activity:Lorg/egret/egretframeworknative/MainActivity;


# instance fields
.field mView:Lorg/egret/egretframeworknative/GL2JNIView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const/4 v0, 0x0

    sput-object v0, Lorg/egret/egretframeworknative/MainActivity;->_activity:Lorg/egret/egretframeworknative/MainActivity;

    .line 79
    const-string v0, "EgretFrameworkNative"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 80
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method public static getActivity()Lorg/egret/egretframeworknative/MainActivity;
    .locals 1

    .prologue
    .line 55
    sget-object v0, Lorg/egret/egretframeworknative/MainActivity;->_activity:Lorg/egret/egretframeworknative/MainActivity;

    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    const/4 v5, -0x1

    .line 17
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 21
    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v3, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 23
    .local v3, framelayout_params:Landroid/view/ViewGroup$LayoutParams;
    new-instance v2, Lorg/egret/egretframeworknative/MainFrameLayout;

    invoke-direct {v2, p0}, Lorg/egret/egretframeworknative/MainFrameLayout;-><init>(Landroid/content/Context;)V

    .line 24
    .local v2, framelayout:Landroid/widget/FrameLayout;
    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 29
    const/4 v4, -0x2

    .line 28
    invoke-direct {v1, v5, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 30
    .local v1, edittext_layout_params:Landroid/view/ViewGroup$LayoutParams;
    new-instance v0, Lorg/egret/egretframeworknative/egretjni/EGTEditText;

    invoke-direct {v0, p0}, Lorg/egret/egretframeworknative/egretjni/EGTEditText;-><init>(Landroid/content/Context;)V

    .line 31
    .local v0, edittext:Lorg/egret/egretframeworknative/egretjni/EGTEditText;
    invoke-virtual {v0, v1}, Lorg/egret/egretframeworknative/egretjni/EGTEditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    invoke-virtual {v2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 36
    sput-object p0, Lorg/egret/egretframeworknative/MainActivity;->_activity:Lorg/egret/egretframeworknative/MainActivity;

    .line 37
    invoke-static {p0}, Lorg/egret/egretframeworknative/egretjni/NativeActivity;->initAndCreate(Landroid/app/Activity;)V

    .line 39
    const-string v4, "MainActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "writeablepath = "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lorg/egret/egretframeworknative/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    new-instance v4, Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {p0}, Lorg/egret/egretframeworknative/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/egret/egretframeworknative/GL2JNIView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lorg/egret/egretframeworknative/MainActivity;->mView:Lorg/egret/egretframeworknative/GL2JNIView;

    .line 42
    iget-object v4, p0, Lorg/egret/egretframeworknative/MainActivity;->mView:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v4, v0}, Lorg/egret/egretframeworknative/GL2JNIView;->setEGTEditText(Lorg/egret/egretframeworknative/egretjni/EGTEditText;)V

    .line 44
    iget-object v4, p0, Lorg/egret/egretframeworknative/MainActivity;->mView:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 48
    invoke-virtual {p0, v2}, Lorg/egret/egretframeworknative/MainActivity;->setContentView(Landroid/view/View;)V

    .line 51
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 67
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 68
    iget-object v0, p0, Lorg/egret/egretframeworknative/MainActivity;->mView:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/GL2JNIView;->onPause()V

    .line 69
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 72
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 73
    iget-object v0, p0, Lorg/egret/egretframeworknative/MainActivity;->mView:Lorg/egret/egretframeworknative/GL2JNIView;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/GL2JNIView;->onResume()V

    .line 74
    return-void
.end method
