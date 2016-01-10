//
//  CFMainPgeViewController.m
//  ToStartTravelAround
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFMainPageViewController.h"
#import "CFVMainPageView.h"
#import "CFBannerView.h"
#import "CFNetWork.h"
#import "CFFirstTableViewCell.h"
#import "CFSecondViewCell.h"
#import "CFSelectCityViewController.h"
#import "MJRefresh.h"
#import "AFNetworking.h"
#import <CoreLocation/CoreLocation.h>
#import "CFMainPageModel.h"
#import "CFProductModel.h"
#import "CFThirdTableViewCell.h"
#import "CFLoadDataView.h"
#import "UIImage+GIF.h"
#import "CFHeader.h"
#import "CFChoosenUtility.h"
#import "CFSearchController.h"
#import "AFNetworkReachabilityManager.h"
@interface CFMainPageViewController ()<UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate>
{
    CFBannerView *_bannerView;//广告栏的View
    CFVMainPageView *_mainPageView;
    NSMutableArray *_travelItemArr;
    NSMutableArray *_travelPackageArr;
    NSMutableArray *_travelReconmmendArr;//精品推荐的数组
    NSMutableArray *_locationInfoArr;//保存当前定位的位置信息等
    NSString *_cityCode;
    NSString *_currentCityName;//当前定位城市的名字
    double _lat;//纬度
    double _lng;//经度
    CFLoadDataView *_loadView;
#warning ray测试
    CFProductModel *_productModel;

}
@property (nonatomic ,strong) CLGeocoder *geocoder;//反地理编码
@property(nonatomic,strong)CLLocationManager *locationManager;//定位管理者
@property(nonatomic,strong)CLLocation *currentLocation;//储存当前的位置信息
@property(nonatomic,strong)UIButton *leftButton;
@end

@implementation CFMainPageViewController

#pragma mark ==========================判断网络情况============================
- (void)observerNetStatus
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable) {
            [self remindStatus:@"网络异常"];
        }
        else
        {
//            [self remindStatus:@"已连接网络"];
        }
    }];
}
- (void)remindStatus:(NSString *)msg
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
}
#pragma mark ==========================懒加载============================
- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager = [CLLocationManager new];
    }
    return _locationManager;
}

- (CLGeocoder *)geocoder
{
    if (!_geocoder) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

#pragma mark ==========================视图相关============================
- (void)viewDidLoad {
    [super viewDidLoad];
    _cityCode = @"440300";
    

    [self getCurrentLocation];
    [self createView];
    [self createNavButton];
    [self createDrapDowmRefresh];
    [self createLoadDataAnimation];//添加加载动画
    [self observerNetStatus];//检测网络状态
    
    [[NSUserDefaults standardUserDefaults]setValue:@"440300" forKey:@"cityCode"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    //添加观察者
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cityDidChangeNotification:) name:CFCityDidChangeNotification object:nil];
    
}

