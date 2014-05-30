.class public Lorg/egret/egretframeworknative/egretjni/EGTMusic;
.super Ljava/lang/Object;
.source "EGTMusic.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private _background_music_player:Landroid/media/MediaPlayer;

.field private final _cur_context:Landroid/content/Context;

.field private _cur_music_path:Ljava/lang/String;

.field private _is_music_pause:Z

.field private mLeftVolume:F

.field private mRightVolume:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const-class v0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_cur_music_path:Ljava/lang/String;

    .line 17
    iput-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    .line 27
    iput-object p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_cur_context:Landroid/content/Context;

    .line 29
    invoke-direct {p0}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->initData()V

    .line 30
    return-void
.end method

.method private createMediaplayer(Ljava/lang/String;)Landroid/media/MediaPlayer;
    .locals 9
    .parameter "pPath"

    .prologue
    .line 181
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 184
    .local v0, mediaPlayer:Landroid/media/MediaPlayer;
    :try_start_0
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 185
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 186
    .local v8, fis:Ljava/io/FileInputStream;
    invoke-virtual {v8}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 187
    invoke-virtual {v8}, Ljava/io/FileInputStream;->close()V

    .line 193
    .end local v8           #fis:Ljava/io/FileInputStream;
    :goto_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 195
    iget v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->mLeftVolume:F

    iget v2, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->mRightVolume:F

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 201
    :goto_1
    return-object v0

    .line 189
    :cond_0
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_cur_context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 190
    .local v6, assetFileDescritor:Landroid/content/res/AssetFileDescriptor;
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 196
    .end local v6           #assetFileDescritor:Landroid/content/res/AssetFileDescriptor;
    :catch_0
    move-exception v7

    .line 197
    .local v7, e:Ljava/lang/Exception;
    const/4 v0, 0x0

    .line 198
    sget-object v1, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "error: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method private initData()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/high16 v0, 0x3f00

    .line 166
    iput v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->mLeftVolume:F

    .line 167
    iput v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->mRightVolume:F

    .line 168
    iput-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    .line 169
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_is_music_pause:Z

    .line 170
    iput-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_cur_music_path:Ljava/lang/String;

    .line 171
    return-void
.end method


# virtual methods
.method public end()V
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 139
    :cond_0
    invoke-direct {p0}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->initData()V

    .line 140
    return-void
.end method

.method public getBackgroundVolume()F
    .locals 2

    .prologue
    .line 143
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 144
    iget v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->mLeftVolume:F

    iget v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->mRightVolume:F

    add-float/2addr v0, v1

    const/high16 v1, 0x4000

    div-float/2addr v0, v1

    .line 146
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isBackgroundMusicPlaying()Z
    .locals 2

    .prologue
    .line 123
    const/4 v0, 0x0

    .line 125
    .local v0, ret:Z
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    if-nez v1, :cond_0

    .line 126
    const/4 v0, 0x0

    .line 131
    :goto_0
    return v0

    .line 128
    :cond_0
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    goto :goto_0
.end method

.method public pauseBackgroundMusic()V
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 95
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_is_music_pause:Z

    .line 97
    :cond_0
    return-void
.end method

.method public playBackgroundMusic(Ljava/lang/String;Z)V
    .locals 3
    .parameter "pPath"
    .parameter "isLoop"

    .prologue
    .line 46
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_cur_music_path:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 48
    invoke-direct {p0, p1}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->createMediaplayer(Ljava/lang/String;)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    .line 49
    iput-object p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_cur_music_path:Ljava/lang/String;

    .line 62
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    if-nez v1, :cond_3

    .line 63
    sget-object v1, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->TAG:Ljava/lang/String;

    const-string v2, "playBackgroundMusic: background media player is null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    :goto_1
    return-void

    .line 51
    :cond_1
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_cur_music_path:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 53
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_2

    .line 54
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 56
    :cond_2
    invoke-direct {p0, p1}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->createMediaplayer(Ljava/lang/String;)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    .line 58
    iput-object p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_cur_music_path:Ljava/lang/String;

    goto :goto_0

    .line 66
    :cond_3
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V

    .line 68
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    invoke-virtual {v1, p2}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 71
    :try_start_0
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 72
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 73
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 75
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_is_music_pause:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 76
    :catch_0
    move-exception v0

    .line 77
    .local v0, e:Ljava/lang/Exception;
    sget-object v1, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->TAG:Ljava/lang/String;

    const-string v2, "playBackgroundMusic: error state"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public preloadBackgroundMusic(Ljava/lang/String;)V
    .locals 1
    .parameter "pPath"

    .prologue
    .line 33
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_cur_music_path:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_cur_music_path:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 35
    :cond_0
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    .line 36
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 39
    :cond_1
    invoke-direct {p0, p1}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->createMediaplayer(Ljava/lang/String;)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    .line 41
    iput-object p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_cur_music_path:Ljava/lang/String;

    .line 43
    :cond_2
    return-void
.end method

.method public resumeBackgroundMusic()V
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_is_music_pause:Z

    if-eqz v0, :cond_0

    .line 101
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 102
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_is_music_pause:Z

    .line 104
    :cond_0
    return-void
.end method

.method public rewindBackgroundMusic()V
    .locals 3

    .prologue
    .line 107
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 108
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V

    .line 111
    :try_start_0
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 112
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 113
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 115
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_is_music_pause:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    :cond_0
    :goto_0
    return-void

    .line 116
    :catch_0
    move-exception v0

    .line 117
    .local v0, e:Ljava/lang/Exception;
    sget-object v1, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->TAG:Ljava/lang/String;

    const-string v2, "rewindBackgroundMusic: error state"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setBackgroundVolume(F)V
    .locals 3
    .parameter "pVolume"

    .prologue
    .line 151
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    .line 152
    const/4 p1, 0x0

    .line 155
    :cond_0
    const/high16 v0, 0x3f80

    cmpl-float v0, p1, v0

    if-lez v0, :cond_1

    .line 156
    const/high16 p1, 0x3f80

    .line 159
    :cond_1
    iput p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->mRightVolume:F

    iput p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->mLeftVolume:F

    .line 160
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    .line 161
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    iget v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->mLeftVolume:F

    iget v2, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->mRightVolume:F

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 163
    :cond_2
    return-void
.end method

.method public stopBackgroundMusic()V
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_background_music_player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 88
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->_is_music_pause:Z

    .line 90
    :cond_0
    return-void
.end method
