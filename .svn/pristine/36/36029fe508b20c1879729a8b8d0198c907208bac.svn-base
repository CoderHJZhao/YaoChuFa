//
//  CFLocationModel.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/4.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFLocationModel.h"

@implementation CFLocationModel

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"location"]) {
        CFLocationModel *locationModel = [CFLocationModel new];
        [locationModel setValuesForKeysWithDictionary:value];
        [_location addObject:locationModel];
    }
    if ([key isEqualToString:@"addressComponent"]) {
        CFLocationModel *locationModel = [CFLocationModel new];
        [locationModel setValuesForKeysWithDictionary:value];
        [_addressComponent addObject:locationModel];
    }
   else
   {
       [super setValue:value forKey:key];
   }
}
@end
