# YunBaseApp

自己开发的 iOS 应用开发的基本框架，涉及 App 中等各种功能：UIViewController 的封装、主题管理、帐号管理、日志管理、、加载页、提示信息、错误封装等。

- Platform: iOS 9.0 and later

## 需要的组件

- YunKits

- AFNetworking

- Masonry

- Mantle

- MBProgressHUD

## 模块

- Account （用户信息管理）

- ActionListView （Action选择控件）

- AlertView （提示控件）

- Cache （缓存管理）

- Error （Error管理）

- HudView （HudView 基类）

- Log （日志封装）

- Rqt （网络请求封装）

- Theme （主题管理）

- View （UIView 和 UIViewController 的封装）

- ViewCategory (UIView 和 UIViewController的扩展)

## 安装

Use the cocoaPods

> `pod 'YunBaseApp'`


---

# 各模块使用简略说明

## Account （用户信息管理）

### 1)实现代理

```
    /// 设置全局代理
    YunAccountMgHelper.mg.delegate = self;
```

代理实现

```
- (void)didAcctUpdated:(YunAccountModel *)acct {
    /// 处理用户数据更新后的逻辑
    /// 如：注册推送id
}

- (void)didAcctRemoved:(YunAccountModel *)acct {
    /// 处理用户数据删除后的逻辑
    /// 如：移除推送id
}
```


### 2)功能

```
    // 保存
    [YunAccountMgHelper.mg storeUser:userData name:nil];

    // 获取
    userData = YunAccountMgHelper.mg.fetchUser;

    // 删除
    [YunAccountMgHelper.mg removeAcct];
```

## ActionListView （Action选择控件）

使用示例如下：

一些配置项，见**YunInputActionListView**

```
    /// 添加选择项
    NSMutableArray *itemList = [NSMutableArray new];

    [itemList addObject:[YunActionListItemModel modelWithItemId:@"id1"
                                                       itemName:@"项目1"
                                                           item:nil]];

    [itemList addObject:[YunActionListItemModel modelWithItemId:@"id2"
                                                       itemName:@"项目2"
                                                           item:nil]];

    /// 实例对象
    YunInputActionListView *actionListView = [YunInputActionListView new];
    actionListView.viewTitle = @"选择一项";
    actionListView.itemList = itemList;

    actionListView.didSelectItem = ^(YunActionListItemModel *item) {
      // 选中的项
    };

    /// 显示 view
    [actionListView showView];
```

## AlertView （提示控件）

### 1. 默认实现的提示控件：

```
   [YunAlertViewHelper.instance showYes:@"加载完成"];

    [YunAlertViewHelper.instance showYesNo:@"确定添加成员？" result:^(BOOL yes) {

    }];

    [YunAlertViewHelper.instance showDelete:@"确定删除成员？" result:^(BOOL yes) {

    }];
```

配置信息见：**YunAlertConfig**

### 2. 也可以自定义实现控件，需要实现**YunAlertViewHelperDelegate**

```
    /// 单例代理
    YunAlertViewHelper.instance.delegate = self;

    /// 全局代理
    YunAlertConfig.instance.alertViewDelegate = self;
```

实现代理

```
- (void)showDelete:(NSString *)content result:(AlertYesBlock)result {
}

- (void)showYes:(NSString *)content {
}

- (void)showYes:(NSString *)content result:(AlertYesBlock)result {
}

...
```


## Cache （缓存管理）

### 1)设置缓存文件

```
    /// 初始化缓存文件名
    YunCacheFileHelper.instance.fileList = @[
            @"file1", @"file2", @"file3", @"file4"
    ];
```

或者实现代理

```
    YunCacheFileHelper.instance.delegate = self;
```

### 2)缓存功能

```
    id cacheData; // 需要实现序列化，我采用的是MTLModel
    NSInteger cacheIndex = 0; // 缓存对象的index，对应fileList的文件

    /// 保存缓存数据
    [YunCacheFileHelper.instance saveItem:cacheData index:cacheIndex];

    /// 获取缓存数据
    id data = [YunCacheFileHelper.instance getItem:cacheIndex];

    /// 删除数据
    [YunCacheFileHelper.instance removeItemByIndex:cacheIndex];
```

## Error （Error管理）

### 1)配置错误信息

