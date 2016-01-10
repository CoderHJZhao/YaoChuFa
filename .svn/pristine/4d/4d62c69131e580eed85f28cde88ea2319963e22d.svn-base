//
//  CFSearchController.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/6.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFSearchController.h"
#import "CFSearchView.h"
#import "CFOwnSearchBar.h"
@interface CFSearchController ()<UISearchBarDelegate>


@property (nonatomic, strong)CFSearchView *searchView;
@property (nonatomic, strong) CFOwnSearchBar *searchBar;
@end

@implementation CFSearchController

#pragma mark - ====================== 视图生命周期 ==========================
/**
 *  加载View
 */
-(void)loadView{
    
    [super loadView];
    [self createView];
}

//view出现的时候，让搜索框成为第一响应者
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];

    [self.searchBar becomeFirstResponder];

}

//当View消失的时候，让搜索框失去第一响应
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.searchBar resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
#pragma mark - ====================== 创建视图 ==========================
/**
 *懒加载UISearchBar
 *  @return 返回UISearchBar
 */
- (CFOwnSearchBar *)searchBar
{
    if (_searchBar == nil) {
        _searchBar = [[CFOwnSearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        _searchBar.delegate = self;
    }
    return _searchBar;
}

//创建视图
-(void)createView{

    //从xib加载登录视图
    _searchView = [[[NSBundle mainBundle] loadNibNamed:@"CFSearchView" owner:self options:nil] objectAtIndex:0];
    self.view = _searchView;

    [self createSearchBar];
}
/**
 *  自定义SearchBar
 */
-(void)createSearchBar{
    
    //将搜索框设置为导航栏的titleView
    self.navigationItem.titleView = self.searchBar;

}

#pragma mark - ====================== 代理及协议方法 ==========================

#pragma mark - UISearchBar代理方法

//开始编辑的时候，取消按钮显示
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{

    searchBar.showsCancelButton = YES;

}

//点击搜索框的时候，隐藏取消按钮
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{

    searchBar.showsCancelButton = NO;
}

@end
