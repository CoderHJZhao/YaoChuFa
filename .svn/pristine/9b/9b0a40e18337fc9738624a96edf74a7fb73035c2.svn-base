//
//  CFParentModel.m
//  ToStartTravelAround
//
//  Created by mac on 15/7/31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFParentModel.h"

@implementation CFParentModel

//重写KVC的方法
- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([value isKindOfClass:[NSNull class]]) {
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
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"new_app_picpath"]) {
        [self setValue:value forKey:@"CFnew_app_picpath"];
    }
    else
    {
        NSLog(@"未找到相对应的KEY:%@",key);
    }
}
- (id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"未找到相对应的KEY:%@",key);
    return nil;
}


@end


