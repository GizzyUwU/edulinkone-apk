.class public Lcom/google/firebase/concurrent/ExecutorsRegistrar;
.super Ljava/lang/Object;
.source "ExecutorsRegistrar.java"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# static fields
.field static final BG_EXECUTOR:Lcom/google/firebase/components/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/components/Lazy<",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ">;"
        }
    .end annotation
.end field

.field static final BLOCKING_EXECUTOR:Lcom/google/firebase/components/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/components/Lazy<",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ">;"
        }
    .end annotation
.end field

.field static final LITE_EXECUTOR:Lcom/google/firebase/components/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/components/Lazy<",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ">;"
        }
    .end annotation
.end field

.field static final SCHEDULER:Lcom/google/firebase/components/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/components/Lazy<",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 40
    new-instance v0, Lcom/google/firebase/components/Lazy;

    new-instance v1, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda0;-><init>()V

    invoke-direct {v0, v1}, Lcom/google/firebase/components/Lazy;-><init>(Lcom/google/firebase/inject/Provider;)V

    sput-object v0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->BG_EXECUTOR:Lcom/google/firebase/components/Lazy;

    .line 49
    new-instance v0, Lcom/google/firebase/components/Lazy;

    new-instance v1, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda1;-><init>()V

    invoke-direct {v0, v1}, Lcom/google/firebase/components/Lazy;-><init>(Lcom/google/firebase/inject/Provider;)V

    sput-object v0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->LITE_EXECUTOR:Lcom/google/firebase/components/Lazy;

    .line 57
    new-instance v0, Lcom/google/firebase/components/Lazy;

    new-instance v1, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda2;

    invoke-direct {v1}, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda2;-><init>()V

    invoke-direct {v0, v1}, Lcom/google/firebase/components/Lazy;-><init>(Lcom/google/firebase/inject/Provider;)V

    sput-object v0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->BLOCKING_EXECUTOR:Lcom/google/firebase/components/Lazy;

    .line 67
    new-instance v0, Lcom/google/firebase/components/Lazy;

    new-instance v1, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda3;

    invoke-direct {v1}, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda3;-><init>()V

    invoke-direct {v0, v1}, Lcom/google/firebase/components/Lazy;-><init>(Lcom/google/firebase/inject/Provider;)V

    sput-object v0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->SCHEDULER:Lcom/google/firebase/components/Lazy;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static bgPolicy()Landroid/os/StrictMode$ThreadPolicy;
    .locals 3

    .line 113
    new-instance v0, Landroid/os/StrictMode$ThreadPolicy$Builder;

    invoke-direct {v0}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>()V

    invoke-virtual {v0}, Landroid/os/StrictMode$ThreadPolicy$Builder;->detectNetwork()Landroid/os/StrictMode$ThreadPolicy$Builder;

    move-result-object v0

    .line 115
    invoke-virtual {v0}, Landroid/os/StrictMode$ThreadPolicy$Builder;->detectResourceMismatches()Landroid/os/StrictMode$ThreadPolicy$Builder;

    .line 116
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_0

    .line 117
    invoke-virtual {v0}, Landroid/os/StrictMode$ThreadPolicy$Builder;->detectUnbufferedIo()Landroid/os/StrictMode$ThreadPolicy$Builder;

    .line 123
    :cond_0
    invoke-virtual {v0}, Landroid/os/StrictMode$ThreadPolicy$Builder;->penaltyLog()Landroid/os/StrictMode$ThreadPolicy$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v0

    return-object v0
.end method

.method private static factory(Ljava/lang/String;I)Ljava/util/concurrent/ThreadFactory;
    .locals 2

    .line 104
    new-instance v0, Lcom/google/firebase/concurrent/CustomThreadFactory;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/google/firebase/concurrent/CustomThreadFactory;-><init>(Ljava/lang/String;ILandroid/os/StrictMode$ThreadPolicy;)V

    return-object v0
.end method

.method private static factory(Ljava/lang/String;ILandroid/os/StrictMode$ThreadPolicy;)Ljava/util/concurrent/ThreadFactory;
    .locals 1

    .line 109
    new-instance v0, Lcom/google/firebase/concurrent/CustomThreadFactory;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/firebase/concurrent/CustomThreadFactory;-><init>(Ljava/lang/String;ILandroid/os/StrictMode$ThreadPolicy;)V

    return-object v0
.end method

