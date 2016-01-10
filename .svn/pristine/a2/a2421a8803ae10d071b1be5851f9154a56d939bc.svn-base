//
//  CFPointsModel.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFPointsModel.h"
#import "CFPointDetailModel.h"

@implementation CFPointsModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 
        _credits = [NSMutableArray array];
        
    }
    return self;
}






-(void)setValue:(id)value forKey:(NSString *)key{
    // 如果
    if ([key isEqualToString:@"credits"]) {
        
        for (NSDictionary *pointDic in value) {
            
            CFPointDetailModel *detailModel = [[CFPointDetailModel alloc]init];
            
            [detailModel setValuesForKeysWithDictionary:pointDic];
            
            [_credits addObject:detailModel];
            
        }
    }
    else
    {
        [super setValue:value forKey:key];
    }
}
@end


