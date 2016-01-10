//
//  CFPesonnalInfoController.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFPesonnalInfoController.h"
#import "CFUserInformationModel.h"
#import "CFUserGroupModel.h"
#import "CFInfoModel.h"

@interface CFPesonnalInfoController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *infoTableView;//个人信息设置
@property (nonatomic, strong)NSMutableArray *dataSource;//信息源
@property (nonatomic, strong) CFUserInformationModel *userInfoModel;
@end

@implementation CFPesonnalInfoController


#pragma mark - ====================== 视图生命周期 ==========================

-(void)loadView{
    [super loadView];
    
    [self createView];

}

- (void)viewDidLoad {
    [super viewDidLoad];
   
     _userInfoModel = [[[FMDBManager sharedInstace] selectModelArrayInDatabase:@"CFUserInformationModel"] objectAtIndex:0];

    [self addGroup];

}
#pragma mark - ====================== 创建视图 ==========================


-(void)createView{
    
    self.title = @"修改资料";
   
    _infoTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.infoTableView.delegate = self;
    self.infoTableView.dataSource = self;
    
    self.infoTableView.sectionFooterHeight = 5;
    self.infoTableView.sectionHeaderHeight = 5;
    //注册cell
    [_infoTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.infoTableView];

}

#pragma mark - ====================== 数据相关 ==========================

-(NSMutableArray *)dataSource{

    if (!_dataSource) {
        
        _dataSource = [NSMutableArray new];
    }

    return _dataSource;
}


-(void)addGroup{
    
    [self addGroupOne];
    [self addGroupTwo];
    [self addGroupThree];
    
}

-(void)addGroupOne{
    
    CFUserGroupModel *group = [CFUserGroupModel new];
    CFInfoModel *row1 = [CFInfoModel new];
    row1.cellName = [NSString stringWithFormat:@"手机：%@", self.userInfoModel.phone];
    
    CFInfoModel *row2 = [CFInfoModel new];
    row2.cellName = [NSString stringWithFormat:@"姓名：%@", self.userInfoModel.userName];
    
    CFInfoModel *row3 = [CFInfoModel new];
    row3.cellName = @"邮箱：";
    
    group.infoArray = @[row1,row2, row3];
    
    [self.dataSource addObject:group];
    
}

-(void)addGroupTwo{
    
    CFUserGroupModel *group = [CFUserGroupModel new];
    CFInfoModel *row1 = [CFInfoModel new];
    row1.cellName = [NSString stringWithFormat:@"性别：%@", self.userInfoModel.sex];
    
    CFInfoModel *row2 = [CFInfoModel new];
   
    row2.cellName = [NSString stringWithFormat:@"姓名：%@",   self.userInfoModel.birthday];
    
   
    CFInfoModel *row3 = [CFInfoModel new];
    row3.cellName = [NSString stringWithFormat:@"常居地：%@",    self.userInfoModel.address];
    
    group.infoArray = @[row1,row2, row3];
    
    [self.dataSource addObject:group];
}


-(void)addGroupThree{
    
    CFUserGroupModel *group = [CFUserGroupModel new];
    CFInfoModel *row1 = [CFInfoModel new];
    row1.cellName = @"修改密码";
    row1.leftPic = @"Lock";
    group.infoArray = @[row1];
    [self.dataSource addObject:group];
}

#pragma mark - ====================== 协议代理方法 ==========================

#pragma mark - UITableView代理方法


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataSource.count;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    CFUserGroupModel *group = self.dataSource[section];
    return group.infoArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    //设置cell的辅助view的type
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
  
    CFUserGroupModel *group = self.dataSource[indexPath.section];
    CFInfoModel *model = group.infoArray[indexPath.row];
    cell.textLabel.text = model.cellName;
    
    if (indexPath.section == 2) {
        
        cell.imageView.image= [UIImage imageNamed:model.leftPic];
    }

    return cell;
}
@end
