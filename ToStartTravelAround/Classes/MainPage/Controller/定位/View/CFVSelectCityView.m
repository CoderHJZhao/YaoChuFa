//
//  CFVSelectCityView.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/1.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFVSelectCityView.h"
#import "CFCurrentLocationTableViewCell.h"
#import "CFHotCityTableViewCell.h"
#import "CFHistoryCityViewCell.h"
@implementation CFVSelectCityView

- (void)createView
{
    //实例化第三方索引,自带TableView

    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, selfWidth, selfHeight-44) style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CFCurrentLocationTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell_1"];
     [self.tableView registerClass:[CFHotCityTableViewCell class] forCellReuseIdentifier:@"cell_2"];
    [self.tableView registerClass:[CFHistoryCityViewCell class] forCellReuseIdentifier:@"cell_3"];
    [self addSubview:_tableView];
    
    //添加searchBar的View
    _searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, selfWidth, 44)];
    _searchView.backgroundColor = CFColor(241, 242, 245);
    [self addSubview:_searchView];
    

}

@end
