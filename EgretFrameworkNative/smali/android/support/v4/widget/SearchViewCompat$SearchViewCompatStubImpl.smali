.class Landroid/support/v4/widget/SearchViewCompat$SearchViewCompatStubImpl;
.super Ljava/lang/Object;
.source "SearchViewCompat.java"

# interfaces
.implements Landroid/support/v4/widget/SearchViewCompat$SearchViewCompatImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/widget/SearchViewCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SearchViewCompatStubImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getQuery(Landroid/view/View;)Ljava/lang/CharSequence;
    .locals 1
    .parameter "searchView"

    .prologue
    .line 92
    const/4 v0, 0x0

    return-object v0
.end method

.method public isIconified(Landroid/view/View;)Z
    .locals 1
    .parameter "searchView"

    .prologue
    .line 109
    const/4 v0, 0x1

    return v0
.end method

.method public isQueryRefinementEnabled(Landroid/view/View;)Z
    .locals 1
    .parameter "searchView"

    .prologue
    .line 127
    const/4 v0, 0x0

    return v0
.end method

.method public isSubmitButtonEnabled(Landroid/view/View;)Z
    .locals 1
    .parameter "searchView"

    .prologue
    .line 118
    const/4 v0, 0x0

    return v0
.end method

.method public newOnCloseListener(Landroid/support/v4/widget/SearchViewCompat$OnCloseListenerCompat;)Ljava/lang/Object;
    .locals 1
    .parameter "listener"

    .prologue
    .line 83
    const/4 v0, 0x0

    return-object v0
.end method

.method public newOnQueryTextListener(Landroid/support/v4/widget/SearchViewCompat$OnQueryTextListenerCompat;)Ljava/lang/Object;
    .locals 1
    .parameter "listener"

    .prologue
    .line 74
    const/4 v0, 0x0

    return-object v0
.end method

.method public newSearchView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .parameter "context"

    .prologue
    .line 57
    const/4 v0, 0x0

    return-object v0
.end method

.method public setIconified(Landroid/view/View;Z)V
    .locals 0
    .parameter "searchView"
    .parameter "iconify"

    .prologue
    .line 105
    return-void
.end method

.method public setImeOptions(Landroid/view/View;I)V
    .locals 0
    .parameter "searchView"
    .parameter "imeOptions"

    .prologue
    .line 66
    return-void
.end method

.method public setInputType(Landroid/view/View;I)V
    .locals 0
    .parameter "searchView"
    .parameter "inputType"

    .prologue
    .line 70
    return-void
.end method

.method public setMaxWidth(Landroid/view/View;I)V
    .locals 0
    .parameter "searchView"
    .parameter "maxpixels"

    .prologue
    .line 132
    return-void
.end method

.method public setOnCloseListener(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .parameter "searchView"
    .parameter "listener"

    .prologue
    .line 88
    return-void
.end method

.method public setOnQueryTextListener(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .parameter "searchView"
    .parameter "listener"

    .prologue
    .line 79
    return-void
.end method

.method public setQuery(Landroid/view/View;Ljava/lang/CharSequence;Z)V
    .locals 0
    .parameter "searchView"
    .parameter "query"
    .parameter "submit"

    .prologue
    .line 97
    return-void
.end method

.method public setQueryHint(Landroid/view/View;Ljava/lang/CharSequence;)V
    .locals 0
    .parameter "searchView"
    .parameter "hint"

    .prologue
    .line 101
    return-void
.end method

.method public setQueryRefinementEnabled(Landroid/view/View;Z)V
    .locals 0
    .parameter "searchView"
    .parameter "enable"

    .prologue
    .line 123
    return-void
.end method

.method public setSearchableInfo(Landroid/view/View;Landroid/content/ComponentName;)V
    .locals 0
    .parameter "searchView"
    .parameter "searchableComponent"

    .prologue
    .line 62
    return-void
.end method

.method public setSubmitButtonEnabled(Landroid/view/View;Z)V
    .locals 0
    .parameter "searchView"
    .parameter "enabled"

    .prologue
    .line 114
    return-void
.end method
