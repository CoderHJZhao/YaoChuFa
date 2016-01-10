//
//  CFCollectionController.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/11.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFCollectionController.h"
#import "CFCollectionView.h"
#import "CFChoosenUtility.h"
#import "CFProductModel.h"
#import "CFThirdTableViewCell.h"
#import "MyButton.h"

@interface CFCollectionController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *collectTableView;
@property (nonatomic, strong)CFCollectionView *collectionView;

@end

@implementation CFCollectionController

-(void)viewWillAppear:(BOOL)animated{
    
    
    [super viewWillAppear:animated];
    
    [self.collectTableView reloadData];
}

-(void)loadView{
    
    [super loadView];
    
    [self createView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)createView{
    
    self.title = @"收藏";
    
    if (![[CFChoosenUtility sharedChoosenUtility] getAllChoosen].count == 0) {
        
     
        _collectTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        //注册cell
        [_collectTableView registerNib:[UINib nibWithNibName:@"CFThirdTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        self.collectTableView.delegate = self;
        self.collectTableView.dataSource = self;
        
        self.collectTableView.rowHeight = 100;
        
        //隐藏多余的分割线
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor clearColor];
        [self.collectTableView setTableFooterView:view];
        [self.collectTableView setTableHeaderView:view];
        
        [self.view addSubview:self.collectTableView];
    }
    
else{
        
        
        //从xib加载登录视图
        _collectionView = [[[NSBundle mainBundle] loadNibNamed:@"CFCollectionView" owner:self options:nil] objectAtIndex:0];
        self.view = _collectionView;
        
        //设置点击事件的block
        __weak typeof(self)weakSelf = self;
        _collectionView.sendBlock = ^(id sender){
            
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
