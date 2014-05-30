.class public Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;
.super Ljava/lang/Object;
.source "EGTSound.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/egret/egretframeworknative/egretjni/EGTSound;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SoundInfoForLoadedCompleted"
.end annotation


# instance fields
.field public gain:F

.field public isLoop:Z

.field public pan:F

.field public path:Ljava/lang/String;

.field public pitch:F

.field public soundID:I

.field final synthetic this$0:Lorg/egret/egretframeworknative/egretjni/EGTSound;


# direct methods
.method public constructor <init>(Lorg/egret/egretframeworknative/egretjni/EGTSound;Ljava/lang/String;IZFFF)V
    .locals 0
    .parameter
    .parameter "path"
    .parameter "soundId"
    .parameter "isLoop"
    .parameter "pitch"
    .parameter "pan"
    .parameter "gain"

    .prologue
    .line 269
    iput-object p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;->this$0:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    .line 268
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 270
    iput-object p2, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;->path:Ljava/lang/String;

    .line 271
    iput p3, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;->soundID:I

    .line 272
    iput-boolean p4, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;->isLoop:Z

    .line 273
    iput p5, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;->pitch:F

    .line 274
    iput p6, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;->pan:F

    .line 275
    iput p7, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;->gain:F

    .line 276
    return-void
.end method
