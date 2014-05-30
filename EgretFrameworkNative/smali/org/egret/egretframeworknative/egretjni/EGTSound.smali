.class public Lorg/egret/egretframeworknative/egretjni/EGTSound;
.super Ljava/lang/Object;
.source "EGTSound.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/egret/egretframeworknative/egretjni/EGTSound$OnLoadCompletedListener;,
        Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;
    }
.end annotation


# static fields
.field private static final INVALID_SOUND_ID:I = -0x1

.field private static final INVALID_STREAM_ID:I = -0x1

.field private static final MAX_SIMULTANEOUS_STREAMS_DEFAULT:I = 0x5

.field private static final SOUND_PRIORITY:I = 0x1

.field private static final SOUND_QUALITY:I = 0x5

.field private static final SOUND_RATE:F = 1.0f

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mEffecToPlayWhenLoadedArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;",
            ">;"
        }
    .end annotation
.end field

.field private mLeftVolume:F

.field private final mPathSoundIDMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mPathStreamIDsMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private mRightVolume:F

.field private mSemaphore:Ljava/util/concurrent/Semaphore;

.field private mSoundPool:Landroid/media/SoundPool;

.field private mStreamIdSyn:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-class v0, Lorg/egret/egretframeworknative/egretjni/EGTSound;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->TAG:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "pContext"

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    .line 28
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathSoundIDMap:Ljava/util/HashMap;

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mEffecToPlayWhenLoadedArray:Ljava/util/ArrayList;

    .line 47
    iput-object p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mContext:Landroid/content/Context;

    .line 49
    invoke-direct {p0}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->initData()V

    .line 50
    return-void
.end method

