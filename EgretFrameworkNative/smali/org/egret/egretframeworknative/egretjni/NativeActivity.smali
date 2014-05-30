.class public Lorg/egret/egretframeworknative/egretjni/NativeActivity;
.super Ljava/lang/Object;
.source "NativeActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static initAndCreate(Landroid/app/Activity;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-static {v0}, Lorg/egret/egretframeworknative/egretjni/FileTool;->setAssetManager(Landroid/content/res/AssetManager;)V

    .line 9
    invoke-static {}, Lorg/egret/egretframeworknative/egretjni/TTFUtil;->getSystemFontName()V

    .line 10
    invoke-static {p0}, Lorg/egret/egretframeworknative/egretjni/EGTBitmap;->setContext(Landroid/content/Context;)V

    .line 11
    invoke-static {p0}, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->initEGTAudioEngine(Landroid/content/Context;)V

    .line 13
    return-void
.end method

.method public static native onCreate()V
.end method