```
    /// 设置自定义错误码和错误信息
    [YunErrorConfig.instance setItem:YunErrTypeOutOfLogin defMsg:@"登录信息已过期，请重新登录"];
    [YunErrorConfig.instance setItem:YunErrTypeOutOfLogin codes:@[
            [YunErrorCodeAndMsg itemWithCode:YunErrTypeOutOfLogin msg:nil],
            [YunErrorCodeAndMsg itemWithCode:105 msg:nil],
            [YunErrorCodeAndMsg itemWithCode:114 msg:nil],
    ]];

    [YunErrorConfig.instance setItem:YunErrTypeRqtTimeOut defMsg:@"请求超时,请重试"];
    [YunErrorConfig.instance setItem:YunErrTypeRqtTimeOut codes:@[
            [YunErrorCodeAndMsg itemWithCode:-1001 msg:nil],
    ]];

    /// 设置特殊错误信息处理
    YunErrorConfig.instance.didErrorOn = ^(YunErrorModel *err, BOOL hasHandle) {
        if (err.type == YunErrTypeOutOfLogin) {
            // 退出到登录页面
        }

        //...
    };
    
    //...
```

### 2)生成错误对象

```
    /// 自定义错误
    YunErrorModel *errorDef = [YunErrorModel itemWithType:YunErrTypeRqtTimeOut
                                                     code:-1
                                                      msg:nil];

    /// RqtRsp错误
    YunRqtRpsHelper *rspHelper;
    YunErrorModel *rqtRspError = [YunErrorHelper itemWithRpsError:rspHelper].getError;
```

## HudView （HudView 基类）

### 使用示例

继承`YunHudOnWindow`类，实现`- (void)initSubClass;`方法

```
@interface YunHudOnWindowDemo : YunHudOnWindow
@end

@implementation YunHudOnWindowDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        /// 设置属性，具体参见YunHudOnWindow
        self.bgColor = UIColor.whiteColor;
    }

    return self;
}

- (void)initSubClass {
    /// 初始化页面内界面
}

@end

```

## Log （日志封装）

根据设置控制是否输出日志信息。

- 配置项 

`YunConfig.instance.isLogMode = YES;`

- 日志输出

```
[YunLogHelper logMsg:@"日志信息"];
```

## Rqt （网络请求封装）

### 1)参数设置

```
 /// 参数设置 具体参看YunRqtConfig
    YunRqtConfig.instance.devType = @"1";
    YunRqtConfig.instance.devTypeParaName = @"deviceType";

    if (YunConfig.instance.isDebugMode) { // 本地测试
        YunRqtConfig.instance.baseURL = [NSURL URLWithString:@"http://192.168.0.110:8080/"];
    }
    else { // 正式
        YunRqtConfig.instance.baseURL = [NSURL URLWithString:@"http://test.demo.com/"];
    }

    YunRqtConfig.instance.baseApiURL =
            [NSURL URLWithString:FORMAT(@"%@api/", [YunRqtConfig.instance.baseURL absoluteString])];

    YunRqtConfig.instance.tokenParaName = @"token";

    YunRqtConfig.instance.rspCodeName = @"status";

    NSString *userToken ; /// token 获取

    // Content-Type 不要设置
    YunRqtConfig.instance.headerParas = [@{
            YunRqtConfig.instance.tokenParaName   : userToken == nil ? @"" : userToken,
            YunRqtConfig.instance.devTypeParaName : YunRqtConfig.instance.devType,
            @"Version"                            : YunAppInfo.appVersion,
    } mutableCopy];
```

### 2）使用

```
/// GET 方法
- (void)getData:(void (^)(id rspData))success
        failure:(void (^)(YunErrorHelper *error))failure {
    YunRqtMg *rqMg = [YunRqtMg request];

    [rqMg GET:[YunRqtUrlHelper urlCmBaseApi:@"getData"]
   parameters:YunRqtUrlHelper.getBasePara
     progress:nil
      success:^(NSURLSessionDataTask *task, id responseObject) {
          YunRqtRpsHelper *rsp = [[YunRqtRpsHelper alloc] initWithRsp:responseObject];
          if ([rsp isSuccess]) {
              id dataItem = rsp.data; /// 根据rsp.data转换为对象
              if (success) {success(dataItem);}
          }
          else {
              if (failure) {failure([YunErrorHelper itemWithRpsError:rsp]);}
          }
      } failure:^(NSURLSessionDataTask *task, NSError *error) {
         if (failure) {failure([YunErrorHelper itemWithError:error]);}
     }];
}

/// POST 方法
- (void)createItem:(NSString *)itemId
           success:(void (^)(void))success
           failure:(void (^)(YunErrorHelper *error))failure {

    YunRqtMg *rqMg = [YunRqtMg request];

    [rqMg POST:[YunRqtUrlHelper urlCmBaseApi:@"createItem"]
    parameters:[YunRqtUrlHelper baseParaWithDic:@{@"itemId" : itemId}]
     queryMode:NO
      progress:nil
       success:^(NSURLSessionDataTask *task, id responseObject) {
           YunRqtRpsHelper *rsp = [[YunRqtRpsHelper alloc] initWithRsp:responseObject];
           if ([rsp isSuccess]) {
               if (success) {success();}
           }
           else {
               if (failure) {failure([YunErrorHelper itemWithRpsError:rsp]);}
           }
       } failure:^(NSURLSessionDataTask *task, NSError *error) {
         if (failure) {failure([YunErrorHelper itemWithError:error]);}
     }];
}

//...
```

