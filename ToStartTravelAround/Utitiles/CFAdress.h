

//
//  CFAdress.h
//  ToStartTravelAround
//
//  Created by mac on 15/7/31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#ifndef ToStartTravelAround_CFAdress_h
#define ToStartTravelAround_CFAdress_h
/**
 *  首页产品
 *
 */
#define HOME_PRODUCTURL @"http://apiphp.yaochufa.com/playpoint/recommend"
/**
 *  首页广告栏
 *
 */
#define HOME_ADURL @"http://apiphp.yaochufa.com/you/advertiselist/AdList"
/**
 *  首页选择城市
 *
 */
#define SelectCity_URL @"http://appapi.yaochufa.com/v2/Position/GetCityList"
/**
 *  首页精品推荐
 *
 */
#define HOME_RecommendURL @"http://apiphp.yaochufa.com/playpoint/recommend"
/**
 *  首页精品推荐图片拼接
 *
 */
#define HOME_Recommend_IMAGERURL(str) [NSString stringWithFormat:@"http://cdn5.yaochufa.com/%@",str]
/**
 *  反地理编码
 */
#define GeocoderURL @"http://api.map.baidu.com/geocoder/v2/"
/**
 用户登录接口
 */
#define kUserLogin_URL @"http://appapi.yaochufa.com/v2/User/UserLogin"
/**
 *  用户收藏
 */
#define kUserCollection_URL @"http://appapi.yaochufa.com/v2/User/GetFavorites"

/**
 *  用户注册
 */
#define kUserRsgister_URL @"http://appapi.yaochufa.com/v2/User/UserRegisterByMessage"

/**
 *  注册页面验证码请求
 */
#define kRsgisterValidateCode_URL  @"http://appapi.yaochufa.com/v2/User/GetRegisterVerificationCode"

/**
 *  团购预约
 */
#define kUserGroupBuying_URL  @"http://m.yaochufa.com/tuan?DeviceToken=6d4910231779553959d43b9d6928eddb969daae6b0687db6d539c6e10e4f85d5&system=ios&version=4.2.6"

/**
 *  发现页面请求
 *
 */
#define kFinderPage_URL  @"http://apiphp.yaochufa.com/you/advertiselist/AdList"

/**
 *  周边页面请求
 *
 */
#define AroundPage_URL  @"http://appapi.yaochufa.com/v2/Product/GetAroundProductList"
///**
// *  周边详情页请求
// *
// */
//#define AROUND_DETAILURL @"http://appapi.yaochufa.com/v2/ProductPackage/GetCommonPackagesByLinkIdV424"

/**
 *  周边详情页请求
 *
 */
#define AROUND_DETAILURL @"http://appapi.yaochufa.com/v2/Product/GetProductInfoById"

#define AROUND_CITYURL @"http://appapi.yaochufa.com/Theme/GetSceniceAndTagsByCity"
/**
 *  我的页面积分请求
 */
#define kMinePoints_URL @"http://appapi.yaochufa.com/v2/User/GetCreditsTrans?system=ios&pageSize=10&userId=2649026&channel=AppStore&securityKey=YKR0EfQ85rTZaQ27Iij2T7KGEnW4wiq2iD3mvD%252Bu07OLjlmjHjJGDqaFOlWuO3QbkgeJXaZ%252B80QSIL0%252BMSjSAjBkFyTGCpLBtiY53rRhbaoVEX1UaBPxG2NqsIy388AFsoxWDJabo15gYwrpH9OHWQ%253D%253D&version=4.2.6&total=0&machineCode=E2294D1A-3DE7-4A9B-8BE6-AE67C0A594BE&pageIndex=1"

#endif
