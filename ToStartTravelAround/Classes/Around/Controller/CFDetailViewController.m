//
//  CFDetailViewController.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFDetailViewController.h"
#import "CFVDetailView.h"
#import "CFNetWork.h"
#import "CFDetailScrollView.h"
#import "CFDetailPageModel.h"
#import "UIButton+Extension.h"
#import "Masonry.h"
#import "CFDetailFirstTableViewCell.h"
#import "CFDetailSecondTableViewCell.h"
#import "CFStarTableViewCell.h"
#import "CFLoginController.h"
#import "CFMapViewController.h"
#import "SVProgressHUD.h"
#import <Social/Social.h>
@interface CFDetailViewController() <UITableViewDataSource,UITableViewDelegate>
{
    CFDetailPageModel *_detailDataModel;
    BOOL               _isOpen;
    NSInteger          _selectedIndex;
}
@property(nonatomic, strong)CFVDetailView *detailView;
@property(nonatomic, strong)CFDetailScrollViewView *detailScrollView;
@end
@implementation CFDetailViewController
- (void)viewDidLoad
{
    _isOpen = NO;
    [super viewDidLoad];
    [self createView];
    [self createRightNavBtn];
    [self detailDataRequest];
}
#pragma mark =========================视图相关=============================
- (void)createView
{
    self.title = @"详情";
    _detailView = [[CFVDetailView alloc]initWithFrame:self.view.bounds];
    self.view = _detailView;
    _detailView.tableView.delegate = self;
    _detailView.tableView.dataSource = self;
//    _detailView.tableView.rowHeight = 66;
//    _detailView.tableView.estimatedRowHeight = 44;
    _detailScrollView = [[CFDetailScrollViewView alloc]initWithFrame:CGRectMake(0, 0, IphoneWidth, 150)];
    _detailView.tableView.tableHeaderView = _detailScrollView;

    
    
}
- (void)createRightNavBtn
{


    UIBarButtonItem *shareBBI = [UIBarButtonItem itemWithTarget:self action:@selector(shareClicked:) image:@"detail_nav_bar_share_icon" highImage:@"detail_nav_bar_share_icon"];
    
    UIBarButtonItem *collectBBI = [UIBarButtonItem itemWithTarget:self action:@selector(collectClicked) image:@"detail_nav_bar_mark_icon" highImage:@"detail_nav_bar_mark_icon"];
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    bbi.width = 20;
    self.navigationItem.rightBarButtonItems = @[shareBBI,bbi,collectBBI];
    
}
#pragma mark =========================调用方法=============================
//系统自带的分型功能
- (void)shareClicked:(UIBarButtonItem *)bbi
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]) {
        
    }
    SLComposeViewController *composeVc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
    [composeVc setInitialText:@"爱出发,爱旅行,MEI丽出行,畅游神州!-MEI游记"];
    [composeVc addImage:[UIImage imageNamed:@"share"]];
    [self presentViewController:composeVc animated:YES completion:nil];
    composeVc.completionHandler = ^(SLComposeViewControllerResult result)
    {
        if (result == SLComposeViewControllerResultCancelled) {
            [SVProgressHUD showErrorWithStatus:@"发送失败"];
        }
        else
        {
            [SVProgressHUD showSuccessWithStatus:@"发送成功"];
        }
    };

}
//收藏
- (void)collectClicked
{
    if (![LOGINSTATUS isEqualToString:@"login"]) {
        CFLoginController *loginView = [[CFLoginController alloc]init];
        [self.navigationController pushViewController:loginView animated:YES];
    }
    
}
#pragma mark =========================数据请求=============================
- (void)detailDataRequest
{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    dic[@"machineCode"]= @"0316B31D-CEAE-4C94-A3F8-F5BB581B0CE3";
    dic[@"productId"] = _productId;
    dic[@"system"] = @"ios";
    dic[@"version"] = @"4.2.6";
    dic[@"channel"] = @"AppStore";
    [CFNetWork networkAroundDetailPageRequest:dic whileSuccess:^(CFDetailPageModel *responseObject) {
        _detailDataModel = responseObject;
        [_detailScrollView reloadHeaderView:responseObject.imageList];
        [_detailView.tableView reloadData];
    } orFail:^(id responseObject) {
        
    }];
}
#pragma mark =========================代理方法=============================
#pragma mark - TableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0&&indexPath.section==0) {
        return 100;
    }
    else if (indexPath.row==1&&indexPath.section == 0&&_isOpen == YES) {
            return 70;
        }
    else if (indexPath.row==1&&indexPath.section == 0&&_isOpen == NO) {
        return 35;
    }
    else if ((indexPath.row==2&&indexPath.section == 0)||(indexPath.row == 1&&indexPath.section == 1)) {
        return 35;
    }
   return 35;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0&&indexPath.section == 0) {
         CFDetailFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_1" forIndexPath:indexPath];
        [cell fillItemWithModel:_detailDataModel];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row == 1&&indexPath.section == 0) {
        CFDetailSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_2"];
        [cell fillItemWithModel:_detailDataModel.offerInfo];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
    if (indexPath.row == 2&&indexPath.section == 0) {
        CFStarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_3"];
        [cell fillItemWithModel:_detailDataModel];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    if (indexPath.row==0&&indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imageView.image = [UIImage imageNamed:@"details_location_iocn"];
        cell.textLabel.text = @"详细地址:";
        cell.textLabel.font = [UIFont boldSystemFontOfSize:17];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    if (indexPath.row==1&&indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = _detailDataModel.address;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        
        return cell;
    }

    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 1&&indexPath.section == 0) {
        _selectedIndex = 1;
//        _isOpen = !_isOpen;
//        [tableView beginUpdates];
        _isOpen = !_isOpen;
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        [tableView endUpdates];
    }
    else if(indexPath.row == 0&&indexPath.section==1)
    {
        CFMapViewController *mapView = [[CFMapViewController alloc]init];
        [self .navigationController pushViewController:mapView animated:YES];
    }
    
}
@end