- (void)createLoadDataAnimation
{
    _loadView = [[CFLoadDataView alloc]initWithFrame:self.view.bounds];
    _loadView.backgroundColor = [UIColor whiteColor];
//    [_loadView bringSubviewToFront:_bannerView];
    
    NSString *imageFilePath = [[NSBundle mainBundle]pathForResource:@"pull_refreshing_icon.gif" ofType:nil];
    NSData *imageData = [NSData dataWithContentsOfFile:imageFilePath];
    _loadView.animationImageView.image  = [UIImage sd_animatedGIFWithData:imageData];
    [_loadView addSubview:_loadView.animationImageView];

    [self.view addSubview:_loadView];
}
//创建视图
- (void)createView
{
    _mainPageView = [[CFVMainPageView alloc]initWithFrame:self.view.bounds];
    _mainPageView.tableView.delegate = self;
    _mainPageView.tableView.dataSource = self;

    //加尾部视图
    UIButton *footerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    footerBtn.backgroundColor = [UIColor whiteColor];
    footerBtn.frame = CGRectMake(0, 0, IphoneWidth, 30);
    [footerBtn setTitle:@"看看周边推荐" forState:UIControlStateNormal];
    [footerBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    _mainPageView.tableView.tableFooterView = footerBtn;
    self.view = _mainPageView;
    _bannerView = [[CFBannerView alloc]initWithFrame:CGRectMake(0, 0, IphoneWidth, 100)];
    
    _mainPageView.tableView.tableHeaderView = _bannerView;
    
}
//添加下拉刷新空间
- (void)createDrapDowmRefresh
{
    MJRefreshHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(mainPageRequest)];
    _mainPageView.tableView.header = header;
//    [_locationManager startUpdatingLocation];
    [_mainPageView.tableView.header beginRefreshing];
}
- (void)createNavButton
{
    //导航栏左边的按钮
    _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_leftButton setImage:[UIImage imageNamed:@"home_nav_bar_loaction_arrow_icon"] forState:UIControlStateNormal];
    _leftButton.frame = CGRectMake(0, 0, 40, 20);
    _leftButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [_leftButton setTitle:@"深圳" forState:UIControlStateNormal];
    
    [_leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    leftBtn.backgroundColor = [UIColor yellowColor];
    _leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    _leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    //设置点击事件
    [_leftButton addTarget:self action:@selector(selectCityAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_leftButton];

    //导航栏右边的按钮
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, IphoneWidth-90, 25);

    UIImage *searchBacImage = [UIImage imageNamed:@"home_search_bar_bg"];
    [rightBtn setBackgroundImage:[searchBacImage resizableImageWithCapInsets:UIEdgeInsetsMake(searchBacImage.size.height/2, searchBacImage.size.width/2, (searchBacImage.size.height/2)+1, (searchBacImage.size.width/2)+1)] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:13];

    rightBtn.layer.borderColor = CFColor(231, 231, 234).CGColor;
    rightBtn.layer.borderWidth = 1;
    rightBtn.layer.cornerRadius = 4;
    [rightBtn setTitle:@"搜索目的地/景点/酒店等" forState:UIControlStateNormal];
    
    [rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //    leftBtn.backgroundColor = [UIColor yellowColor];
    rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -70, 0, 0);
    [rightBtn addTarget:self action:@selector(selectGoalAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    rightBtn.adjustsImageWhenHighlighted = NO;

    
    
}
#pragma mark ==========================调用方法============================
//选择城市/定位
- (void)selectCityAction
{
    CFSelectCityViewController *view = [[CFSelectCityViewController alloc]init];

    [self.navigationController pushViewController:view animated:YES];
}
- (void)selectGoalAction
{
    CFSearchController *searchVC = [[CFSearchController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
}
- (void)cityDidChangeNotification:(NSNotification *)notification
{
    _currentCityName = notification.userInfo[CFSelectCityDic][@"cityNameAbbr"];
    [_leftButton setTitle:_currentCityName forState:UIControlStateNormal];

    [_mainPageView.tableView.header beginRefreshing];
}
#pragma mark ==========================数据请求方法============================

- (void)mainPageRequest
{
    if (_cityCode != nil) {
        //首页广告栏请求
        [_bannerView.timer invalidate];
        _bannerView.timer = nil;
        NSString *parmas = [NSString stringWithFormat:@"system=ios&channel=AppStore&area_code=%@&column=appTopicBig%@2CappTopicMid%@2CbannerSquare%@2CbannerRound%@2CbannerScroll&version=4.2.6",City_Code,@"%",@"%",@"%",@"%"];
        NSLog(@"responseObject1:%@",parmas);
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager.requestSerializer setQueryStringSerializationWithStyle:ZDDHTTPRequestQueryStringDefaultStyle];
        [manager GET:HOME_ADURL parameters:parmas success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSMutableArray *AdModelArr = [NSMutableArray new];
            for (NSDictionary *dic in responseObject[@"content"][0][@"ad"]) {
                CFMainPageModel *mainPageADModel = [[CFMainPageModel alloc]init];
                [mainPageADModel setValuesForKeysWithDictionary:dic[@"ct"]];
                [AdModelArr addObject:mainPageADModel];
            }
            [_bannerView reloadHeaderView:AdModelArr];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             [_mainPageView.tableView.header endRefreshing];
        }];

        //首页分类请求
        NSString *parmas1 = [NSString stringWithFormat:@"system=ios&channel=AppStore&area_code=%@&column=appTopicBig%@2CappTopicMid%@2CbannerSquare%@2CbannerRound%@2CbannerScroll&version=4.2.6",City_Code,@"%",@"%",@"%",@"%"];
        
        [manager.requestSerializer setQueryStringSerializationWithStyle:ZDDHTTPRequestQueryStringDefaultStyle];
        [manager GET:HOME_ADURL parameters:parmas1 success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSMutableArray *AdModelArr = [NSMutableArray new];
            for (NSDictionary *dic in responseObject[@"content"][1][@"ad"]) {
                CFMainPageModel *mainPageADModel = [[CFMainPageModel alloc]init];
                [mainPageADModel setValuesForKeysWithDictionary:dic[@"ct"]];
                [AdModelArr addObject:mainPageADModel];
            }
            _travelItemArr = AdModelArr;
            //停止刷新
            [_mainPageView.tableView reloadData];

            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [_mainPageView.tableView.header endRefreshing];

        }];

        //首页套餐请求
        NSString *parmas2 = [NSString stringWithFormat:@"system=ios&channel=AppStore&area_code=%@&column=appTopicBig%@2CappTopicMid%@2CbannerSquare%@2CbannerRound%@2CbannerScroll&version=4.2.6",City_Code,@"%",@"%",@"%",@"%"];
        
        [manager.requestSerializer setQueryStringSerializationWithStyle:ZDDHTTPRequestQueryStringDefaultStyle];
        [manager GET:HOME_ADURL parameters:parmas2 success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSMutableArray *AdModelArr = [NSMutableArray new];
            for (NSDictionary *dic in responseObject[@"content"][2][@"ad"]) {
                CFMainPageModel *mainPageADModel = [[CFMainPageModel alloc]init];
                [mainPageADModel setValuesForKeysWithDictionary:dic[@"ct"]];
                [AdModelArr addObject:mainPageADModel];
            }
            _travelPackageArr = AdModelArr;
            //停止刷新
            [_mainPageView.tableView reloadData];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [_mainPageView.tableView.header endRefreshing];

        }];

        //精品推荐数据请求
        NSMutableDictionary *dic = [NSMutableDictionary new];
        CFUserInformationModel *userModel = [[[FMDBManager sharedInstace]selectModelArrayInDatabase:@"CFUserInformationModel"] lastObject];
        dic[@"pageSize"] = @"10";
        dic[@"city"] = City_Code;
        dic[@"system"] = @"ios";
        dic[@"channel"] = @"AppStore";
        dic[@"regid"] = @"d%2@%2FigwEhgBGCI2TG6lWqlMOtXipeUX%2FJkVvf4UEgMY9yrC5XmlYZbMw0%2FR0O0ryb1S8%2FWXPrKI7sTWzw6oHVuotvmpLLOf%2BKvZ14hEi5CcA%3D";
        dic[@"version"] = @"4.2.6";
        dic[@"pageIndex"] = @"1";
        if ([LOGINSTATUS isEqualToString:@"login"]) {
            dic[@"userId"] = [userModel valueForKey:@"userId"];

        }
        else
        {
             dic[@"userId"] = @"0";
        }
        [CFNetWork networkRecommendRequest:dic whileSuccess:^(id responseObject) {
            _travelReconmmendArr = responseObject;
            //移除加载视图
            [UIView animateWithDuration:1.5 animations:^{
                _loadView.alpha = 0;
            }];
            //延迟操作
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [_loadView removeFromSuperview];
            });


            [_mainPageView.tableView reloadData];
        } orFail:^(id responseObject) {
             [_mainPageView.tableView.header endRefreshing];

        }];
        
        
        [_mainPageView.tableView.header endRefreshing];

        }
    
    
   
}
- (void)geocoderRequest
{
    NSString *parmas = [NSString stringWithFormat:@"output=json&location=%f,%f&ak=5m8ce8u7yxtruSZoFlHDB8Ny",_lat,_lng];
    [CFNetWork networkGeocoderRequest:parmas whileSuccess:^(id responseObject) {
        _locationInfoArr = responseObject;
        _cityCode = [_locationInfoArr[0] valueForKey:@"cityCode"];
//            [_mainPageView.tableView.header beginRefreshing];
            [_leftButton setTitle:_currentCityName forState:UIControlStateNormal];
            

    } orFail:^(id responseObject) {
        NSLog(@"11111------------------");
    }];

}
#pragma mark =======================获取当前位置=======================
- (void)getCurrentLocation
{
    //判断设备系统版本
    if (DeviceVersion >=8.0) {
        //申请定位权限
        [self.locationManager requestAlwaysAuthorization];
        
    }
    //开始监测用户位置
    
    //    self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    
}

