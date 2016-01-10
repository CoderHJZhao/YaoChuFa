//
//  CFListHistoryController.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/11.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFListHistoryController.h"
#import "CFChoosenUtility.h"
#import "CFThirdTableViewCell.h"
#import "CFProductModel.h"
#import "CFListHistoryView.h"

@interface CFListHistoryController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CFListHistoryView *listHistoryView;
@end

@implementation CFListHistoryController

-(void)viewWillAppear:(BOOL)animated{


    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

-(void)loadView{
    
    [super loadView];

    [self createView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
   

}

-(void)createView{
    
    self.title = @"浏览历史";
    
    if(![[CFChoosenUtility sharedChoosenUtility] getAllChoosen].count == 0){
    
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        //注册cell
        [_tableView registerNib:[UINib nibWithNibName:@"CFThirdTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        self.tableView.rowHeight = 100;
        
        //隐藏多余的分割线
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor clearColor];
        [self.tableView setTableFooterView:view];
        [self.tableView setTableHeaderView:view];
        
        [self.view addSubview:self.tableView];
        
    
    }else{
        
    
        //从xib加载登录视图
        _listHistoryView = [[[NSBundle mainBundle] loadNibNamed:@"CFListHistoryView" owner:self options:nil] objectAtIndex:0];
        self.view = _listHistoryView;
        
        //设置点击事件的block
        __weak typeof(self)weakSelf = self;
        _listHistoryView.sendBlock = ^(id sender){
            
            [weakSelf clickAction:sender];
        };
    
    }

}

#pragma mark - ====================== 点击事件 ==========================

-(void)clickAction:(UIView *)sender{
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [self.navigationController popViewControllerAnimated:NO];
        UITabBarController *tabVC = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        tabVC.selectedIndex = 1;
    }];
    
    
}

#pragma mark - UITableView代理方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[CFChoosenUtility sharedChoosenUtility] getAllChoosen].count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CFThirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    //取商品
    CFProductModel *productModel = [[CFChoosenUtility sharedChoosenUtility] getAllChoosen][indexPath.row];
    
    //赋值
    [cell fillItemWithModel:productModel];
    
    return cell;
}

@end
