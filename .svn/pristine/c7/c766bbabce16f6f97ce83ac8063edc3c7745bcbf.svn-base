//
//  CFHistoryCityViewCell.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/7.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFHistoryCityViewCell.h"

@implementation CFHistoryCityViewCell
- (void)fillItemWithModel:(NSArray *)model
{
    NSInteger count = model.count;
   
    for (NSInteger i=0; i<count; i++) {
        NSInteger row = i/3;
        NSInteger col = i%3;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(col * IphoneWidth/3, row * 35, IphoneWidth/3, 35);
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn setTitle:[model[i] valueForKey:@"cityNameAbbr"] forState:UIControlStateNormal];
        [btn setTitleColor:CFColor(55, 55, 55) forState:UIControlStateNormal];
        btn.layer.borderColor = CFColor(241, 241, 245).CGColor;
        btn.layer.borderWidth = 0.5;
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:btn];
    }
}
@end
