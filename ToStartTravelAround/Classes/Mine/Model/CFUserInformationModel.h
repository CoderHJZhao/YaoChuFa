//
//  CFUserInformationModel.h
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/3.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFParentModel.h"

@interface CFUserInformationModel : CFParentModel


@property (nonatomic, copy) NSString *userId;//用户ID

@property (nonatomic, copy) NSString *orderCount;

@property (nonatomic, copy) NSString *birthday;//生日

@property (nonatomic, copy) NSString *notPayOrderCount;

@property (nonatomic, copy) NSString *sex;//性别

@property (nonatomic, copy) NSString *canCommentOrderCount;

@property (nonatomic, copy) NSString *canPayOrderCount;

@property (nonatomic, copy) NSString *isRandomPassword;

@property (nonatomic, copy) NSString *blackUserCode;

@property (nonatomic, copy) NSString *email;//邮箱

@property (nonatomic, copy) NSString *lastLoginTime;

@property (nonatomic, copy) NSString *orderReviewedCount;

@property (nonatomic, copy) NSString *phone;//电话号码

@property (nonatomic, copy)NSString  *isDataFull;

@property (nonatomic, copy) NSString  *paidOrderCount;

@property (nonatomic, copy) NSString *promotionOrderCount;

@property (nonatomic, copy) NSString *collect;

@property (nonatomic, copy) NSString *coupon;

@property (nonatomic, copy) NSString *securityKey;

@property (nonatomic, copy) NSString *expirationTime;

@property (nonatomic, copy) NSString *userName;//用户名

@property (nonatomic, copy) NSString *address;//地址

@property (nonatomic, copy) NSString *integral;

/**
 *  创建单例
 *
 *  @return 返回一个模型的单例对象
 */
+(CFUserInformationModel *)sharedInstance;
@end
