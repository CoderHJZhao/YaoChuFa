//
//  CFBannerView.h
//  ToStartTravelAround
//
//  Created by mac on 15/7/31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFParentView.h"

@interface CFBannerView : CFParentView
@property(nonatomic,strong)UIScrollView *mainPageBannerView;
@property(nonatomic,strong)NSTimer *timer;


// 重载头部视图
- (void)reloadHeaderView:(NSMutableArray *)modelArr;

@end
