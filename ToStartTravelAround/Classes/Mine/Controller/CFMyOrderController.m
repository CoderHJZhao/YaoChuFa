//
//  CFMyOrderController.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFMyOrderController.h"
#import "CFMyOrderView.h"
@interface CFMyOrderController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView *myScrollView;//滚动视图
@property (nonatomic, strong) UIButton *button;//按钮
@property (nonatomic, strong) UIView *sliderView;//滑动的View
@property (nonatomic, strong) CFMyOrderView *myOrderView;//视图

@end

@implementation CFMyOrderController

#pragma mark - ====================== 视图生命周期 ==========================

-(void)loadView{
    
    [super loadView];
    
    self.title = @"我的订单";
}

- (void)viewDidLoad {
 
    [super viewDidLoad];
   
    [self createView];

}

#pragma mark - ====================== 创建视图 ==========================

-(void)createView{

    //实例化一个UIScrollView
    self.myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.myScrollView.delegate = self;
    //滑动区域为三个屏幕的范围
    self.myScrollView.contentSize = CGSizeMake(self.view.frame.size.width *3, 0);
    self.myScrollView.bounces = NO;
    //分页滑动
    self.myScrollView.pagingEnabled = YES;

    [self.view addSubview:self.myScrollView];
    
    //设置按钮的背景View
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, IphoneWidth, 40)];
    backgroundView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backgroundView];
    //定义Button的宽度
    CGFloat btnWidth = IphoneWidth / 3;
    for (int i = 0; i<3; i++) {
        
        NSArray *titles = @[@"全部", @"未付款", @"已付款"];
        
    _button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    _button.frame = CGRectMake(i*btnWidth, 0, btnWidth, 38);
    self.button.tag = 10+i;
    [_button setTitle:titles[i] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(viewWillChange:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:_button];
    }
    
    _sliderView = [[UIView alloc] initWithFrame:CGRectMake(btnWidth/4, 38, btnWidth/2, 2)];
    
    _sliderView.backgroundColor = [UIColor orangeColor];
    
    [backgroundView addSubview:self.sliderView];

    for (NSInteger i = 0; i < 3; i++) {
  
        _myOrderView =  [[[NSBundle mainBundle] loadNibNamed:@"CFMyOrderView" owner:self options:nil] objectAtIndex:0];
        
        _myOrderView.frame = CGRectMake(self.view.bounds.size.width*i, 40, self.view.bounds.size.width, self.view.bounds.size.height- 40);

        [self.myScrollView addSubview:self.myOrderView];
    }
}

#pragma mark - ====================== 点击事件 ==========================

-(void)viewWillChange:(UIButton*)btn{
    
    if (btn.tag == 11) {//未付款按钮
        [UIView animateWithDuration:0.25 animations:^{
            //改变默认偏移量
            self.myScrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
            self.sliderView.frame = CGRectMake(self.button.bounds.size.width +self.button.bounds.size.width/4, 38, self.button.bounds.size.width/2, 2);
        }];
    }else if (btn.tag == 12){//已付款按钮
        
        [UIView animateWithDuration:0.25 animations:^{
            //改变默认偏移量
            self.myScrollView.contentOffset = CGPointMake(self.view.frame.size.width*2, 0);
            
            self.sliderView.frame = CGRectMake(self.button.bounds.size.width*2 +self.button.bounds.size.width/4, 38, self.button.bounds.size.width/2, 2);
        }];
    }else if(btn.tag == 10){//全部按钮
        [UIView animateWithDuration:0.25 animations:^{
            //改变默认偏移量
            self.myScrollView.contentOffset = CGPointMake(0, 0);
            self.sliderView.frame = CGRectMake(self.button.bounds.size.width/4, 38, self.button.bounds.size.width/2, 2);
        }];
    }
}

#pragma mark - ====================== 协议代理方法 ==========================

#pragma mark - UIScrollerViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.x == self.view.frame.size.width * 2) {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.sliderView.frame = CGRectMake(self.button.bounds.size.width*2 +self.button.bounds.size.width/4, 38, self.button.bounds.size.width/2, 2);
        }];
        
    }else if (scrollView.contentOffset.x == self.view.frame.size.width){
        
        [UIView animateWithDuration:0.25 animations:^{
            self.sliderView.frame = CGRectMake(self.button.bounds.size.width +self.button.bounds.size.width/4, 38, self.button.bounds.size.width/2, 2);
        }];
        
    }else if(scrollView.contentOffset.x == 0){
        
        [UIView animateWithDuration:0.25 animations:^{
            //改变默认偏移量
            self.sliderView.frame = CGRectMake(self.button.bounds.size.width/4, 38, self.button.bounds.size.width/2, 2);
        }];
    }
}

@end
