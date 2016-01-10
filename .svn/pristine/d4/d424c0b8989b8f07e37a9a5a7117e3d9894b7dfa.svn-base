//
//  CFSearchResultViewController.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/7.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFSearchResultViewController.h"
#import "CFHeader.h"
@interface CFSearchResultViewController ()
@property (nonatomic, strong) NSArray *cities;
@property (nonatomic, strong) NSMutableArray *resultCities;
@end

@implementation CFSearchResultViewController
- (NSArray *)cities
{
    if (!_cities) {
        
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"cityList.plist" ofType:nil];
        _cities = [[NSArray alloc]initWithContentsOfFile:filePath];
    }
    return _cities;
}
- (void)setSearchText:(NSString *)searchText
{
    _searchText = [searchText copy];
    self.resultCities = [NSMutableArray new];
    for (NSArray *arr in self.cities) {
        for (NSDictionary *dic in arr) {
            if ([dic[@"cityNameAbbr"] rangeOfString:searchText options:NSCaseInsensitiveSearch].location!=NSNotFound||[dic[@"pinYinName"] rangeOfString:searchText options:NSCaseInsensitiveSearch].location!=NSNotFound) {
                [self.resultCities addObject:dic];
            }
        }
    }
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
   }



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return _resultCities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    static NSString *ID = @"city";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    NSDictionary *resultDic = _resultCities[indexPath.row];
    cell.textLabel.text = resultDic[@"cityNameAbbr"];
    
    return cell;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"共有%ld个搜索结果", self.resultCities.count];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSUserDefaults standardUserDefaults]setValue:_resultCities[indexPath.row][@"cityCode"] forKey:@"cityCode"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    //通知中心
    [[NSNotificationCenter defaultCenter]postNotificationName:CFCityDidChangeNotification object:nil userInfo:@{CFSelectCityDic:_resultCities[indexPath.row]}];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