#pragma mark ==========================代理方法============================
#pragma mark- CLLocationManagerDelegate
//定位成功，返回位置信息
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    _currentLocation = locations[0];
    [_locationManager stopUpdatingLocation];
    // 3.根据CLLocation对象获取对应的地标信息
    [self.geocoder reverseGeocodeLocation:_currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
      
        for (CLPlacemark *placemark in placemarks) {
            _currentCityName = placemark.locality;
            CLLocation *location = placemark.location;
            _lat = location.coordinate.latitude;
            _lng = location.coordinate.longitude;
            //根据经纬度请求的到的位置
            [self geocoderRequest];
        }

    }];
    
    
    
}
//定位失败
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    NSLog(@"定位失败");
    
}

#pragma mark - TableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return _travelReconmmendArr.count;
    }
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        CFFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_1" forIndexPath:indexPath];
        if (_travelItemArr.count!=0) {
             [cell fillItemWithModel:_travelItemArr];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
    if (indexPath.section == 1) {
        CFSecondViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_2" forIndexPath:indexPath];
        
        if (_travelPackageArr.count!=0) {
            [cell fillItemWithModel:_travelPackageArr];
        }
        return cell;
    }

    else
    {
        CFThirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_3" forIndexPath:indexPath];
        [cell fillItemWithModel:_travelReconmmendArr[indexPath.row]];
        return cell;

    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return 0;
    }
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (IphoneWidth == 375) {
            return 80;
        }
        else if (IphoneWidth == 414)
        {
            return 90;
        }
        else
        {
            return 70;
        }

    }
    if (indexPath.section == 1) {
        if (IphoneWidth == 375) {
            return 70 * _travelPackageArr.count/2;
        }
        else if (IphoneWidth == 414)
        {
            return 75 * _travelPackageArr.count/2;
        }
        else
        {
            return 65 * _travelPackageArr.count/2;
        }
    }
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    //添加到浏览历史
//    if (![[CFChoosenUtility sharedChoosenUtility] isChoosenWithName:_productModel.productName]) {
//        
//         [[CFChoosenUtility sharedChoosenUtility] addChoosenObject:_productModel];
//    }
   
    [[CFChoosenUtility sharedChoosenUtility] addChoosenObject:_travelReconmmendArr[indexPath.row]];
    
}
@end
