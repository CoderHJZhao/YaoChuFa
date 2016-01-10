//
//  CFFinderPageCell.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/6.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFFinderPageCell.h"
#import "Masonry.h"
@implementation CFFinderPageCell


-(void)awakeFromNib{

    self.picImageView.layer.cornerRadius = 5;
    self.picImageView.clipsToBounds = YES;

}


-(void)fillWithModel:(CFFinderPageModel *)model{

  [self.picImageView sd_setImageWithURL:[NSURL URLWithString:model.app_picpath]];
    
}
@end
