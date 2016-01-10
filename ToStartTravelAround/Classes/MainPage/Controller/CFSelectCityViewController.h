//
//  CFSelectCityViewController.h
//  ToStartTravelAround
//
//  Created by mac on 15/8/1.
//  Copyright (c) 2015年 mac. All rights reserved.
//
typedef void(^cellSelectBlock)(NSDictionary *dic);
#import "CFParentViewController.h"

@interface CFSelectCityViewController : CFParentViewController
@property(nonatomic,copy)cellSelectBlock block;


@end
