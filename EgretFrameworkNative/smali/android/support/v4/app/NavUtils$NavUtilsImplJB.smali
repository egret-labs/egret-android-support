.class Landroid/support/v4/app/NavUtils$NavUtilsImplJB;
.super Landroid/support/v4/app/NavUtils$NavUtilsImplBase;
.source "NavUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/NavUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NavUtilsImplJB"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 95
    invoke-direct {p0}, Landroid/support/v4/app/NavUtils$NavUtilsImplBase;-><init>()V

    return-void
.end method


# virtual methods
.method public getParentActivityIntent(Landroid/app/Activity;)Landroid/content/Intent;
    .locals 1
    .parameter "activity"

    .prologue
    .line 101
    invoke-static {p1}, Landroid/support/v4/app/NavUtilsJB;->getParentActivityIntent(Landroid/app/Activity;)Landroid/content/Intent;

    move-result-object v0

    .line 102
    .local v0, result:Landroid/content/Intent;
    if-nez v0, :cond_0

    .line 103
    invoke-virtual {p0, p1}, Landroid/support/v4/app/NavUtils$NavUtilsImplJB;->superGetParentActivityIntent(Landroid/app/Activity;)Landroid/content/Intent;

    move-result-object v0

    .line 105
    :cond_0
    return-object v0
.end method

.method public getParentActivityName(Landroid/content/Context;Landroid/content/pm/ActivityInfo;)Ljava/lang/String;
    .locals 1
    .parameter "context"
    .parameter "info"

    .prologue
    .line 124
    invoke-static {p2}, Landroid/support/v4/app/NavUtilsJB;->getParentActivityName(Landroid/content/pm/ActivityInfo;)Ljava/lang/String;

    move-result-object v0

    .line 125
    .local v0, result:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 126
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/NavUtils$NavUtilsImplBase;->getParentActivityName(Landroid/content/Context;Landroid/content/pm/ActivityInfo;)Ljava/lang/String;

    move-result-object v0

    .line 128
    :cond_0
    return-object v0
.end method

.method public navigateUpTo(Landroid/app/Activity;Landroid/content/Intent;)V
    .locals 0
    .parameter "activity"
    .parameter "upIntent"

    .prologue
    .line 119
    invoke-static {p1, p2}, Landroid/support/v4/app/NavUtilsJB;->navigateUpTo(Landroid/app/Activity;Landroid/content/Intent;)V

    .line 120
    return-void
.end method

.method public shouldUpRecreateTask(Landroid/app/Activity;Landroid/content/Intent;)Z
    .locals 1
    .parameter "activity"
    .parameter "targetIntent"

    .prologue
    .line 114
    invoke-static {p1, p2}, Landroid/support/v4/app/NavUtilsJB;->shouldUpRecreateTask(Landroid/app/Activity;Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method superGetParentActivityIntent(Landroid/app/Activity;)Landroid/content/Intent;
    .locals 1
    .parameter "activity"

    .prologue
    .line 109
    invoke-super {p0, p1}, Landroid/support/v4/app/NavUtils$NavUtilsImplBase;->getParentActivityIntent(Landroid/app/Activity;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method
