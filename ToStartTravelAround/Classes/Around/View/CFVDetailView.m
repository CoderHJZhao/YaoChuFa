//
//  CFVDetailView.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFVDetailView.h"

@implementation CFVDetailView

- (void)createView
{
    self.tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CFDetailFirstTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell_1"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CFDetailSecondTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell_2"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CFStarTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell_3"];
    [self addSubview:self.tableView];

}
@end
