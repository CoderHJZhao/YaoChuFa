//
//  CFAreaLocationModel.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/8.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFAreaLocationModel.h"

@implementation CFAreaLocationModel
- (NSMutableArray *)scenics
{
    if (!_scenics) {
        _scenics = [NSMutableArray new];
    }
    return _scenics;
}
- (NSMutableArray *)tags
{
    if (!_tags) {
        _tags = [NSMutableArray new];
    }
    return _tags;
}

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
    if ([key isEqualToString:@"scenics"])
    {
        for (NSDictionary *dic in value) {
            CFAreaLocationModel *areaModel = [[CFAreaLocationModel alloc]init];
            [areaModel setValuesForKeysWithDictionary:dic];
            [self.scenics addObject:areaModel];
        }
    }
    if ([key isEqualToString:@"tags"])
    {
        for (NSDictionary *dic in value) {
            CFAreaLocationModel *areaModel = [[CFAreaLocationModel alloc]init];
            [areaModel setValuesForKeysWithDictionary:dic];
            [self.tags addObject:areaModel];
        }
    }

    else
    {
        [super setValue:value forKey:key];
    }
}

@end

