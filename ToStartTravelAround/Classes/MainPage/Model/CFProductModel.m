//
//  CFProductModel.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFProductModel.h"

@implementation CFProductModel
- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([value isKindOfClass:[NSNull class]]) {
        [self setValue:@"" forKey:key];
    }
    else if (value == nil)
    {
        [self setValue:@"" forKey:key];
    }
    else if ([value isKindOfClass:[NSNumber class]])
    {
        [self setValue:[NSString stringWithFormat:@"%@",value] forKey:key];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}


@end
