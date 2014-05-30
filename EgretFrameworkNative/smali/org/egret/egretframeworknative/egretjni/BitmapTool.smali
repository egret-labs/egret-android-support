.class public Lorg/egret/egretframeworknative/egretjni/BitmapTool;
.super Ljava/lang/Object;
.source "BitmapTool.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BitMapTool"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createWithFile(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 7
    .parameter "name"

    .prologue
    .line 44
    const/4 v1, 0x0

    .line 46
    .local v1, bitmap:Landroid/graphics/Bitmap;
    invoke-static {}, Lorg/egret/egretframeworknative/egretjni/FileTool;->getAssetManager()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 48
    .local v0, asm:Landroid/content/res/AssetManager;
    const-string v4, "Bitmap"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "name : "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    :try_start_0
    invoke-virtual {v0, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 53
    .local v3, is:Ljava/io/InputStream;
    invoke-static {v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 55
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 57
    const-string v4, "BitMapTool"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "createWithFile success:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .end local v3           #is:Ljava/io/InputStream;
    :goto_0
    return-object v1

    .line 58
    :catch_0
    move-exception v2

    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public getBitMapData(Ljava/lang/String;)[B
    .locals 8
    .parameter "name"

    .prologue
    .line 16
    const/4 v0, 0x0

    .line 18
    .local v0, _result:[B
    invoke-static {}, Lorg/egret/egretframeworknative/egretjni/FileTool;->getAssetManager()Landroid/content/res/AssetManager;

    move-result-object v1

    .line 22
    .local v1, asm:Landroid/content/res/AssetManager;
    :try_start_0
    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 24
    .local v4, is:Ljava/io/InputStream;
    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 26
    .local v2, bitmap:Landroid/graphics/Bitmap;
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    mul-int/2addr v5, v6

    mul-int/lit8 v5, v5, 0x4

    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 28
    .local v3, fcbuffer:Ljava/nio/ByteBuffer;
    invoke-virtual {v2, v3}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 29
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 31
    const-string v5, "BitMapTool"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "getBitMapData:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    .line 36
    invoke-virtual {v1}, Landroid/content/res/AssetManager;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .end local v2           #bitmap:Landroid/graphics/Bitmap;
    .end local v3           #fcbuffer:Ljava/nio/ByteBuffer;
    .end local v4           #is:Ljava/io/InputStream;
    :goto_0
    return-object v0

    .line 39
    :catch_0
    move-exception v5

    goto :goto_0
.end method
