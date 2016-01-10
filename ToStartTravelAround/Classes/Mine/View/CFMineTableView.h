//
//  CFMineTableView.h
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/7/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFParentView.h"
#import "CFHeaderView.h"
#import "CFExpandHeader.h"

@interface CFMineTableView : CFParentView
@property (nonatomic, strong) UITableView *mainTableView;//tableView
@property (nonatomic, strong) CFHeaderView *headerView;//头部视图
@property (nonatomic, strong) CFExpandHeader *header;


/**
 *  登录状态下的View
 */
-(void)showLoginStatusView;
/**
 *  未登录状态下
 */
-(void)showUnloginStatusView;
@end
