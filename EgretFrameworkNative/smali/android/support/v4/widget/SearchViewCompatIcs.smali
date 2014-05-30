.class Landroid/support/v4/widget/SearchViewCompatIcs;
.super Ljava/lang/Object;
.source "SearchViewCompatIcs.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/SearchViewCompatIcs$MySearchView;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public static newSearchView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .parameter "context"

    .prologue
    .line 43
    new-instance v0, Landroid/support/v4/widget/SearchViewCompatIcs$MySearchView;

    invoke-direct {v0, p0}, Landroid/support/v4/widget/SearchViewCompatIcs$MySearchView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public static setImeOptions(Landroid/view/View;I)V
    .locals 0
    .parameter "searchView"
    .parameter "imeOptions"

    .prologue
    .line 47
    check-cast p0, Landroid/widget/SearchView;

    .end local p0
    invoke-virtual {p0, p1}, Landroid/widget/SearchView;->setImeOptions(I)V

    .line 48
    return-void
.end method

.method public static setInputType(Landroid/view/View;I)V
    .locals 0
    .parameter "searchView"
    .parameter "inputType"

    .prologue
    .line 51
    check-cast p0, Landroid/widget/SearchView;

    .end local p0
    invoke-virtual {p0, p1}, Landroid/widget/SearchView;->setInputType(I)V

    .line 52
    return-void
.end method
