//
//  CFFirstTableViewCell.m
//  ToStartTravelAround
//
//  Created by mac on 15/7/31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFFirstTableViewCell.h"
#import "UIButton+WebCache.h"
@implementation CFFirstTableViewCell
- (void)fillItemWithModel:(NSArray *)model
{
    if (model.count>=5) {
        int index = 0;
        [_beachButton sd_setBackgroundImageWithURL:[model[index] valueForKey:@"app_picpath"] forState:UIControlStateNormal];
        _beachLabel.text = [model[index] valueForKey:@"title"];
        index++;
        [_doorMatButton sd_setBackgroundImageWithURL:[model[index] valueForKey:@"app_picpath"] forState:UIControlStateNormal];
        _doorMatLabe.text = [model[index] valueForKey:@"title"];
        index++;
        [_FamilyTravelButton sd_setBackgroundImageWithURL:[model[index] valueForKey:@"app_picpath"] forState:UIControlStateNormal];
        _FamilyTravelLabel.text = [model[index] valueForKey:@"title"];
        index++;
        [_hotSpringsButton sd_setBackgroundImageWithURL:[model[index] valueForKey:@"app_picpath"] forState:UIControlStateNormal];
        _hotSpringsLabel.text = [model[index] valueForKey:@"title"];
        index++;
        [_driftButton sd_setBackgroundImageWithURL:[model[index] valueForKey:@"app_picpath"] forState:UIControlStateNormal];
        _driftLabel.text = [model[index] valueForKey:@"title"];
 
    }
}

@end