## Theme （主题管理）

### 1）配置信息

```
    /// 具体参考YunAppThemeColorConfig
    
    /// 缩放设置
    CGFloat delta = [YunSizeHelper screenWidth] - 414.0f;
    CGFloat delta1 = delta / 414.0f * 0.5f;
    YunAppTheme.instance.curYunTheme.screenScale = 1.0f * (1.0f + delta1); // 当前屏幕相对于6p屏幕的比列大小
    YunAppTheme.instance.scaleIsOn = YES; /// 根据屏幕大小，缩放字体大小

    /// 基准字体大小
    YunAppTheme.instance.curYunTheme.baseFontSize =
            [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline].pointSize;

    /// 主题颜色配置
    YunAppThemeColorConfig.instance.colorBaseNor = [UIColor blackColor];
    YunAppThemeColorConfig.instance.colorVcBg = [UIColor hexColor:0xf2f2f2];
    YunAppThemeColorConfig.instance.colorViewBg = [UIColor clearColor];

    YunAppThemeColorConfig.instance.colorBaseDark = [UIColor hexColor:0x595E6B];
    YunAppThemeColorConfig.instance.colorBaseDk1 = [UIColor hexColor:0xA4AAB3];
    YunAppThemeColorConfig.instance.colorBaseDk2 = [UIColor hexColor:0xE6E6E6];
    YunAppThemeColorConfig.instance.colorBaseDk3 = [UIColor hexColor:0xF4F5F6];
    YunAppThemeColorConfig.instance.colorBaseDk4 = [UIColor hexColor:0xFAFAFA];

    YunAppThemeColorConfig.instance.colorBaseLight = [UIColor lightGrayColor];
    YunAppThemeColorConfig.instance.colorBaseLg1 = [UIColor hexColor:0xE2F5FF];
    YunAppThemeColorConfig.instance.colorBaseLg2 = [UIColor hexColor:0xFF9600];
    YunAppThemeColorConfig.instance.colorBaseLg3 = [UIColor hexColor:0x347BB8];
    YunAppThemeColorConfig.instance.colorBaseLg4 = [UIColor hexColor:0x3C0000];

    YunAppThemeColorConfig.instance.colorBaseHl = [UIColor hexColor:0x17d5d1];
    YunAppThemeColorConfig.instance.colorBaseAlert = [UIColor hexColor:0xff2d55];
    YunAppThemeColorConfig.instance.colorBaseCmp = [UIColor greenColor];
    YunAppThemeColorConfig.instance.colorBaseWhite = [UIColor whiteColor];
    YunAppThemeColorConfig.instance.colorBaseBlack = [UIColor blackColor];

    // bg
    YunAppThemeColorConfig.instance.colorBgNor = [UIColor clearColor];
    YunAppThemeColorConfig.instance.colorBgDark = [UIColor grayColor];
    YunAppThemeColorConfig.instance.colorBgLight = [UIColor lightGrayColor];

    // nag
    YunAppThemeColorConfig.instance.colorNagBg = YunAppThemeColorConfig.instance.colorBaseHl;
    YunAppThemeColorConfig.instance.colorNagNor = [UIColor whiteColor];
    YunAppThemeColorConfig.instance.colorNagDark = [UIColor whiteColor];
    YunAppThemeColorConfig.instance.colorNagLight = [UIColor whiteColor];

    // Ctn
    YunAppThemeColorConfig.instance.colorCtnNor = [UIColor whiteColor];
    YunAppThemeColorConfig.instance.colorCtnDark = [UIColor blackColor];
    YunAppThemeColorConfig.instance.colorCtnLight = [UIColor lightGrayColor];

    // 字体大小配置

    YunAppTheme.instance.sizeSM = 13;
    YunAppTheme.instance.sizeS = 14;
    YunAppTheme.instance.sizeN = 15;
    YunAppTheme.instance.sizeL = 16;
    YunAppTheme.instance.sizeLM = 17;

    // 字体设置
    YunAppTheme.instance.fontLName = @"FZLanTingHei-EL-GBK";
    YunAppTheme.instance.fontNName = @"FZLanTingHei-EL-GBK";
    YunAppTheme.instance.fontBName = @"FZLanTingHei-DB-GBK";
    YunAppTheme.instance.fontNumName = @"DIN-MediumItalic";
```

