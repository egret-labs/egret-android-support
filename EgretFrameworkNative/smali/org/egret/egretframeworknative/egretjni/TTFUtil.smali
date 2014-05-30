.class public Lorg/egret/egretframeworknative/egretjni/TTFUtil;
.super Ljava/lang/Object;
.source "TTFUtil.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "TTFUtil"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getSystemFontName()V
    .locals 13

    .prologue
    .line 15
    const-string v10, "TTFUtil"

    const-string v11, "getSystemFontName"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    const-string v8, ""

    .line 17
    .local v8, output:Ljava/lang/String;
    const-string v4, "/system/fonts"

    .line 18
    .local v4, filepath:Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 19
    .local v3, file:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 20
    const-string v10, "TTFUtil"

    const-string v11, "/system/fonts is exists"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v10

    if-nez v10, :cond_0

    .line 23
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 24
    invoke-virtual {v3}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v2

    .line 25
    .local v2, dir:[Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v11, "  Directory contents:\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 27
    const/4 v5, 0x0

    .local v5, i:I
    :goto_0
    array-length v10, v2

    if-lt v5, v10, :cond_1

    .line 30
    const-string v10, "TTFUtil"

    invoke-static {v10, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .end local v2           #dir:[Ljava/lang/String;
    .end local v5           #i:I
    :cond_0
    :goto_1
    new-instance v0, Ljava/io/File;

    const-string v10, "/system/fonts/DroidSerif-Regular.ttf"

    invoke-direct {v0, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 40
    .local v0, _dsr_r_ttf:Ljava/io/File;
    const-string v8, "  "

    .line 41
    const-string v10, "TTFUtil"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "read: "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    :try_start_0
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v10, Ljava/io/FileReader;

    invoke-direct {v10, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v6, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 44
    .local v6, input:Ljava/io/BufferedReader;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 47
    .local v1, buffer:Ljava/lang/StringBuffer;
    :goto_2
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v9

    .local v9, text:Ljava/lang/String;
    if-nez v9, :cond_3

    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 51
    const-string v10, "TTFUtil"

    invoke-static {v10, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .end local v1           #buffer:Ljava/lang/StringBuffer;
    .end local v6           #input:Ljava/io/BufferedReader;
    .end local v9           #text:Ljava/lang/String;
    :goto_3
    return-void

    .line 28
    .end local v0           #_dsr_r_ttf:Ljava/io/File;
    .restart local v2       #dir:[Ljava/lang/String;
    .restart local v5       #i:I
    :cond_1
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v11, v2, v5

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 27
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 36
    .end local v2           #dir:[Ljava/lang/String;
    .end local v5           #i:I
    :cond_2
    const-string v10, "TTFUtil"

    const-string v11, "/system/fonts is not exists"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 48
    .restart local v0       #_dsr_r_ttf:Ljava/io/File;
    .restart local v1       #buffer:Ljava/lang/StringBuffer;
    .restart local v6       #input:Ljava/io/BufferedReader;
    .restart local v9       #text:Ljava/lang/String;
    :cond_3
    :try_start_1
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "  "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "/n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 53
    .end local v1           #buffer:Ljava/lang/StringBuffer;
    .end local v6           #input:Ljava/io/BufferedReader;
    .end local v9           #text:Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 54
    .local v7, ioException:Ljava/io/IOException;
    const-string v10, "TTFUtil"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "read file error : "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    const-string v10, "TTFUtil"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "\t\t\t\t"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3
.end method
