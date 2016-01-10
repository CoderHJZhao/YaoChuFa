//
//  CFPointsController.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFPointsController.h"
#import "CFPointCell.h"
#import "CFPointsModel.h"
#import "CFPointDetailModel.h"
#import "CFPointCell1.h"

@interface CFPointsController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSString  *_userID;//用户Id
}
@property (nonatomic, strong)UITableView *pointTableView;
@property (nonatomic, strong)NSMutableArray *pointArray;

@end

@implementation CFPointsController

-(void)loadView{
    
    [super loadView];
    [self createView];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    self.navigationController.toolbarHidden = YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self pointRequest];

}

#pragma mark - ====================== 视图创建 ==========================

-(void)createView{

    self.title = @"我的积分";
    
    _pointTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
   //设置内嵌高度
    _pointTableView.contentInset = UIEdgeInsetsMake(0, 0, 80, 0);
    self.pointTableView.rowHeight = 60;
    self.pointTableView.delegate = self;
    self.pointTableView.dataSource = self;
    //注册cell
    [self.pointTableView registerNib:[UINib nibWithNibName:@"CFPointCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [self.pointTableView registerNib:[UINib nibWithNibName:@"CFPointCell1" bundle:nil] forCellReuseIdentifier:@"cell1" ];
    
    [self.view addSubview:self.pointTableView];
    
    [self setFooterView];
    [self setToolBar];
}

-(void)setFooterView{
    
    UILabel *footerView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, IphoneWidth, 30)];
    
    //设置文字
    footerView.text = @"已经全部加载完成";
    //设置居中样式
    footerView.textAlignment = NSTextAlignmentCenter;
    //设置字体大小
    footerView.font = [UIFont systemFontOfSize:13];
    //字体颜色
    footerView.textColor = [UIColor lightGrayColor];
    //设置为tableView的尾部
    self.pointTableView.tableFooterView = footerView;
}


-(void)setToolBar{
    
    self.navigationController.toolbarHidden = NO;

    UIBarButtonItem *bbi = [[UIBarButtonItem alloc]initWithTitle:@"兑换" style:UIBarButtonItemStylePlain target:self action:@selector(exchanged:)];
       // 调用Item位置
    UIBarButtonItem *flexibleBBI = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *flexibleBBI2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    // 这里必须是数组
    self.toolbarItems = @[flexibleBBI, bbi, flexibleBBI2];

}

#pragma mark - ====================== 数据请求 ==========================

-(void)pointRequest{
//   
// CFUserInformationModel *userInfoModel  = [[[FMDBManager sharedInstace] selectModelArrayInDatabase:@"CFUserInformationModel"] objectAtIndex:0];
//
//    _userID = userInfoModel.userId;
//    
//    NSDictionary *params =
//  @{@"system":@"ios", @"channel":@"AppStore", @"securityKey":@"YKR0EfQ85rTZaQ27Iij2T1qHjOH3U%252Fh6lIPkAOgeVQ0Y2j9eWMCzq73EXcFTdksc7xVTD6LOvZIvWKq%252F%252FPTD%252F%252BAU4TSgJgYyTCk3dzOgtoXGSAuSIqSahN907VfR4noAtNrLfImpmULLrCe2g0mtuw%253D%253D", @"version":@"4.2.6", @"total":@"0", @"machineCode":@"E2294D1A-3DE7-4A9B-8BE6-AE67C0A594BE", @"pageIndex":@"1", @"pageSize":@"10", @"userId":@"2649026"};
//   
    
   // ?system=ios&pageSize=10&userId=2649026&channel=AppStore&securityKey=YKR0EfQ85rTZaQ27Iij2T1qHjOH3U%252Fh6lIPkAOgeVQ0Y2j9eWMCzq73EXcFTdksc7xVTD6LOvZIvWKq%252F%252FPTD%252F%252BAU4TSgJgYyTCk3dzOgtoXGSAuSIqSahN907VfR4noAtNrLfImpmULLrCe2g0mtuw%253D%253D&version=4.2.6&total=0&machineCode=E2294D1A-3DE7-4A9B-8BE6-AE67C0A594BE&pageIndex=1
    
  //  NSString *params =  @"system=ios&pageSize=10&userId=2649026&channel=AppStore&securityKey=YKR0EfQ85rTZaQ27Iij2T7KGEnW4wiq2iD3mvD%252Bu07OLjlmjHjJGDqaFOlWuO3QbkgeJXaZ%252B80QSIL0%252BMSjSAjBkFyTGCpLBtiY53rRhbaoVEX1UaBPxG2NqsIy388AFsoxWDJabo15gYwrpH9OHWQ%253D%253D&version=4.2.6&total=0&machineCode=E2294D1A-3DE7-4A9B-8BE6-AE67C0A594BE&pageIndex=1";
    

    
    [CFNetWork networkMinePointsRequest:nil whileSuccess:^(id responseObject) {
        
        self.pointArray = responseObject;
        
      [self.pointTableView reloadData];
      
    } orFail:^(id responseObject) {
        
    }];
}


#pragma mark - ====================== 点击事件 ==========================

-(void)exchanged:(UIBarButtonItem *)bbi{


}

#pragma mark - ====================== 协议代理方法 ==========================

#pragma mark - UITableView代理方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 1 ){
    
        return  [[self.pointArray[0] valueForKey:@"credits"] count];
    }
    
    return 1;
   
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0 ) {
        
        CFPointCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        
        cell.reminderLabel.text = [NSString stringWithFormat:@"剩余积分：%@", [self.pointArray[0] valueForKey:@"balance"]];
        cell.usedLabel.text = [NSString stringWithFormat:@"已使用：%@", [self.pointArray[0] valueForKey:@"used"]];
        return cell;
                                   
    }else {
    
        CFPointCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
        cell.timeLabel.text = [[self.pointArray[0] valueForKey:@"credits"][indexPath.row] valueForKey:@"date"];
    
        return cell;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 5;
}
@end
