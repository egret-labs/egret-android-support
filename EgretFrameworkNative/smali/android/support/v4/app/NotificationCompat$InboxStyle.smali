.class public Landroid/support/v4/app/NotificationCompat$InboxStyle;
.super Landroid/support/v4/app/NotificationCompat$Style;
.source "NotificationCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/NotificationCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InboxStyle"
.end annotation


# instance fields
.field mTexts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 785
    invoke-direct {p0}, Landroid/support/v4/app/NotificationCompat$Style;-><init>()V

    .line 783
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/NotificationCompat$InboxStyle;->mTexts:Ljava/util/ArrayList;

    .line 786
    return-void
.end method

.method public constructor <init>(Landroid/support/v4/app/NotificationCompat$Builder;)V
    .locals 1
    .parameter "builder"

    .prologue
    .line 788
    invoke-direct {p0}, Landroid/support/v4/app/NotificationCompat$Style;-><init>()V

    .line 783
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/NotificationCompat$InboxStyle;->mTexts:Ljava/util/ArrayList;

    .line 789
    invoke-virtual {p0, p1}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->setBuilder(Landroid/support/v4/app/NotificationCompat$Builder;)V

    .line 790
    return-void
.end method


# virtual methods
.method public addLine(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;
    .locals 1
    .parameter "cs"

    .prologue
    .line 814
    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$InboxStyle;->mTexts:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 815
    return-object p0
.end method

.method public setBigContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;
    .locals 0
    .parameter "title"

    .prologue
    .line 797
    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$InboxStyle;->mBigContentTitle:Ljava/lang/CharSequence;

    .line 798
    return-object p0
.end method

.method public setSummaryText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;
    .locals 1
    .parameter "cs"

    .prologue
    .line 805
    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$InboxStyle;->mSummaryText:Ljava/lang/CharSequence;

    .line 806
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/NotificationCompat$InboxStyle;->mSummaryTextSet:Z

    .line 807
    return-object p0
.end method
