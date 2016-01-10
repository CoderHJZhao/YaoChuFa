//
//  CFStarTableViewCell.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/11.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFStarTableViewCell.h"

@implementation CFStarTableViewCell
- (void)fillItemWithModel:(id)model
{
    _saleCountLabel.text = [NSString stringWithFormat:@"已售%@",[model valueForKey:@"saledCount"]];
    _discussLabel.text = [NSString stringWithFormat:@"%@人评价",[model valueForKey:@"commentCount"]];
    CGFloat width = _starView.frame.size.width;
    _starView.width = [[model valueForKey:@"goodRate"] floatValue]/5 * width;
    _starView.clipsToBounds = YES;

}

@end
