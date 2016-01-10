//
//  CFShareInstance.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/7.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFShareInstance.h"
static NSMutableArray *historyArr = nil;
@implementation CFShareInstance
+ (NSMutableArray *)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        historyArr = [[NSMutableArray alloc]init];
    });
    return historyArr;
}
@end
