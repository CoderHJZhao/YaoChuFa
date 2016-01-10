//
//  CFSelectCityModel.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFSelectCityModel.h"
#pragma mark ========================数组懒加载========================
@implementation CFSelectCityModel
- (NSMutableArray *)hotCity
{
    if (!_hotCity) {
        _hotCity =[NSMutableArray new];
    }
    return _hotCity;
}
- (NSMutableArray *)positionCity
{
    if (!_positionCity) {
        _positionCity =[NSMutableArray new];
    }
    return _positionCity;
}


- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"hotCity"]) {
        for (NSDictionary *dic in value) {
//            CFSelectCityModel *cityModel = [[CFSelectCityModel alloc]init];
//            [cityModel setValuesForKeysWithDictionary:dic];
            [self.hotCity addObject:dic];

        }
    }
    if ([key isEqualToString:@"positionCity"]) {
        for (NSDictionary *dic in value) {
//            CFSelectCityModel *cityModel = [[CFSelectCityModel alloc]init];
//            [cityModel setValuesForKeysWithDictionary:dic];
            [self.positionCity addObject:dic];
        }
        
    }
    else
    {
        [super setValue:value forKey:key];
    }

}
@end

