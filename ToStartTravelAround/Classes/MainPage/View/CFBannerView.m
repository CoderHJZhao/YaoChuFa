//
//  CFBannerView.m
//  ToStartTravelAround
//
//  Created by mac on 15/7/31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFBannerView.h"
#import "UIImageView+WebCache.h"
@interface CFBannerView ()<UIScrollViewDelegate>
{
    NSMutableArray *_bannerArray; // 图片数组
    int _count;
    int _index;
    UIPageControl *_control;
}
@property (strong,nonatomic)UIPageControl *pageControl;
@end
@implementation CFBannerView

//创建视图
- (void)createView
{
    _mainPageBannerView = [[UIScrollView alloc]initWithFrame:self.bounds];
    _mainPageBannerView.pagingEnabled= YES;
    _mainPageBannerView.delegate = self;
    for (UIView *view in self.mainPageBannerView.subviews) {
        if (![view isMemberOfClass:[UIButton class]]) {
            [view removeFromSuperview];
        }
    }
    [self addSubview:_mainPageBannerView];
}


- (void)reloadHeaderView:(NSMutableArray *)modelArr
{
    self.mainPageBannerView = [[UIScrollView alloc]initWithFrame:self.bounds];
    int count = (int)modelArr.count;
    _count = count;
    self.mainPageBannerView.contentSize = CGSizeMake(IphoneWidth*(count+2), self.frame.size.height);
    self.mainPageBannerView.showsHorizontalScrollIndicator = NO;
    self.mainPageBannerView.pagingEnabled = YES;
    self.mainPageBannerView.delegate = self;
    for (int i=0; i<count+2; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*IphoneWidth, 0, IphoneWidth, self.frame.size.height)];
        if (i==0) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:[modelArr[count-1] valueForKey:@"app_picpath"]] placeholderImage:nil];
        }
        else if (i==count+1)
        {
            [imageView sd_setImageWithURL:[NSURL URLWithString:[modelArr[0] valueForKey:@"app_picpath"]] placeholderImage:nil];
            
        }
        else
        {
            [imageView sd_setImageWithURL:[NSURL URLWithString:[modelArr[i-1] valueForKey:@"app_picpath"]] placeholderImage:nil];
        }
        [self.mainPageBannerView addSubview:imageView];
    }
    self.mainPageBannerView.contentOffset = CGPointMake(IphoneWidth, 0);
    UIPageControl *control = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.size.height-20, self.frame.size.width, 20)];
    control.numberOfPages = modelArr.count;
    control.currentPageIndicatorTintColor = [UIColor orangeColor];
    control.pageIndicatorTintColor = [UIColor whiteColor];
    control.currentPage = 0;
    _control = control;
    _index = 0;
   
    [self addSubview:self.mainPageBannerView];
    [self addSubview:_control];
    [self addTimer];
    
    
    
    
}
- (void)addTimer
{
     _timer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(changePic:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}
- (void)changePic:(NSTimer *)timer
{
    
    //修改偏移量
    _index++;
    
    if (_index == _count) {
        
        _index = 0;
        //瞬间切换视图位置
        _mainPageBannerView.contentOffset = CGPointMake(0, 0);
    }
    
    [_mainPageBannerView setContentOffset:CGPointMake((_index+1) * self.frame.size.width, 0) animated:YES];
    
    //同步UIPageControl

    
    _control.currentPage = _index;
    
}

#pragma mark - 代理方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_timer invalidate];
    _timer = nil;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self addTimer];
    if (self.mainPageBannerView.contentOffset.x >= IphoneWidth * _count+1) {
        self.mainPageBannerView.contentOffset = CGPointMake(IphoneWidth, 0);
        
    }
    else if (scrollView.contentOffset.x <= 0)
    {
        scrollView.contentOffset = CGPointMake(IphoneWidth * _count+1, 0);
        
    }
    _control.currentPage = (_mainPageBannerView.contentOffset.x+IphoneWidth/2)/IphoneWidth-1;
}
@end
