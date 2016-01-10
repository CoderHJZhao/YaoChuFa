//
//  CFNetWork.h
//  ToStartTravelAround
//
//  Created by mac on 15/7/31.
//  Copyright (c) 2015年 mac. All rights reserved.
//
typedef void(^SuccessBlock)(id responseObject);
typedef void(^FailBlock)(id responseObject);
#import <Foundation/Foundation.h>

@interface CFNetWork : NSObject
/**
 *  首页广告栏请求
 *
 *  @param parmas       字典类型参数
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
+ (void)networkMainBannerRequest:(id)parmas whileSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBlock;
/**
*  首页广告栏下面的项目请求
*
*  @param parmas       字典类型参数
*  @param successBlock 成功回调
*  @param failBlock    失败回调
*/
+ (void)networkMainItemRequest:(id)parmas whileSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBlock;
/**
 *  首页广告栏下面的套餐请求
 *
 *  @param parmas       字典类型参数
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
+ (void)networkMainPackageRequest:(id)parmas whileSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBlock;
/**
 *  城市定位选择
 *
 *  @param parmas       字典类型参数
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
+ (void)networkCitySelectRequest:(id)parmas whileSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBlock;

/**
 *  用户登录请求
 *
 *  @param parmas       字典类型参数
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
+(void)networkUserLoginRequest:(id)parmas whileSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBlock;


/**
 *  注册页面获取验证码请求
 *
 *  @param parmas       字典类型参数
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
+(void)networkRegisterVerificationCodeRequest:(id)parmas whileSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBlock;

/**
 *  登录页面获取验证码请求
 *
 *  @param parmas       字典类型参数
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
+(void)networkLoginVerificationCodeRequest:(id)parmas whileSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBlock;

/**
 *  注册页面注册请求
 *
 *  @param parmas       字典类型参数
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
+(void)networkUserRegisterRequest:(id)parmas whileSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBlock;

/**
 *  反地理编码请求
 *
 *  @param parmas       字典类型参数
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
+(void)networkGeocoderRequest:(id)parmas whileSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBlock;

/**
 *  发现页面请求
 *
 *  @param parmas       字典类型参数
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
+(void)networFinderRequest:(id)parmas whileSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBlock;/**
 *  首页精品推荐
 *
 *  @param parmas       字典类型参数
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
+(void)networkRecommendRequest:(id)parmas whileSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBlock;

/*  周边地区景点请求
*
*  @param parmas       字典类型参数
*  @param successBlock 成功回调
*  @param failBlock    失败回调
*/
+(void)networkAreaLocationRequest:(id)parmas whileSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBlock;
/*  周边地区旅游产品请求
 *
 *  @param parmas       字典类型参数
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
+(void)networkAroundProductRequest:(id)parmas whileSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBlock;
/*  周边地区详情界面请求
 *
 *  @param parmas       字典类型参数
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
+(void)networkAroundDetailPageRequest:(id)parmas whileSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBlock;
/**
 *  积分请求
 *
 *  @param parmas       字典类型参数
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
+(void)networkMinePointsRequest:(id)parmas whileSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBlock;
@end
