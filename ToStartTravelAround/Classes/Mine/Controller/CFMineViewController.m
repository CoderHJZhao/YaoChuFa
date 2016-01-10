//
//  CFMineViewController.m
//  ToStartTravelAround
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//
#import "CFMineViewController.h"
#import "CFMineTableView.h"
#import "CFLoginController.h"
#import "CFSettingController.h"
#import "CFScanSomeThingViewController.h"
//第三方分享功能实现控制器
#import "CFShareViewController.h"
//分享视图页面
#import "CFSocialShareView.h"
#import "CFPesonnalInfoController.h"
#import "CFPointsController.h"
#import "CFListHistoryController.h"
#import "CFCollectionController.h"
#import "CFMyOrderController.h"
#import "UMSocial.h"

@interface CFMineViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)CFMineTableView *mainView;//主视图
@property (nonatomic, strong)NSArray *dataSource;//数据源数组
@property (nonatomic, strong)NSArray *imageArray;//图片数据数组
@end

@implementation CFMineViewController

//懒加载
-(NSArray *)dataSource
{
    if (!_dataSource) {
        
        _dataSource = @[@"我的订单", @"抢购订单", @"收藏", @"浏览历史", @"团购预约", @"分享要出发给朋友", @"常用设置"];
    }
    
    return _dataSource;
    
}

-(NSArray *)imageArray
{
    if (!_imageArray) {
        
        _imageArray = @[@"my_list_myorder_icon", @"my_list_buying_icon", @"my_list_favourite_icon", @"my_list_history_icon", @"my_list_tuan_icon", @"my_list_share_icon", @"my_list_setting_icon"];
    }
    
    return _imageArray;
}

#pragma mark - ====================== 视图生命周期 ==========================

//视图即将出现
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //判断登录状态显示不同的UI界面
    if ([LOGINSTATUS isEqualToString:@"login"]) {
        
        [self.mainView showLoginStatusView];
        
        //给头部视图添加手势
        UITapGestureRecognizer *tapGrsture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userInfoSetting:)];
        
        [self.mainView.headerView addGestureRecognizer:tapGrsture];
        
        // 把UIBarButtonItem放到当前页面的导航栏上面
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(showMessage:) image:@"my_nav_bar_message_icon" highImage:@"my_nav_bar_message_icon"];
        
    }else{
        
        [self.mainView showUnloginStatusView];
        
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建视图
    [self createView];
}

#pragma mark - ====================== 创建视图 ==============================

/**
 *  创建视图
 */
-(void)createView{
    //设置标题
    self.navigationItem.title = @"我的";
    
    //调用创建NavigationBar的按钮的方法
    [self setupNavigationBar];
    
    //实例化CFMineTableView对象
    _mainView = [[CFMineTableView alloc] initWithFrame:self.view.bounds];
    
    self.view = _mainView;
    
    self.mainView.mainTableView.delegate = self;
    self.mainView.mainTableView.dataSource = self;
    
    __weak typeof(self)weakSelf = self;
    _mainView.headerView.sendBlock = ^(id sender){
        
        [weakSelf clickAction:sender];
    };
}
/**
 *  创建NavigationBar的左按钮
 */
-(void)setupNavigationBar{
    
    //把UIBarButtonItem放到当前页面的导航栏上面
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(scanSomething:) image:@"my_nav_bar_scanning_icon" highImage:@"my_nav_bar_scanning_icon"];
    
}

#pragma mark - ====================== 各类触发方法 ==========================

-(void)userInfoSetting:(UITapGestureRecognizer *)tap{


    CFPesonnalInfoController *pensonnalVc = [CFPesonnalInfoController new];
    
    [self.navigationController pushViewController:pensonnalVc animated:YES];

}

/**
 *  查看消息
 *
 *  @param btn 按钮
 */
-(void)showMessage:(UIButton *)btn{

}
/**
 *  扫描二维码
 *
 *  @param btn 按钮
 */
-(void)scanSomething:(UIButton *)btn
{
    CFScanSomeThingViewController * rt = [[CFScanSomeThingViewController alloc]init];
    UINavigationController * scanNavigation = [[UINavigationController alloc]initWithRootViewController:rt];
    [self presentViewController:scanNavigation animated:YES completion:^{
        
    }];}

