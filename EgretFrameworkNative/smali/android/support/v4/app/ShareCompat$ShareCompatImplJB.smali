.class Landroid/support/v4/app/ShareCompat$ShareCompatImplJB;
.super Landroid/support/v4/app/ShareCompat$ShareCompatImplICS;
.source "ShareCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/ShareCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ShareCompatImplJB"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 137
    invoke-direct {p0}, Landroid/support/v4/app/ShareCompat$ShareCompatImplICS;-><init>()V

    return-void
.end method


# virtual methods
.method public escapeHtml(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 1
    .parameter "html"

    .prologue
    .line 139
    invoke-static {p1}, Landroid/support/v4/app/ShareCompatJB;->escapeHtml(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method shouldAddChooserIntent(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 144
    const/4 v0, 0x0

    return v0
.end method
