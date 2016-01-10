//
//  CFChoosenUtility.h
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/11.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *首页精品和周边的模型
 */
#import "CFProductModel.h"
/**
 *  浏览历史及收藏的管理类
 */
@interface CFChoosenUtility : NSObject

/**
 *  创建一个管理类的单例
 *
 *  @return 管理类
 */
+(CFChoosenUtility *)sharedChoosenUtility;

/**
 *  添加到我的收藏和浏览历史
 *
 *  @param product 浏览物品
 */
-(void)addChoosenObject:(CFProductModel *)product;

/**
 *  浏览是否存在
 *
 *  @param name 商品名称
 *
 *  @return 返回bool值
 */
-(BOOL)isChoosenWithName:(NSString *)name;


/**
 *  从购物车里面删除
 *
 *  @param goodName 商品名称
 */
- (void)removeChoosen:(NSString *)productName;

/**
 *  获取全部浏览历史
 *
 *  @return 
 */
-(NSArray *)getAllChoosen;

@end
