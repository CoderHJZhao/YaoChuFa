//
//  CFDetailCollectionView.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFDetailScrollView.h"
#import "UIImageView+WebCache.h"
@interface CFDetailScrollViewView() <UIScrollViewDelegate>
{
    int _count;
}
@end
@implementation CFDetailScrollViewView

- (void)reloadHeaderView:(NSMutableArray *)modelArr
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    int count = (int)modelArr.count;
    _count = count;
    self.scrollView.contentSize = CGSizeMake(IphoneWidth*(count+2), self.frame.size.height);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    for (int i=0; i<count+2; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*IphoneWidth, 0, IphoneWidth, self.frame.size.height)];
        if (i==0) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:AROUNDURLWITH([modelArr[count-1] valueForKey:@"url"])] placeholderImage:[UIImage imageNamed:@"logo-Gray"]];
        }
        else if (i==count+1)
        {
            [imageView sd_setImageWithURL:[NSURL URLWithString:AROUNDURLWITH([modelArr[0] valueForKey:@"url"])] placeholderImage:[UIImage imageNamed:@"logo-Gray"]];

        }
        else
        {
            [imageView sd_setImageWithURL:[NSURL URLWithString:AROUNDURLWITH([modelArr[i-1] valueForKey:@"url"])] placeholderImage:[UIImage imageNamed:@"logo-Gray"]];
        }
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentOffset = CGPointMake(IphoneWidth, 0);
    [self addSubview:self.scrollView];
    

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.scrollView.contentOffset.x >= IphoneWidth * _count+1) {
        self.scrollView.contentOffset = CGPointMake(IphoneWidth, 0);
        
    }
    else if (scrollView.contentOffset.x <= 0)
    {
        scrollView.contentOffset = CGPointMake(IphoneWidth * _count+1, 0);
        
    }
}
@end
