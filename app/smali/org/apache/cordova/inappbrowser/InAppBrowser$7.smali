.class Lorg/apache/cordova/inappbrowser/InAppBrowser$7;
.super Ljava/lang/Object;
.source "InAppBrowser.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/inappbrowser/InAppBrowser;->showWebPage(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

.field final synthetic val$thatWebView:Lorg/apache/cordova/CordovaWebView;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/inappbrowser/InAppBrowser;Ljava/lang/String;Lorg/apache/cordova/CordovaWebView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 723
    iput-object p1, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iput-object p2, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->val$url:Ljava/lang/String;

    iput-object p3, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->val$thatWebView:Lorg/apache/cordova/CordovaWebView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private createCloseButton(I)Landroid/view/View;
    .locals 6

    .line 740
    iget-object v0, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v0, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 742
    iget-object v1, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$400(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    if-eq v1, v2, :cond_1

    .line 744
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v1, v1, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 745
    iget-object v1, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$400(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v1, 0x41a00000    # 20.0f

    .line 746
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 747
    iget-object v1, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$500(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Ljava/lang/String;

    move-result-object v1

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$500(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_0
    const/16 v1, 0x10

    .line 748
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    const/16 v1, 0xa

    .line 749
    invoke-direct {p0, v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v2

    invoke-direct {p0, v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v1

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    goto :goto_0

    .line 753
    :cond_1
    new-instance v1, Landroid/widget/ImageButton;

    iget-object v3, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v3, v3, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 754
    iget-object v3, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v3, v3, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "ic_action_remove"

    const-string v5, "drawable"

    invoke-virtual {v0, v4, v5, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 755
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 756
    iget-object v3, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v3}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$500(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Ljava/lang/String;

    move-result-object v3

    if-eq v3, v2, :cond_2

    iget-object v2, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v2}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$500(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setColorFilter(I)V

    .line 757
    :cond_2
    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 758
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 759
    invoke-virtual {v1}, Landroid/widget/ImageButton;->getAdjustViewBounds()Z

    move-object v0, v1

    .line 764
    :goto_0
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x2

    const/4 v3, -0x1

    invoke-direct {v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 765
    iget-object v2, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v2}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$600(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto :goto_1

    :cond_3
    const/16 v2, 0xb

    .line 766
    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 767
    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v1, 0x0

    .line 768
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 770
    const-string v1, "Close Button"

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 771
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/view/View;->setId(I)V

    .line 772
    new-instance p1, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$1;

    invoke-direct {p1, p0}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$1;-><init>(Lorg/apache/cordova/inappbrowser/InAppBrowser$7;)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method private dpToPixels(I)I
    .locals 2

    int-to-float p1, p1

    .line 730
    iget-object v0, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v0, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    .line 732
    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    const/4 v1, 0x1

    .line 730
    invoke-static {v1, p1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method


# virtual methods
.method public run()V
    .locals 16

    move-object/from16 v0, p0

    .line 785
    iget-object v1, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 786
    iget-object v1, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;->dismiss()V

    .line 790
    :cond_0
    iget-object v1, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    new-instance v2, Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    iget-object v3, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v3, v3, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v3

    const v4, 0x1030006

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;-><init>(Landroid/content/Context;I)V

    invoke-static {v1, v2}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$202(Lorg/apache/cordova/inappbrowser/InAppBrowser;Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    .line 791
    iget-object v1, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    const v2, 0x1030002

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    .line 792
    iget-object v1, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;->requestWindowFeature(I)Z

    .line 793
    iget-object v1, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$700(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 794
    iget-object v1, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v3, 0x400

    invoke-virtual {v1, v3, v3}, Landroid/view/Window;->setFlags(II)V

    .line 796
    :cond_1
    iget-object v1, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v1

    invoke-virtual {v1, v2}, Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;->setCancelable(Z)V

    .line 797
    iget-object v1, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v1

    iget-object v3, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v3}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$800(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowser;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;->setInAppBroswer(Lorg/apache/cordova/inappbrowser/InAppBrowser;)V

    .line 800
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v3, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v3, v3, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 801
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 804
    new-instance v3, Landroid/widget/RelativeLayout;

    iget-object v4, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v4, v4, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 806
    iget-object v4, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v4}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$900(Lorg/apache/cordova/inappbrowser/InAppBrowser;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 807
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v5, 0x30

    invoke-direct {v0, v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v6

    const/4 v7, -0x1

    invoke-direct {v4, v7, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v4, 0x2

    .line 808
    invoke-direct {v0, v4}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v6

    invoke-direct {v0, v4}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v8

    invoke-direct {v0, v4}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v9

    invoke-direct {v0, v4}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v10

    invoke-virtual {v3, v6, v8, v9, v10}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 809
    iget-object v6, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v6}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$600(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v6

    const/4 v8, 0x3

    const/4 v9, 0x5

    if-eqz v6, :cond_2

    .line 810
    invoke-virtual {v3, v8}, Landroid/widget/RelativeLayout;->setHorizontalGravity(I)V

    goto :goto_0

    .line 812
    :cond_2
    invoke-virtual {v3, v9}, Landroid/widget/RelativeLayout;->setHorizontalGravity(I)V

    .line 814
    :goto_0
    invoke-virtual {v3, v5}, Landroid/widget/RelativeLayout;->setVerticalGravity(I)V

    .line 817
    new-instance v6, Landroid/widget/RelativeLayout;

    iget-object v10, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v10, v10, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v10}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v10

    invoke-direct {v6, v10}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 818
    new-instance v10, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v11, -0x2

    invoke-direct {v10, v11, v11}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 819
    iget-object v12, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v12}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$600(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v12

    if-eqz v12, :cond_3

    const/16 v12, 0xb

    invoke-virtual {v10, v12}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto :goto_1

    :cond_3
    const/16 v12, 0x9

    .line 820
    invoke-virtual {v10, v12}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 821
    :goto_1
    invoke-virtual {v6, v10}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 822
    invoke-virtual {v6, v8}, Landroid/widget/RelativeLayout;->setHorizontalGravity(I)V

    const/16 v10, 0x10

    .line 823
    invoke-virtual {v6, v10}, Landroid/widget/RelativeLayout;->setVerticalGravity(I)V

    .line 824
    iget-object v12, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v12}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$600(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    goto :goto_2

    :cond_4
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    :goto_2
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-virtual {v6, v12}, Landroid/widget/RelativeLayout;->setId(I)V

    .line 827
    new-instance v12, Landroid/widget/ImageButton;

    iget-object v13, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v13, v13, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v13}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v13

    invoke-direct {v12, v13}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 828
    new-instance v13, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v13, v11, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 829
    invoke-virtual {v13, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 830
    invoke-virtual {v12, v13}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 831
    const-string v13, "Back Button"

    invoke-virtual {v12, v13}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 832
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-virtual {v12, v13}, Landroid/widget/ImageButton;->setId(I)V

    .line 833
    iget-object v13, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v13, v13, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v13}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v13

    invoke-virtual {v13}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    .line 834
    iget-object v14, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v14, v14, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v14}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v14

    invoke-virtual {v14}, Landroidx/appcompat/app/AppCompatActivity;->getPackageName()Ljava/lang/String;

    move-result-object v14

    const-string v15, "ic_action_previous_item"

    const-string v5, "drawable"

    invoke-virtual {v13, v15, v5, v14}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v14

    .line 835
    invoke-virtual {v13, v14}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v14

    .line 836
    iget-object v15, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v15}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1000(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Ljava/lang/String;

    move-result-object v15

    const-string v10, ""

    if-eq v15, v10, :cond_5

    iget-object v15, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v15}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1000(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v12, v15}, Landroid/widget/ImageButton;->setColorFilter(I)V

    :cond_5
    const/4 v15, 0x0

    .line 837
    invoke-virtual {v12, v15}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 838
    invoke-virtual {v12, v14}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 839
    sget-object v14, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v12, v14}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/16 v14, 0xa

    .line 840
    invoke-direct {v0, v14}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v9

    invoke-direct {v0, v14}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v15

    const/4 v14, 0x0

    invoke-virtual {v12, v14, v9, v14, v15}, Landroid/widget/ImageButton;->setPadding(IIII)V

    .line 841
    invoke-virtual {v12}, Landroid/widget/ImageButton;->getAdjustViewBounds()Z

    .line 843
    new-instance v9, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$2;

    invoke-direct {v9, v0}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$2;-><init>(Lorg/apache/cordova/inappbrowser/InAppBrowser$7;)V

    invoke-virtual {v12, v9}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 850
    new-instance v9, Landroid/widget/ImageButton;

    iget-object v15, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v15, v15, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v15}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v15

    invoke-direct {v9, v15}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 851
    new-instance v15, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v15, v11, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 852
    invoke-virtual {v15, v2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 853
    invoke-virtual {v9, v15}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 854
    const-string v11, "Forward Button"

    invoke-virtual {v9, v11}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 855
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    invoke-virtual {v9, v11}, Landroid/widget/ImageButton;->setId(I)V

    .line 856
    iget-object v11, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v11, v11, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v11}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v11

    invoke-virtual {v11}, Landroidx/appcompat/app/AppCompatActivity;->getPackageName()Ljava/lang/String;

    move-result-object v11

    const-string v15, "ic_action_next_item"

    invoke-virtual {v13, v15, v5, v11}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 857
    invoke-virtual {v13, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 858
    iget-object v11, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v11}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1000(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Ljava/lang/String;

    move-result-object v11

    if-eq v11, v10, :cond_6

    iget-object v11, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v11}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1000(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {v9, v11}, Landroid/widget/ImageButton;->setColorFilter(I)V

    :cond_6
    const/4 v11, 0x0

    .line 859
    invoke-virtual {v9, v11}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 860
    invoke-virtual {v9, v5}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 861
    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v9, v5}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/16 v5, 0xa

    .line 862
    invoke-direct {v0, v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v11

    invoke-direct {v0, v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v5

    invoke-virtual {v9, v14, v11, v14, v5}, Landroid/widget/ImageButton;->setPadding(IIII)V

    .line 863
    invoke-virtual {v9}, Landroid/widget/ImageButton;->getAdjustViewBounds()Z

    .line 865
    new-instance v5, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$3;

    invoke-direct {v5, v0}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$3;-><init>(Lorg/apache/cordova/inappbrowser/InAppBrowser$7;)V

    invoke-virtual {v9, v5}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 872
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    new-instance v11, Landroid/widget/EditText;

    iget-object v13, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v13, v13, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v13}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v13

    invoke-direct {v11, v13}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v11}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1202(Lorg/apache/cordova/inappbrowser/InAppBrowser;Landroid/widget/EditText;)Landroid/widget/EditText;

    .line 873
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v5, v7, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 874
    invoke-virtual {v5, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/4 v11, 0x5

    .line 875
    invoke-virtual {v5, v14, v11}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 876
    iget-object v13, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v13}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/widget/EditText;

    move-result-object v13

    invoke-virtual {v13, v5}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 877
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/widget/EditText;

    move-result-object v5

    const/4 v13, 0x4

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-virtual {v5, v13}, Landroid/widget/EditText;->setId(I)V

    .line 878
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/widget/EditText;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 879
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/widget/EditText;

    move-result-object v5

    iget-object v13, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->val$url:Ljava/lang/String;

    invoke-virtual {v5, v13}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 880
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/widget/EditText;

    move-result-object v5

    const/16 v13, 0x10

    invoke-virtual {v5, v13}, Landroid/widget/EditText;->setInputType(I)V

    .line 881
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/widget/EditText;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 882
    iget-object v4, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v4}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/widget/EditText;

    move-result-object v4

    invoke-virtual {v4, v14}, Landroid/widget/EditText;->setInputType(I)V

    .line 883
    iget-object v4, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v4}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/widget/EditText;

    move-result-object v4

    new-instance v5, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$4;

    invoke-direct {v5, v0}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$4;-><init>(Lorg/apache/cordova/inappbrowser/InAppBrowser$7;)V

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 896
    iget-object v4, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v4}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$600(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v4

    if-eqz v4, :cond_7

    move v11, v2

    .line 897
    :cond_7
    invoke-direct {v0, v11}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->createCloseButton(I)Landroid/view/View;

    move-result-object v4

    .line 898
    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 901
    new-instance v4, Landroid/widget/RelativeLayout;

    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v5, v5, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 903
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1400(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Ljava/lang/String;

    move-result-object v5

    if-eq v5, v10, :cond_8

    .line 904
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1400(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    goto :goto_3

    :cond_8
    const v5, -0x333334

    .line 908
    :goto_3
    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 909
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v11, 0x30

    invoke-direct {v0, v11}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v11

    invoke-direct {v5, v7, v11}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v11, 0xc

    .line 910
    invoke-virtual {v5, v11, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 911
    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 912
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$400(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Ljava/lang/String;

    move-result-object v5

    if-eq v5, v10, :cond_9

    const/16 v5, 0x8

    invoke-direct {v0, v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v10

    invoke-direct {v0, v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v11

    invoke-direct {v0, v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v13

    invoke-direct {v0, v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->dpToPixels(I)I

    move-result v5

    invoke-virtual {v4, v10, v11, v13, v5}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 913
    :cond_9
    invoke-virtual {v4, v8}, Landroid/widget/RelativeLayout;->setHorizontalGravity(I)V

    const/16 v5, 0x50

    .line 914
    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->setVerticalGravity(I)V

    const/4 v5, 0x7

    .line 916
    invoke-direct {v0, v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->createCloseButton(I)Landroid/view/View;

    move-result-object v5

    .line 917
    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 920
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    new-instance v8, Landroid/webkit/WebView;

    iget-object v10, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v10, v10, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v10}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v10

    invoke-direct {v8, v10}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v8}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$102(Lorg/apache/cordova/inappbrowser/InAppBrowser;Landroid/webkit/WebView;)Landroid/webkit/WebView;

    .line 921
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v5

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v8}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 922
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v5

    const/4 v8, 0x6

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-virtual {v5, v10}, Landroid/webkit/WebView;->setId(I)V

    .line 924
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v5

    new-instance v10, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$5;

    iget-object v11, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->val$thatWebView:Lorg/apache/cordova/CordovaWebView;

    invoke-direct {v10, v0, v11}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$5;-><init>(Lorg/apache/cordova/inappbrowser/InAppBrowser$7;Lorg/apache/cordova/CordovaWebView;)V

    invoke-virtual {v5, v10}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 944
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    new-instance v10, Lorg/apache/cordova/inappbrowser/InAppBrowser$InAppBrowserClient;

    iget-object v11, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v13, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->val$thatWebView:Lorg/apache/cordova/CordovaWebView;

    invoke-static {v11}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/widget/EditText;

    move-result-object v15

    iget-object v7, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v7}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1600(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v10, v11, v13, v15, v7}, Lorg/apache/cordova/inappbrowser/InAppBrowser$InAppBrowserClient;-><init>(Lorg/apache/cordova/inappbrowser/InAppBrowser;Lorg/apache/cordova/CordovaWebView;Landroid/widget/EditText;Ljava/lang/String;)V

    invoke-static {v5, v10}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$002(Lorg/apache/cordova/inappbrowser/InAppBrowser;Lorg/apache/cordova/inappbrowser/InAppBrowser$InAppBrowserClient;)Lorg/apache/cordova/inappbrowser/InAppBrowser$InAppBrowserClient;

    .line 945
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v5

    iget-object v7, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v7}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$000(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowser$InAppBrowserClient;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 946
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v5

    invoke-virtual {v5}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v5

    .line 947
    invoke-virtual {v5, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 948
    invoke-virtual {v5, v2}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 949
    iget-object v7, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v7}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1700(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v7

    invoke-virtual {v5, v7}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 950
    sget-object v7, Landroid/webkit/WebSettings$PluginState;->ON:Landroid/webkit/WebSettings$PluginState;

    invoke-virtual {v5, v7}, Landroid/webkit/WebSettings;->setPluginState(Landroid/webkit/WebSettings$PluginState;)V

    .line 954
    iget-object v7, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v7}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v7

    new-instance v10, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$6;

    invoke-direct {v10, v0}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$6;-><init>(Lorg/apache/cordova/inappbrowser/InAppBrowser$7;)V

    invoke-virtual {v7, v10}, Landroid/webkit/WebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    .line 991
    iget-object v7, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v7}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1800(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v7

    invoke-virtual {v5, v7}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    .line 992
    iget-object v7, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v7}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v7

    new-instance v10, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$1JsObject;

    invoke-direct {v10, v0}, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$1JsObject;-><init>(Lorg/apache/cordova/inappbrowser/InAppBrowser$7;)V

    const-string v11, "cordova_iab"

    invoke-virtual {v7, v10, v11}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 994
    iget-object v7, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v7}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1900(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/CordovaPreferences;

    move-result-object v7

    const-string v10, "OverrideUserAgent"

    const/4 v11, 0x0

    invoke-virtual {v7, v10, v11}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 995
    iget-object v10, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v10}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$2000(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/CordovaPreferences;

    move-result-object v10

    const-string v13, "AppendUserAgent"

    invoke-virtual {v10, v13, v11}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v7, :cond_a

    .line 998
    invoke-virtual {v5, v7}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    :cond_a
    if-eqz v10, :cond_b

    .line 1001
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v11, " "

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    .line 1005
    :cond_b
    iget-object v7, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v7, v7, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v7}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroidx/appcompat/app/AppCompatActivity;->getIntent()Landroid/content/Intent;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v7

    if-nez v7, :cond_c

    goto :goto_4

    .line 1006
    :cond_c
    const-string v10, "InAppBrowserStorageEnabled"

    invoke-virtual {v7, v10, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 1008
    :goto_4
    iget-object v7, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v7, v7, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v7}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroidx/appcompat/app/AppCompatActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    const-string v10, "inAppBrowserDB"

    invoke-virtual {v7, v10, v14}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    .line 1009
    invoke-virtual {v5, v7}, Landroid/webkit/WebSettings;->setDatabasePath(Ljava/lang/String;)V

    .line 1010
    invoke-virtual {v5, v2}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 1012
    :cond_d
    invoke-virtual {v5, v2}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 1014
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$2100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 1015
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v5

    invoke-virtual {v5}, Landroid/webkit/CookieManager;->removeAllCookie()V

    goto :goto_5

    .line 1016
    :cond_e
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$2200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v5

    if-eqz v5, :cond_f

    .line 1017
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v5

    invoke-virtual {v5}, Landroid/webkit/CookieManager;->removeSessionCookie()V

    .line 1021
    :cond_f
    :goto_5
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v5

    iget-object v7, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v7}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v7

    invoke-virtual {v5, v7, v2}, Landroid/webkit/CookieManager;->setAcceptThirdPartyCookies(Landroid/webkit/WebView;Z)V

    .line 1023
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v5

    iget-object v7, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->val$url:Ljava/lang/String;

    invoke-virtual {v5, v7}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 1024
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {v5, v7}, Landroid/webkit/WebView;->setId(I)V

    .line 1025
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v5

    invoke-virtual {v5}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 1026
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v5

    invoke-virtual {v5}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v5

    iget-object v7, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v7}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$2300(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v7

    invoke-virtual {v5, v7}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 1029
    iget-object v5, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v5}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v5

    invoke-virtual {v5}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    .line 1030
    iget-object v2, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v2}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/webkit/WebView;->requestFocus()Z

    .line 1031
    iget-object v2, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v2}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/webkit/WebView;->requestFocusFromTouch()Z

    .line 1034
    invoke-virtual {v6, v12}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1035
    invoke-virtual {v6, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1038
    iget-object v2, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v2}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$2400(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v2

    if-nez v2, :cond_10

    invoke-virtual {v3, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1039
    :cond_10
    iget-object v2, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v2}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$2500(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v2

    if-nez v2, :cond_11

    iget-object v2, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v2}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1042
    :cond_11
    iget-object v2, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v2}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$2600(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 1044
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1048
    :cond_12
    new-instance v2, Landroid/widget/RelativeLayout;

    iget-object v3, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object v3, v3, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 1049
    iget-object v3, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v3}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1050
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1053
    iget-object v3, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v3}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$2700(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v3

    if-eqz v3, :cond_13

    .line 1054
    invoke-virtual {v2, v4}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1057
    :cond_13
    new-instance v2, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v2}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 1058
    iget-object v3, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v3}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/WindowManager$LayoutParams;->copyFrom(Landroid/view/WindowManager$LayoutParams;)I

    const/4 v3, -0x1

    .line 1059
    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 1060
    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 1062
    iget-object v3, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v3}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v3

    if-eqz v3, :cond_14

    .line 1063
    iget-object v3, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v3}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v3

    invoke-virtual {v3, v1}, Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;->setContentView(Landroid/view/View;)V

    .line 1064
    iget-object v1, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;->show()V

    .line 1065
    iget-object v1, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 1069
    :cond_14
    iget-object v1, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$2800(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Z

    move-result v1

    if-eqz v1, :cond_15

    iget-object v1, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v1

    if-eqz v1, :cond_15

    .line 1070
    iget-object v1, v0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$200(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;->hide()V

    :cond_15
    return-void
.end method
