//
//  CFPointsModel.h
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFParentModel.h"

@interface CFPointsModel : CFParentModel




@property (nonatomic, copy) NSString *used;

@property (nonatomic, strong) NSMutableArray *credits;

@property (nonatomic, copy) NSString *balance;

@property (nonatomic, copy)NSString *total;


@end
