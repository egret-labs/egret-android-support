.class public Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;
.super Ljava/lang/Object;
.source "EGTAudioEngine.java"


# static fields
.field private static _cur_context:Landroid/content/Context;

.field private static _egtmusic:Lorg/egret/egretframeworknative/egretjni/EGTMusic;

.field private static _egtsound:Lorg/egret/egretframeworknative/egretjni/EGTSound;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static end()V
    .locals 1

    .prologue
    .line 98
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtmusic:Lorg/egret/egretframeworknative/egretjni/EGTMusic;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->end()V

    .line 99
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtsound:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->end()V

    .line 100
    return-void
.end method

.method public static getBackgroundMusicVolume()F
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtmusic:Lorg/egret/egretframeworknative/egretjni/EGTMusic;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->getBackgroundVolume()F

    move-result v0

    return v0
.end method

.method public static getEffectsVolume()F
    .locals 1

    .prologue
    .line 74
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtsound:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->getEffectsVolume()F

    move-result v0

    return v0
.end method

.method public static initEGTAudioEngine(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 11
    sput-object p0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_cur_context:Landroid/content/Context;

    .line 12
    new-instance v0, Lorg/egret/egretframeworknative/egretjni/EGTMusic;

    invoke-direct {v0, p0}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;-><init>(Landroid/content/Context;)V

    sput-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtmusic:Lorg/egret/egretframeworknative/egretjni/EGTMusic;

    .line 13
    new-instance v0, Lorg/egret/egretframeworknative/egretjni/EGTSound;

    invoke-direct {v0, p0}, Lorg/egret/egretframeworknative/egretjni/EGTSound;-><init>(Landroid/content/Context;)V

    sput-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtsound:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    .line 15
    return-void
.end method

.method public static isBackgroundMusicPlaying()Z
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtmusic:Lorg/egret/egretframeworknative/egretjni/EGTMusic;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->isBackgroundMusicPlaying()Z

    move-result v0

    return v0
.end method

.method public static pauseAllEffects()V
    .locals 1

    .prologue
    .line 86
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtsound:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->pauseAllEffects()V

    .line 87
    return-void
.end method

.method public static pauseBackgroundMusic()V
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtmusic:Lorg/egret/egretframeworknative/egretjni/EGTMusic;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->pauseBackgroundMusic()V

    .line 31
    return-void
.end method

.method public static pauseEffect(I)V
    .locals 1
    .parameter "soundId"

    .prologue
    .line 66
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtsound:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    invoke-virtual {v0, p0}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->pauseEffect(I)V

    .line 67
    return-void
.end method

.method public static playBackgroundMusic(Ljava/lang/String;Z)V
    .locals 1
    .parameter "pPath"
    .parameter "isLoop"

    .prologue
    .line 22
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtmusic:Lorg/egret/egretframeworknative/egretjni/EGTMusic;

    invoke-virtual {v0, p0, p1}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->playBackgroundMusic(Ljava/lang/String;Z)V

    .line 23
    return-void
.end method

.method public static playEffect(Ljava/lang/String;ZFFF)I
    .locals 6
    .parameter "path"
    .parameter "isLoop"
    .parameter "pitch"
    .parameter "pan"
    .parameter "gain"

    .prologue
    .line 58
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtsound:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->playEffect(Ljava/lang/String;ZFFF)I

    move-result v0

    return v0
.end method

.method public static preloadBackgroundMusic(Ljava/lang/String;)V
    .locals 1
    .parameter "pPath"

    .prologue
    .line 18
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtmusic:Lorg/egret/egretframeworknative/egretjni/EGTMusic;

    invoke-virtual {v0, p0}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->preloadBackgroundMusic(Ljava/lang/String;)V

    .line 19
    return-void
.end method

.method public static preloadEffect(Ljava/lang/String;)V
    .locals 1
    .parameter "path"

    .prologue
    .line 54
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtsound:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    invoke-virtual {v0, p0}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->preloadEffect(Ljava/lang/String;)I

    .line 55
    return-void
.end method

.method public static resumeAllEffects()V
    .locals 1

    .prologue
    .line 90
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtsound:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->resumeAllEffects()V

    .line 91
    return-void
.end method

.method public static resumeBackgroundMusic()V
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtmusic:Lorg/egret/egretframeworknative/egretjni/EGTMusic;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->resumeBackgroundMusic()V

    .line 27
    return-void
.end method

.method public static resumeEffect(I)V
    .locals 1
    .parameter "soundId"

    .prologue
    .line 62
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtsound:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    invoke-virtual {v0, p0}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->resumeEffect(I)V

    .line 63
    return-void
.end method

.method public static rewindBackgroundMusic()V
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtmusic:Lorg/egret/egretframeworknative/egretjni/EGTMusic;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->rewindBackgroundMusic()V

    .line 39
    return-void
.end method

.method public static setBackgroundMusicVolume(F)V
    .locals 1
    .parameter "volume"

    .prologue
    .line 50
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtmusic:Lorg/egret/egretframeworknative/egretjni/EGTMusic;

    invoke-virtual {v0, p0}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->setBackgroundVolume(F)V

    .line 51
    return-void
.end method

.method public static setEffectsVolume(F)V
    .locals 1
    .parameter "volume"

    .prologue
    .line 78
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtsound:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    invoke-virtual {v0, p0}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->setEffectsVolume(F)V

    .line 79
    return-void
.end method

.method public static stopAllEffects()V
    .locals 1

    .prologue
    .line 94
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtsound:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->stopAllEffects()V

    .line 95
    return-void
.end method

.method public static stopBackgroundMusic()V
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtmusic:Lorg/egret/egretframeworknative/egretjni/EGTMusic;

    invoke-virtual {v0}, Lorg/egret/egretframeworknative/egretjni/EGTMusic;->stopBackgroundMusic()V

    .line 35
    return-void
.end method

.method public static stopEffect(I)V
    .locals 1
    .parameter "soundId"

    .prologue
    .line 70
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtsound:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    invoke-virtual {v0, p0}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->stopEffect(I)V

    .line 71
    return-void
.end method

.method public static unloadEffect(Ljava/lang/String;)V
    .locals 1
    .parameter "path"

    .prologue
    .line 82
    sget-object v0, Lorg/egret/egretframeworknative/egretjni/EGTAudioEngine;->_egtsound:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    invoke-virtual {v0, p0}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->unloadEffect(Ljava/lang/String;)V

    .line 83
    return-void
.end method