//点击事件
- (void)clickAction:(UIView *)sender{
    
    CFLoginController *loginVC = [[CFLoginController alloc] init];
    
    switch (sender.tag){
        case 1000:{//头像按钮
            
            [self.navigationController pushViewController:loginVC animated:YES];
            
        }
            break;
        case 1001:{//登录按钮
            
            [self.navigationController pushViewController:loginVC animated:YES];
            
        }
            break;
        case 1002:{//积分按钮
            
            //未登录状态下，跳转至登录页面
            if(![LOGINSTATUS isEqualToString:@"login"]){
                
                [self.navigationController pushViewController:loginVC animated:YES];
            }else{
                
                CFPointsController *pointVc = [[CFPointsController alloc] init];
                
                [self.navigationController pushViewController:pointVc animated:YES];
            
            }
        }
            break;
        case 1003:{//现金券按钮
            //未登录状态下，跳转至登录页面
            if(![LOGINSTATUS isEqualToString:@"login"]){
                [self.navigationController pushViewController:loginVC animated:YES];
            }
        }
        default:
            break;
    }
 
}

#pragma mark - ====================== 协议方法 ==========================

#pragma mark - UITableView代理方法

//每组的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0) {
        
        return 2;
        
    }else if(section == 1){
        
        return 3;
        
    }else {
        
        return 2;
        
    }
}

//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    //设置cell的辅助view的type
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if(indexPath.section == 0){
        //设置cell的imageView的图片
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.imageArray[indexPath.row]]];
        //设置Cell的TextLabel的文字
        cell.textLabel.text = [NSString stringWithFormat:@"%@", self.dataSource[indexPath.row]];
    }else if(indexPath.section == 1){
        //设置cell的imageView的图片
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.imageArray[indexPath.row+2]]];
        //设置Cell的TextLabel的文字
        cell.textLabel.text = [NSString stringWithFormat:@"%@", self.dataSource[indexPath.row+2]];
        
    }else if(indexPath.section == 2){
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.imageArray[indexPath.row+5]]];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", self.dataSource[indexPath.row+5]];
    }
    return cell;
}
//尾部视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, IphoneWidth, 10)];
    footView.backgroundColor = [UIColor colorWithWhite:0.952 alpha:1.000];
    return footView;
}
//返回组尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

//选择cell之后跳转各个页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //当cell为分享要出发的朋友的时候，
    if (indexPath.section == 2 && indexPath.row == 0) {
        //调用分享要弹出的画面
    
//        
//        [UIView animateWithDuration:0.5 animations:^{
//
//        CFShareViewController *shareVc = [CFShareViewController new];
//        CFSocialShareView *shareView = [CFSocialShareView new];
//        shareVc.view.height = self.mainView.bounds.size.height*0.4;
//        shareVc.view.width = self.mainView.bounds.size.width;
//        shareView.contentController = shareVc;
//        [shareView show];
//             }];
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:@"55c4542d67e58e61f60001ba"
                                          shareText:@"爱旅行,爱MEI游!-下载MEI游记APP,带你欢乐全中国"
                                         shareImage:[UIImage imageNamed:@"share"]
                                    shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,nil]
                                           delegate:nil];
 
    }else if (indexPath.section == 2 && indexPath.row == 1){
        //常用设置
        CFSettingController *settingVC = [[CFSettingController alloc] init];
        [self.navigationController pushViewController:settingVC animated:YES];
    }else if(indexPath.section == 1 && indexPath.row == 1){
        
        CFListHistoryController *history = [[CFListHistoryController alloc] init];
        
        [self.navigationController pushViewController:history animated:YES];

    }else if(indexPath.section == 1 && indexPath.row == 0){
    
        CFCollectionController *collectionVc = [[CFCollectionController alloc] init];
        
        [self.navigationController pushViewController:collectionVc animated:YES];
    
    }else if(indexPath.section == 0 && indexPath.row == 0){
    
        CFMyOrderController *myOrderVC = [CFMyOrderController new];
        
        [self.navigationController pushViewController:myOrderVC animated:YES];
    
    }
    
}





@end

