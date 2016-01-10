//
//  CFSecondViewCell.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/1.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFSecondViewCell.h"
#import "UIButton+WebCache.h"
@implementation CFSecondViewCell
- (void)fillItemWithModel:(NSArray *)model
{

    NSInteger count = model.count;
    NSInteger allRow = count/2;
    CGFloat btnWidth = IphoneWidth/2;
    CGFloat btnHeight = self.bounds.size.height/allRow;
    for (NSInteger i = 0; i<count; i++) {
        NSInteger row = i/2;
        NSInteger col = i%2;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(col*(IphoneWidth/2), row * btnHeight, btnWidth, btnHeight);
        [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:[model[i] valueForKey:@"app_picpath"]] forState:UIControlStateNormal];
        btn.layer.borderWidth  = 0.5;
        btn.layer.borderColor = CFColor(241, 242, 245).CGColor;
        [self addSubview:btn];
        
    }



}

@end
