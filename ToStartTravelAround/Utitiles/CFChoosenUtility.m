//
//  CFChoosenUtility.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/11.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFChoosenUtility.h"

static CFChoosenUtility *utility = nil;

@interface CFChoosenUtility ()
{

    NSMutableArray * choosenArray;
}

@end

@implementation CFChoosenUtility


- (instancetype)init
{
    if (self = [super init])
    {
        choosenArray = [NSMutableArray array];
    }
    
    return self;
}


+(CFChoosenUtility *)sharedChoosenUtility
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        utility = [[CFChoosenUtility alloc]init];
    });
    return utility;
}

/**
 *  添加到购物车
 *
 *  @param goods
 */
- (void)addChoosenObject:(CFProductModel *)product
{
    //如果不为空
    if (product)
    {
        [choosenArray addObject:product];
    }
}

/**
 *  删除购物车
 *
 *  @param productName
 */
- (void)removeChoosen:(NSString *)productName
{
    for (CFProductModel *productModel in choosenArray)
    {
        //遍历每个商品的名字
        if ([productModel.productName isEqualToString:productName])
        {
            //移除
            [choosenArray removeObject:productName];
            
            break;
        }
    }
}


-(BOOL)isChoosenWithName:(NSString *)name{

    //遍历
    for (CFProductModel *productModel in choosenArray) {
        
        //判断是否存在
        if ([productModel.productName isEqualToString:name]) {
            
            return YES;
        }
    }

    return NO;
}



-(NSArray *)getAllChoosen{
    
    return choosenArray;
    
}



@end