.method static synthetic access$0(Lorg/egret/egretframeworknative/egretjni/EGTSound;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 30
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mEffecToPlayWhenLoadedArray:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1(Lorg/egret/egretframeworknative/egretjni/EGTSound;Ljava/lang/String;IZ)I
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 245
    invoke-direct {p0, p1, p2, p3}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->doPlayEffect(Ljava/lang/String;IZ)I

    move-result v0

    return v0
.end method

.method static synthetic access$2(Lorg/egret/egretframeworknative/egretjni/EGTSound;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 32
    iput p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mStreamIdSyn:I

    return-void
.end method

.method static synthetic access$3(Lorg/egret/egretframeworknative/egretjni/EGTSound;)Ljava/util/concurrent/Semaphore;
    .locals 1
    .parameter

    .prologue
    .line 33
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSemaphore:Ljava/util/concurrent/Semaphore;

    return-object v0
.end method

.method private doPlayEffect(Ljava/lang/String;IZ)I
    .locals 9
    .parameter "pPath"
    .parameter "soundId"
    .parameter "pLoop"

    .prologue
    .line 247
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    iget v2, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mLeftVolume:F

    iget v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mRightVolume:F

    const/4 v4, 0x1

    if-eqz p3, :cond_1

    const/4 v5, -0x1

    :goto_0
    const/high16 v6, 0x3f80

    move v1, p2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v7

    .line 250
    .local v7, streamID:I
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/ArrayList;

    .line 251
    .local v8, streamIDs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    if-nez v8, :cond_0

    .line 252
    new-instance v8, Ljava/util/ArrayList;

    .end local v8           #streamIDs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 253
    .restart local v8       #streamIDs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    :cond_0
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 257
    return v7

    .line 247
    .end local v7           #streamID:I
    .end local v8           #streamIDs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_1
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private initData()V
    .locals 4

    .prologue
    const/4 v3, 0x5

    const/high16 v2, 0x3f00

    .line 53
    new-instance v0, Landroid/media/SoundPool;

    const/4 v1, 0x3

    invoke-direct {v0, v3, v1, v3}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    .line 54
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    new-instance v1, Lorg/egret/egretframeworknative/egretjni/EGTSound$OnLoadCompletedListener;

    invoke-direct {v1, p0}, Lorg/egret/egretframeworknative/egretjni/EGTSound$OnLoadCompletedListener;-><init>(Lorg/egret/egretframeworknative/egretjni/EGTSound;)V

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V

    .line 56
    iput v2, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mLeftVolume:F

    .line 57
    iput v2, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mRightVolume:F

    .line 59
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    iput-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSemaphore:Ljava/util/concurrent/Semaphore;

    .line 60
    return-void
.end method


# virtual methods
.method public createSoundIDFromAsset(Ljava/lang/String;)I
    .locals 5
    .parameter "pPath"

    .prologue
    .line 224
    const/4 v1, -0x1

    .line 227
    .local v1, soundID:I
    :try_start_0
    const-string v2, "/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 228
    iget-object v2, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Landroid/media/SoundPool;->load(Ljava/lang/String;I)I

    move-result v1

    .line 238
    :goto_0
    if-nez v1, :cond_0

    .line 239
    const/4 v1, -0x1

    .line 242
    :cond_0
    return v1

    .line 230
    :cond_1
    iget-object v2, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/res/AssetFileDescriptor;I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    .line 232
    :catch_0
    move-exception v0

    .line 233
    .local v0, e:Ljava/lang/Exception;
    const/4 v1, -0x1

    .line 234
    sget-object v2, Lorg/egret/egretframeworknative/egretjni/EGTSound;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "error: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public end()V
    .locals 2

    .prologue
    const/high16 v1, 0x3f00

    .line 212
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    .line 213
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 214
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathSoundIDMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 215
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mEffecToPlayWhenLoadedArray:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 217
    iput v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mLeftVolume:F

    .line 218
    iput v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mRightVolume:F

    .line 220
    invoke-direct {p0}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->initData()V

    .line 221
    return-void
.end method

.method public getEffectsVolume()F
    .locals 2

    .prologue
    .line 185
    iget v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mLeftVolume:F

    iget v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mRightVolume:F

    add-float/2addr v0, v1

    const/high16 v1, 0x4000

    div-float/2addr v0, v1

    return v0
.end method

.method public pauseAllEffects()V
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->autoPause()V

    .line 151
    return-void
.end method

.method public pauseEffect(I)V
    .locals 1
    .parameter "pStreamID"

    .prologue
    .line 142
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0, p1}, Landroid/media/SoundPool;->pause(I)V

    .line 143
    return-void
.end method

.method public playEffect(Ljava/lang/String;ZFFF)I
    .locals 13
    .parameter "pPath"
    .parameter "pLoop"
    .parameter "pitch"
    .parameter "pan"
    .parameter "gain"

    .prologue
    .line 95
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathSoundIDMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    .line 96
    .local v9, soundID:Ljava/lang/Integer;
    const/4 v10, -0x1

    .line 98
    .local v10, streamID:I
    if-eqz v9, :cond_0

    .line 100
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0, p1, v0, p2}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->doPlayEffect(Ljava/lang/String;IZ)I

    move-result v10

    :goto_0
    move v0, v10

    .line 126
    :goto_1
    return v0

    .line 103
    :cond_0
    invoke-virtual {p0, p1}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->preloadEffect(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 104
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 106
    const/4 v0, -0x1

    goto :goto_1

    .line 110
    :cond_1
    iget-object v11, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    monitor-enter v11

    .line 112
    :try_start_0
    iget-object v12, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mEffecToPlayWhenLoadedArray:Ljava/util/ArrayList;

    new-instance v0, Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v3

    move-object v1, p0

    move-object v2, p1

    move v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    .line 113
    invoke-direct/range {v0 .. v7}, Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;-><init>(Lorg/egret/egretframeworknative/egretjni/EGTSound;Ljava/lang/String;IZFFF)V

    .line 112
    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 117
    :try_start_1
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 119
    iget v10, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mStreamIdSyn:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 110
    :try_start_2
    monitor-exit v11

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 120
    :catch_0
    move-exception v8

    .line 121
    .local v8, e:Ljava/lang/Exception;
    :try_start_3
    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const/4 v0, -0x1

    goto :goto_1
.end method

.method public preloadEffect(Ljava/lang/String;)I
    .locals 3
    .parameter "pPath"

    .prologue
    .line 63
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathSoundIDMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 65
    .local v0, soundID:Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 66
    invoke-virtual {p0, p1}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->createSoundIDFromAsset(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 68
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 69
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathSoundIDMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method

.method public resumeAllEffects()V
    .locals 5

    .prologue
    .line 156
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 157
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 158
    .local v1, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/Integer;>;>;>;"
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    .line 165
    .end local v1           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/Integer;>;>;>;"
    :cond_1
    return-void

    .line 159
    .restart local v1       #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/Integer;>;>;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 160
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/Integer;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 161
    .local v2, pStreamID:I
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v3, v2}, Landroid/media/SoundPool;->resume(I)V

    goto :goto_0
.end method

.method public resumeEffect(I)V
    .locals 1
    .parameter "pStreamID"

    .prologue
    .line 146
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0, p1}, Landroid/media/SoundPool;->resume(I)V

    .line 147
    return-void
