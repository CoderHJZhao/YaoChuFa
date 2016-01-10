//
//  CFVMainPageView.m
//  ToStartTravelAround
//
//  Created by mac on 15/7/31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFVMainPageView.h"
#import "CFSecondViewCell.h"
@implementation CFVMainPageView

- (instancetype)init
{
    if (self = [super init]) {
        [self createView];
    }
    return self;
}
- (void)createView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight-49-64) style:UITableViewStylePlain];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView registerNib:[UINib nibWithNibName:@"CFFirstTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell_1"];
     [_tableView registerClass:[CFSecondViewCell class] forCellReuseIdentifier:@"cell_2"];
    [_tableView registerNib:[UINib nibWithNibName:@"CFThirdTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell_3"];
    [self addSubview:_tableView];
    
}
@end
