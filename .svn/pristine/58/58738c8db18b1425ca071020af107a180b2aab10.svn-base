//
//  CFUserInformationModel.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/3.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFUserInformationModel.h"

static CFUserInformationModel *userInfoModel = nil;
@implementation CFUserInformationModel

+(CFUserInformationModel *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInfoModel = [[CFUserInformationModel alloc]init];
    });
    return userInfoModel;
}

@end