.end method

.method public setEffectsVolume(F)V
    .locals 7
    .parameter "pVolume"

    .prologue
    .line 190
    const/4 v3, 0x0

    cmpg-float v3, p1, v3

    if-gez v3, :cond_0

    .line 191
    const/4 p1, 0x0

    .line 193
    :cond_0
    const/high16 v3, 0x3f80

    cmpl-float v3, p1, v3

    if-lez v3, :cond_1

    .line 194
    const/high16 p1, 0x3f80

    .line 197
    :cond_1
    iput p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mRightVolume:F

    iput p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mLeftVolume:F

    .line 200
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 201
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 202
    .local v1, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/Integer;>;>;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_4

    .line 209
    .end local v1           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/Integer;>;>;>;"
    :cond_3
    return-void

    .line 203
    .restart local v1       #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/Integer;>;>;>;"
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 204
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/Integer;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 205
    .local v2, pStreamID:I
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    iget v5, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mLeftVolume:F

    iget v6, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mRightVolume:F

    invoke-virtual {v3, v2, v5, v6}, Landroid/media/SoundPool;->setVolume(IFF)V

    goto :goto_0
.end method

.method public stopAllEffects()V
    .locals 5

    .prologue
    .line 170
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 171
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 172
    .local v1, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<*>;"
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    .line 181
    .end local v1           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<*>;"
    :cond_1
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    .line 182
    return-void

    .line 173
    .restart local v1       #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<*>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 174
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/Integer;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 175
    .local v2, pStreamID:I
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v3, v2}, Landroid/media/SoundPool;->stop(I)V

    goto :goto_0
.end method

.method public stopEffect(I)V
    .locals 4
    .parameter "pStreamID"

    .prologue
    .line 130
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v1, p1}, Landroid/media/SoundPool;->stop(I)V

    .line 133
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    .line 139
    :goto_0
    return-void

    .line 133
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 134
    .local v0, pPath:Ljava/lang/String;
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 135
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0
.end method

.method public unloadEffect(Ljava/lang/String;)V
    .locals 6
    .parameter "pPath"

    .prologue
    .line 78
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 79
    .local v2, streamIDs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    if-eqz v2, :cond_0

    .line 80
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 84
    :cond_0
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathStreamIDsMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathSoundIDMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 88
    .local v1, soundID:Ljava/lang/Integer;
    if-eqz v1, :cond_1

    .line 89
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/media/SoundPool;->unload(I)Z

    .line 90
    iget-object v3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mPathSoundIDMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    :cond_1
    return-void

    .line 80
    .end local v1           #soundID:Ljava/lang/Integer;
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 81
    .local v0, pStreamID:Ljava/lang/Integer;
    iget-object v4, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/media/SoundPool;->stop(I)V

    goto :goto_0
.end method
