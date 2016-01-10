//
//  CFVSelectCityView.h
//  ToStartTravelAround
//
//  Created by mac on 15/8/1.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFParentView.h"
#import "BATableView.h"//引入自定义索引的第三方库
@interface CFVSelectCityView : CFParentView

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *searchView;

@end
