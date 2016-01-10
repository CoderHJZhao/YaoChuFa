//
//  CFPointDetailModel.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFPointDetailModel.h"

@implementation CFPointDetailModel

-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"description"]) {
        
        [self setValue:value forKey:@"descriptions"];
        
    }else if([key isEqualToString:@"date"]){
    
        // 把时间戳转换为NSString型的时间
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        dateFormat.dateFormat = @"MM-dd";
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:[value integerValue]];
        
        self.date = [dateFormat stringFromDate:date];

    }else{
        
        [super setValue:value forKey:key];
    }
}


@end
