.class public Lorg/egret/egretframeworknative/egretjni/FileTool;
.super Ljava/lang/Object;
.source "FileTool.java"


# static fields
.field private static _assetmanager:Landroid/content/res/AssetManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAssetManager()Landroid/content/res/AssetManager;
    .locals 1

    .prologue
    .line 16
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/FileTool;->_assetmanager:Landroid/content/res/AssetManager;

    return-object v0
.end method

.method public static native nativeSetAssetManager(Landroid/content/res/AssetManager;)V
.end method

.method public static setAssetManager(Landroid/content/res/AssetManager;)V
    .locals 0
    .parameter "asm"

    .prologue
    .line 10
    sput-object p0, Lorg/egret/egretframeworknative/egretjni/FileTool;->_assetmanager:Landroid/content/res/AssetManager;

    .line 11
    invoke-static {p0}, Lorg/egret/egretframeworknative/egretjni/FileTool;->nativeSetAssetManager(Landroid/content/res/AssetManager;)V

    .line 12
    return-void
.end method


# virtual methods
.method public getWritablePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    invoke-static {}, Lorg/egret/egretframeworknative/MainActivity;->getActivity()Lorg/egret/egretframeworknative/MainActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 21
    invoke-static {}, Lorg/egret/egretframeworknative/MainActivity;->getActivity()Lorg/egret/egretframeworknative/MainActivity;

    move-result-object v0

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 22
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
