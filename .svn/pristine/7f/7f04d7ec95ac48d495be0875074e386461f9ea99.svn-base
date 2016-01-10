//
//  CFDetailPageModel.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFDetailPageModel.h"

@implementation CFDetailPageModel
#pragma mark - 懒加载
- (NSMutableArray *)imageList
{
    if (!_imageList) {
        _imageList = [NSMutableArray new];
    }
    return _imageList;
}
- (NSMutableArray *)offerInfo
{
    if (!_offerInfo) {
        _offerInfo = [NSMutableArray new];
    }
    return _offerInfo;
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
    else if ([key isEqualToString:@"description"])
    {
        [self setValue:value forKey:@"descriptionStr"];
    }
    else if ([key isEqualToString:@"imageList"])
    {
        for (NSDictionary *dic in value) {
            CFDetailPageModel *detailModel = [[CFDetailPageModel alloc]init];
            [detailModel setValuesForKeysWithDictionary:dic];
            [self.imageList addObject:detailModel];

        }
        
    }
    else if ([key isEqualToString:@"offerInfo"])
    {
        for (NSDictionary *dic in value) {
            CFDetailPageModel *detailModel = [[CFDetailPageModel alloc]init];
            [detailModel setValuesForKeysWithDictionary:dic];
            [self.offerInfo addObject:detailModel];
            
        }

    }

    else
    {
        [super setValue:value forKey:key];
    }
}
@end