### 2）使用

```
    UILabel *lbl = [UILabel new];
    lbl.font = [YunAppTheme fontB_N]; /// 粗体，正常大小
    lbl.font = [YunAppTheme fontN:18]; /// 正常体，字号18

    lbl.textColor = YunAppTheme.colorBaseDk1; /// Dk1颜色
    lbl.textColor = YunAppTheme.colorBaseHl; /// 主题高亮色
    lbl.textColor = YunAppTheme.colorBaseAlert; /// 主题警示色
```

### 3）改变应用字体大小

```
    /// 改变 App 内所有字体大小
    CGFloat tgSize;
    YunAppTheme.instance.curYunTheme.baseFontSize = tgSize;
```

### 4）改变主题颜色

重新配置`YunAppThemeColorConfig`内，所有颜色配置。


## View （UIView 和 UIViewController 的封装）

`YunAppViewController`和`YunAppView`是对`UIViewController `和`UIView`的封装，实现了 App 应用中大多数场景和配置。

- 根据`UIViewController `的生命周期，分解成不同的业务方法。分解参见[UIViewController 生命周期方法与业务逻辑](https://yunwjr.github.io/2018/04/18/iOS-kit-vc-life/)

- 封装常用的设置，如：导航栏透明/隐藏，导航栏按钮设置，侧滑返回，数据更新逻辑等

- 根据页面方法，默认实现加载动画、错误信息显示、重试页面等。见下一章`ViewCategory`

下面以`YunAppViewController`为例，介绍其使用。

```
@interface YunAppViewControllerDemo : YunAppViewController
@end


@implementation YunAppViewControllerDemo

#pragma mark - main

- (instancetype)init {
    self = [super init];
    if (self) {
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    /// 移出通知等信息
}

#pragma mark - yun app

// 初始化数据
- (void)initVcData {
    [super initVcData];

    /// 配置项，具体参看YunAppViewController
    self.popGestureOn = YES; /// 开启侧滑返回手势，仅在root节点设置为 YES
    self.hideNagBar = YES; /// 隐藏导航栏
    self.isNagBarClear = YES; /// 导航栏透明

    self.hideStateView = YES; /// 不显示加载框
}

// 初始化 view
- (void)initVcSubViews {
    [super initVcSubViews];

    /// 初始化页面
    /// 给 self.view 添加 subview
}

// ViewWillAppear
- (void)handleViewWillAppear {
    [super handleViewWillAppear];
}

// ViewDidAppear
- (void)handleViewDidAppear {
    [super handleViewDidAppear];
}

// ViewDidDisappear
- (void)handleViewDidDisappear {
    [super handleViewDidDisappear];
}

// 从服务器加载数据
- (void)loadDataFromServer {
    [super loadDataFromServer]; /// 自动显示数据加载框

    /// 加载数据

    /// 加载完成,并触发页面更新，将执行updateVcState方法
    [self loadDataCmpAndUpdateVcState];
}

// 从服务器加载更多数据
- (void)loadMoreDataFromServer {
    [super loadMoreDataFromServer];
}

// 更新 Vc 的状态（可以在加载完成时调用）
- (void)updateVcState {
    [super updateVcState];
}

// 开始更新 Vc 状态（实现该方法，updateVcState 时会触发）
- (void)updateVcStateOn {
    [super updateVcStateOn];

    /// 根据记在的数据，更新页面信息
}

// 状态更新完成（隐藏一些加载框等）（实现该方法，updateVcState 时会触发）
- (void)updateVcStateCmp {
    [super updateVcStateCmp];
}

// 是否加载数据
- (BOOL)shouldLoadData {
    // self.needUpdateData = YES; 一直都加载
    return [super shouldLoadData];
}

#pragma mark - request functions

#pragma mark - handles

#pragma mark - public functions

#pragma mark - private functions

#pragma mark - protocol

@end

```

## ViewCategory (UIView 和 UIViewController的扩展)























































