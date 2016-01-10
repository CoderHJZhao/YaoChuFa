//
//  CFDropDownView.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/8.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFDropDownView.h"
#import "CFNetWork.h"
#import "CFAreaLocationModel.h"
@interface CFDropDownView()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_cityDataArr;
    NSMutableArray *_subTableViewArr;
}
@property(nonatomic,strong)CFAreaLocationModel *selectModel;
@end
@implementation CFDropDownView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//    self = [[[NSBundle mainBundle]loadNibNamed:@"CFDropDownView" owner:nil options:nil]lastObject];
        [self createView];
    }
    return self;
}
- (void)createView
{
    _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, IphoneWidth/2, selfHeight) style:UITableViewStylePlain];
    _subTableView = [[UITableView alloc]initWithFrame:CGRectMake(IphoneWidth/2, 0, IphoneWidth/2, selfHeight) style:UITableViewStylePlain];
    
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _subTableView.dataSource = self;
    _subTableView.delegate = self;
    
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _subTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self addSubview:_mainTableView];
    [self addSubview:_subTableView];
    [self.mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.subTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self areaDataRequest];
}
- (void)areaDataRequest
{

    NSMutableDictionary *dic = [NSMutableDictionary new];
//    http://appapi.yaochufa.com/Theme/GetSceniceAndTagsByCity?cityName=%E6%B7%B1%E5%9C%B3&system=ios&version=4.2.6&channel=AppStore
    dic[@"cityName"] = @"深圳";
    dic[@"system"] = @"ios";
    dic[@"version"] = @"4.2.6";
    dic[@"channel"] = @"AppStore";
    [CFNetWork networkAreaLocationRequest:dic whileSuccess:^(id responseObject) {
        _cityDataArr= responseObject;
        
        [self.mainTableView reloadData];
         [self.subTableView reloadData];
    } orFail:^(id responseObject) {
        
    }];
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.mainTableView) {
        return _cityDataArr.count;
    }
    else{
        return self.selectModel.scenics.count;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.textColor = CFColor(55, 55, 55);
        CFAreaLocationModel *areaModel = _cityDataArr[indexPath.row];
    if (tableView == self.mainTableView) {

        cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_leftpart"]];
        cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_left_selected"]];
        cell.textLabel.text = areaModel.city;
        cell.textLabel.backgroundColor = [UIColor clearColor];
        if (areaModel.scenics.count) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
//

        

  
    }
    if (tableView == self.subTableView) {

       
        
        cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_rightpart"]];
        cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_right_selected"]];
        cell.textLabel.text = self.selectModel.scenics[indexPath.row][@"scenic"];
        cell.textLabel.backgroundColor = [UIColor clearColor];

    }
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.mainTableView) {
         self.selectModel = _cityDataArr[indexPath.row];
        [self.subTableView reloadData];
    }
   

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;

}
@end
