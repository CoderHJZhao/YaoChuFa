//
//  CFHotCityTableViewCell.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFHotCityTableViewCell.h"

@implementation CFHotCityTableViewCell
- (void)fillItemWithModel:(NSArray *)model
{
    NSInteger count = model.count;
    NSLog(@"%ld",count);
    NSInteger allRow = count/3;
    CGFloat btnWidth  = IphoneWidth/3;
    CGFloat btnHeight = self.bounds.size.height/allRow;
    for (NSInteger i=0; i<count; i++) {
        NSInteger row = i/3;
        NSInteger col = i%3;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(col * btnWidth, row * btnHeight, btnWidth, btnHeight);
        [btn setTitle:[model[i] valueForKey:@"cityNameAbbr"] forState:UIControlStateNormal];
        [btn setTitleColor:CFColor(55, 55, 55) forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.layer.borderColor = CFColor(241, 241, 245).CGColor;
        btn.layer.borderWidth = 0.5;
        [self addSubview:btn];
    }
}
@end