.method static synthetic lambda$getComponents$4(Lcom/google/firebase/components/ComponentContainer;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 0

    .line 80
    sget-object p0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->BG_EXECUTOR:Lcom/google/firebase/components/Lazy;

    invoke-virtual {p0}, Lcom/google/firebase/components/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/ScheduledExecutorService;

    return-object p0
.end method

.method static synthetic lambda$getComponents$5(Lcom/google/firebase/components/ComponentContainer;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 0

    .line 86
    sget-object p0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->BLOCKING_EXECUTOR:Lcom/google/firebase/components/Lazy;

    invoke-virtual {p0}, Lcom/google/firebase/components/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/ScheduledExecutorService;

    return-object p0
.end method

.method static synthetic lambda$getComponents$6(Lcom/google/firebase/components/ComponentContainer;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 0

    .line 92
    sget-object p0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->LITE_EXECUTOR:Lcom/google/firebase/components/Lazy;

    invoke-virtual {p0}, Lcom/google/firebase/components/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/ScheduledExecutorService;

    return-object p0
.end method

.method static synthetic lambda$getComponents$7(Lcom/google/firebase/components/ComponentContainer;)Ljava/util/concurrent/Executor;
    .locals 0

    .line 95
    sget-object p0, Lcom/google/firebase/concurrent/UiExecutor;->INSTANCE:Lcom/google/firebase/concurrent/UiExecutor;

    return-object p0
.end method

.method static synthetic lambda$static$0()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 3

    const/16 v0, 0xa

    .line 47
    invoke-static {}, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->bgPolicy()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v1

    .line 46
    const-string v2, "Firebase Background"

    invoke-static {v2, v0, v1}, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->factory(Ljava/lang/String;ILandroid/os/StrictMode$ThreadPolicy;)Ljava/util/concurrent/ThreadFactory;

    move-result-object v0

    const/4 v1, 0x4

    .line 44
    invoke-static {v1, v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 43
    invoke-static {v0}, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->scheduled(Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$static$1()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 4

    .line 54
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    const/4 v1, 0x2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/4 v1, 0x0

    .line 55
    invoke-static {}, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->litePolicy()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v2

    const-string v3, "Firebase Lite"

    invoke-static {v3, v1, v2}, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->factory(Ljava/lang/String;ILandroid/os/StrictMode$ThreadPolicy;)Ljava/util/concurrent/ThreadFactory;

    move-result-object v1

    .line 53
    invoke-static {v0, v1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 52
    invoke-static {v0}, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->scheduled(Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$static$2()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 2

    .line 60
    const-string v0, "Firebase Blocking"

    const/16 v1, 0xb

    .line 62
    invoke-static {v0, v1}, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->factory(Ljava/lang/String;I)Ljava/util/concurrent/ThreadFactory;

    move-result-object v0

    .line 61
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 60
    invoke-static {v0}, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->scheduled(Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$static$3()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 2

    .line 70
    const-string v0, "Firebase Scheduler"

    const/4 v1, 0x0

    .line 71
    invoke-static {v0, v1}, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->factory(Ljava/lang/String;I)Ljava/util/concurrent/ThreadFactory;

    move-result-object v0

    .line 70
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    return-object v0
.end method

.method private static litePolicy()Landroid/os/StrictMode$ThreadPolicy;
    .locals 1

    .line 127
    new-instance v0, Landroid/os/StrictMode$ThreadPolicy$Builder;

    invoke-direct {v0}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>()V

    invoke-virtual {v0}, Landroid/os/StrictMode$ThreadPolicy$Builder;->detectAll()Landroid/os/StrictMode$ThreadPolicy$Builder;

    move-result-object v0

    .line 131
    invoke-virtual {v0}, Landroid/os/StrictMode$ThreadPolicy$Builder;->penaltyLog()Landroid/os/StrictMode$ThreadPolicy$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v0

    return-object v0
.end method

.method private static scheduled(Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 2

    .line 100
    new-instance v0, Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;

    sget-object v1, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->SCHEDULER:Lcom/google/firebase/components/Lazy;

    invoke-virtual {v1}, Lcom/google/firebase/components/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/ScheduledExecutorService;

    invoke-direct {v0, p0, v1}, Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;-><init>(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ScheduledExecutorService;)V

    return-object v0
.end method


# virtual methods
.method public getComponents()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firebase/components/Component<",
            "*>;>;"
        }
    .end annotation

    .line 75
    const-class v0, Lcom/google/firebase/annotations/concurrent/Background;

    const-class v1, Ljava/util/concurrent/ScheduledExecutorService;

    .line 77
    invoke-static {v0, v1}, Lcom/google/firebase/components/Qualified;->qualified(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/firebase/components/Qualified;

    move-result-object v0

    const-class v1, Lcom/google/firebase/annotations/concurrent/Background;

    const-class v2, Ljava/util/concurrent/ExecutorService;

    .line 78
    invoke-static {v1, v2}, Lcom/google/firebase/components/Qualified;->qualified(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/firebase/components/Qualified;

    move-result-object v1

    const-class v2, Lcom/google/firebase/annotations/concurrent/Background;

    const-class v3, Ljava/util/concurrent/Executor;

    .line 79
    invoke-static {v2, v3}, Lcom/google/firebase/components/Qualified;->qualified(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/firebase/components/Qualified;

    move-result-object v2

    const/4 v3, 0x2

    new-array v4, v3, [Lcom/google/firebase/components/Qualified;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    const/4 v1, 0x1

    aput-object v2, v4, v1

    .line 76
    invoke-static {v0, v4}, Lcom/google/firebase/components/Component;->builder(Lcom/google/firebase/components/Qualified;[Lcom/google/firebase/components/Qualified;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v0

    new-instance v2, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda4;

    invoke-direct {v2}, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda4;-><init>()V

    .line 80
    invoke-virtual {v0, v2}, Lcom/google/firebase/components/Component$Builder;->factory(Lcom/google/firebase/components/ComponentFactory;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v0

    .line 81
    invoke-virtual {v0}, Lcom/google/firebase/components/Component$Builder;->build()Lcom/google/firebase/components/Component;

    move-result-object v0

    const-class v2, Lcom/google/firebase/annotations/concurrent/Blocking;

    const-class v4, Ljava/util/concurrent/ScheduledExecutorService;

    .line 83
    invoke-static {v2, v4}, Lcom/google/firebase/components/Qualified;->qualified(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/firebase/components/Qualified;

    move-result-object v2

    const-class v4, Lcom/google/firebase/annotations/concurrent/Blocking;

    const-class v6, Ljava/util/concurrent/ExecutorService;

    .line 84
    invoke-static {v4, v6}, Lcom/google/firebase/components/Qualified;->qualified(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/firebase/components/Qualified;

    move-result-object v4

    const-class v6, Lcom/google/firebase/annotations/concurrent/Blocking;

    const-class v7, Ljava/util/concurrent/Executor;

    .line 85
    invoke-static {v6, v7}, Lcom/google/firebase/components/Qualified;->qualified(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/firebase/components/Qualified;

    move-result-object v6

    new-array v7, v3, [Lcom/google/firebase/components/Qualified;

    aput-object v4, v7, v5

    aput-object v6, v7, v1

    .line 82
    invoke-static {v2, v7}, Lcom/google/firebase/components/Component;->builder(Lcom/google/firebase/components/Qualified;[Lcom/google/firebase/components/Qualified;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v2

    new-instance v4, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda5;

    invoke-direct {v4}, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda5;-><init>()V

    .line 86
    invoke-virtual {v2, v4}, Lcom/google/firebase/components/Component$Builder;->factory(Lcom/google/firebase/components/ComponentFactory;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v2

    .line 87
    invoke-virtual {v2}, Lcom/google/firebase/components/Component$Builder;->build()Lcom/google/firebase/components/Component;

    move-result-object v2

    const-class v4, Lcom/google/firebase/annotations/concurrent/Lightweight;

    const-class v6, Ljava/util/concurrent/ScheduledExecutorService;

    .line 89
    invoke-static {v4, v6}, Lcom/google/firebase/components/Qualified;->qualified(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/firebase/components/Qualified;

    move-result-object v4

    const-class v6, Lcom/google/firebase/annotations/concurrent/Lightweight;

    const-class v7, Ljava/util/concurrent/ExecutorService;

    .line 90
    invoke-static {v6, v7}, Lcom/google/firebase/components/Qualified;->qualified(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/firebase/components/Qualified;

    move-result-object v6

    const-class v7, Lcom/google/firebase/annotations/concurrent/Lightweight;

    const-class v8, Ljava/util/concurrent/Executor;

    .line 91
    invoke-static {v7, v8}, Lcom/google/firebase/components/Qualified;->qualified(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/firebase/components/Qualified;

    move-result-object v7

    new-array v8, v3, [Lcom/google/firebase/components/Qualified;

    aput-object v6, v8, v5

    aput-object v7, v8, v1

    .line 88
    invoke-static {v4, v8}, Lcom/google/firebase/components/Component;->builder(Lcom/google/firebase/components/Qualified;[Lcom/google/firebase/components/Qualified;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v4

    new-instance v6, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda6;

    invoke-direct {v6}, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda6;-><init>()V

    .line 92
    invoke-virtual {v4, v6}, Lcom/google/firebase/components/Component$Builder;->factory(Lcom/google/firebase/components/ComponentFactory;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v4

    .line 93
    invoke-virtual {v4}, Lcom/google/firebase/components/Component$Builder;->build()Lcom/google/firebase/components/Component;

    move-result-object v4

    const-class v6, Lcom/google/firebase/annotations/concurrent/UiThread;

    const-class v7, Ljava/util/concurrent/Executor;

    .line 94
    invoke-static {v6, v7}, Lcom/google/firebase/components/Qualified;->qualified(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/firebase/components/Qualified;

    move-result-object v6

    invoke-static {v6}, Lcom/google/firebase/components/Component;->builder(Lcom/google/firebase/components/Qualified;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v6

    new-instance v7, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda7;

    invoke-direct {v7}, Lcom/google/firebase/concurrent/ExecutorsRegistrar$$ExternalSyntheticLambda7;-><init>()V

    .line 95
    invoke-virtual {v6, v7}, Lcom/google/firebase/components/Component$Builder;->factory(Lcom/google/firebase/components/ComponentFactory;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v6

    .line 96
    invoke-virtual {v6}, Lcom/google/firebase/components/Component$Builder;->build()Lcom/google/firebase/components/Component;

    move-result-object v6

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/google/firebase/components/Component;

    aput-object v0, v7, v5

    aput-object v2, v7, v1

    aput-object v4, v7, v3

    const/4 v0, 0x3

    aput-object v6, v7, v0

    .line 75
    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
