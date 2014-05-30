.class Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;
.super Ljava/lang/Object;
.source "EGTBitmap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/egret/egretframeworknative/egretjni/EGTBitmap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TextProperty"
.end annotation


# instance fields
.field private final mHeightPerLine:I

.field private final mLines:[Ljava/lang/String;

.field private final mMaxWidth:I

.field private final mTotalHeight:I


# direct methods
.method constructor <init>(II[Ljava/lang/String;)V
    .locals 1
    .parameter "pMaxWidth"
    .parameter "pHeightPerLine"
    .parameter "pLines"

    .prologue
    .line 451
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 453
    iput p1, p0, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mMaxWidth:I

    .line 454
    iput p2, p0, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mHeightPerLine:I

    .line 455
    array-length v0, p3

    mul-int/2addr v0, p2

    iput v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mTotalHeight:I

    .line 456
    iput-object p3, p0, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mLines:[Ljava/lang/String;

    .line 457
    return-void
.end method

.method static synthetic access$0(Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;)I
    .locals 1
    .parameter

    .prologue
    .line 447
    iget v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mTotalHeight:I

    return v0
.end method

.method static synthetic access$1(Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;)I
    .locals 1
    .parameter

    .prologue
    .line 445
    iget v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mMaxWidth:I

    return v0
.end method

.method static synthetic access$2(Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;)[Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 449
    iget-object v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mLines:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3(Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;)I
    .locals 1
    .parameter

    .prologue
    .line 448
    iget v0, p0, Lorg/egret/egretframeworknative/egretjni/EGTBitmap$TextProperty;->mHeightPerLine:I

    return v0
.end method
