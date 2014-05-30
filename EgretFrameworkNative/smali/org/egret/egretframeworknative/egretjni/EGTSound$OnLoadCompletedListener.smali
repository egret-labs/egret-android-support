.class public Lorg/egret/egretframeworknative/egretjni/EGTSound$OnLoadCompletedListener;
.super Ljava/lang/Object;
.source "EGTSound.java"

# interfaces
.implements Landroid/media/SoundPool$OnLoadCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/egret/egretframeworknative/egretjni/EGTSound;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "OnLoadCompletedListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/egret/egretframeworknative/egretjni/EGTSound;


# direct methods
.method public constructor <init>(Lorg/egret/egretframeworknative/egretjni/EGTSound;)V
    .locals 0
    .parameter

    .prologue
    .line 279
    iput-object p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound$OnLoadCompletedListener;->this$0:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadComplete(Landroid/media/SoundPool;II)V
    .locals 6
    .parameter "soundPool"
    .parameter "sampleId"
    .parameter "status"

    .prologue
    .line 283
    if-nez p3, :cond_2

    .line 286
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound$OnLoadCompletedListener;->this$0:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    #getter for: Lorg/egret/egretframeworknative/egretjni/EGTSound;->mEffecToPlayWhenLoadedArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->access$0(Lorg/egret/egretframeworknative/egretjni/EGTSound;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 302
    :goto_0
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound$OnLoadCompletedListener;->this$0:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    #getter for: Lorg/egret/egretframeworknative/egretjni/EGTSound;->mSemaphore:Ljava/util/concurrent/Semaphore;
    invoke-static {v1}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->access$3(Lorg/egret/egretframeworknative/egretjni/EGTSound;)Ljava/util/concurrent/Semaphore;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 303
    return-void

    .line 286
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;

    .line 287
    .local v0, info:Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;
    iget v2, v0, Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;->soundID:I

    if-ne p2, v2, :cond_0

    .line 289
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound$OnLoadCompletedListener;->this$0:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    iget-object v2, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound$OnLoadCompletedListener;->this$0:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    iget-object v3, v0, Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;->path:Ljava/lang/String;

    iget v4, v0, Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;->soundID:I

    iget-boolean v5, v0, Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;->isLoop:Z

    #calls: Lorg/egret/egretframeworknative/egretjni/EGTSound;->doPlayEffect(Ljava/lang/String;IZ)I
    invoke-static {v2, v3, v4, v5}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->access$1(Lorg/egret/egretframeworknative/egretjni/EGTSound;Ljava/lang/String;IZ)I

    move-result v2

    #setter for: Lorg/egret/egretframeworknative/egretjni/EGTSound;->mStreamIdSyn:I
    invoke-static {v1, v2}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->access$2(Lorg/egret/egretframeworknative/egretjni/EGTSound;I)V

    .line 293
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound$OnLoadCompletedListener;->this$0:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    #getter for: Lorg/egret/egretframeworknative/egretjni/EGTSound;->mEffecToPlayWhenLoadedArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->access$0(Lorg/egret/egretframeworknative/egretjni/EGTSound;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 299
    .end local v0           #info:Lorg/egret/egretframeworknative/egretjni/EGTSound$SoundInfoForLoadedCompleted;
    :cond_2
    iget-object v1, p0, Lorg/egret/egretframeworknative/egretjni/EGTSound$OnLoadCompletedListener;->this$0:Lorg/egret/egretframeworknative/egretjni/EGTSound;

    const/4 v2, -0x1

    #setter for: Lorg/egret/egretframeworknative/egretjni/EGTSound;->mStreamIdSyn:I
    invoke-static {v1, v2}, Lorg/egret/egretframeworknative/egretjni/EGTSound;->access$2(Lorg/egret/egretframeworknative/egretjni/EGTSound;I)V

    goto :goto_0
.end method
