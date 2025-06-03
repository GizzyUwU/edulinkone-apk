.class public final Landroidx/core/splashscreen/ThemeUtils$Api31;
.super Ljava/lang/Object;
.source "ThemeUtils.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/splashscreen/ThemeUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Api31"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J&\u0010\u0003\u001a\u00020\u00042\n\u0010\u0005\u001a\u00060\u0006R\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0008\u0008\u0002\u0010\n\u001a\u00020\u000bH\u0007\u00a8\u0006\u000c"
    }
    d2 = {
        "Landroidx/core/splashscreen/ThemeUtils$Api31;",
        "",
        "()V",
        "applyThemesSystemBarAppearance",
        "",
        "theme",
        "Landroid/content/res/Resources$Theme;",
        "Landroid/content/res/Resources;",
        "decor",
        "Landroid/view/View;",
        "tv",
        "Landroid/util/TypedValue;",
        "core-splashscreen_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x6,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Landroidx/core/splashscreen/ThemeUtils$Api31;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroidx/core/splashscreen/ThemeUtils$Api31;

    invoke-direct {v0}, Landroidx/core/splashscreen/ThemeUtils$Api31;-><init>()V

    sput-object v0, Landroidx/core/splashscreen/ThemeUtils$Api31;->INSTANCE:Landroidx/core/splashscreen/ThemeUtils$Api31;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final applyThemesSystemBarAppearance(Landroid/content/res/Resources$Theme;Landroid/view/View;)V
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "theme"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "decor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x4

    invoke-static {p0, p1, v0, v1, v0}, Landroidx/core/splashscreen/ThemeUtils$Api31;->applyThemesSystemBarAppearance$default(Landroid/content/res/Resources$Theme;Landroid/view/View;Landroid/util/TypedValue;ILjava/lang/Object;)V

    return-void
.end method

.method public static final applyThemesSystemBarAppearance(Landroid/content/res/Resources$Theme;Landroid/view/View;Landroid/util/TypedValue;)V
    .locals 3
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "theme"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "decor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tv"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const v0, 0x10104e0

    const/4 v1, 0x1

    .line 52
    invoke-virtual {p0, v0, p2, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    iget v0, p2, Landroid/util/TypedValue;->data:I

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const v2, 0x101056c

    .line 57
    invoke-virtual {p0, v2, p2, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 58
    iget p0, p2, Landroid/util/TypedValue;->data:I

    if-eqz p0, :cond_1

    or-int/lit8 v0, v0, 0x10

    .line 63
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getWindowInsetsController()Landroid/view/WindowInsetsController;

    move-result-object p0

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/16 p1, 0x18

    invoke-interface {p0, v0, p1}, Landroid/view/WindowInsetsController;->setSystemBarsAppearance(II)V

    return-void
.end method

.method public static synthetic applyThemesSystemBarAppearance$default(Landroid/content/res/Resources$Theme;Landroid/view/View;Landroid/util/TypedValue;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p3, p3, 0x4

    if-eqz p3, :cond_0

    .line 46
    new-instance p2, Landroid/util/TypedValue;

    invoke-direct {p2}, Landroid/util/TypedValue;-><init>()V

    .line 43
    :cond_0
    invoke-static {p0, p1, p2}, Landroidx/core/splashscreen/ThemeUtils$Api31;->applyThemesSystemBarAppearance(Landroid/content/res/Resources$Theme;Landroid/view/View;Landroid/util/TypedValue;)V

    return-void
.end method
