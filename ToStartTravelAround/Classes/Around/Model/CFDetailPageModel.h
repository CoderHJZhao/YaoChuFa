//
//  CFDetailPageModel.h
//  ToStartTravelAround
//
//  Created by mac on 15/8/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFParentModel.h"


@interface CFDetailPageModel : CFParentModel

@property (nonatomic, copy) NSString *success;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger statusCode;

@property (nonatomic, copy) NSString *provinceName;

@property (nonatomic, copy) NSString *startDate;

@property (nonatomic, assign) NSInteger sellPrice;

@property (nonatomic, assign) NSInteger provinceId;

@property (nonatomic, copy) NSString *appSubTitle;

@property (nonatomic, copy) NSString *telphone;

@property (nonatomic, assign) NSInteger retailPrice;

@property (nonatomic, strong) NSMutableArray *imageList;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, copy) NSString *appMainTitle;

@property (nonatomic, strong) NSMutableArray *offerInfo;

@property (nonatomic, copy) NSString *productIntroduction;

@property (nonatomic, copy) NSString *bookNotice;

@property (nonatomic, copy) NSString *mainTitle;

@property (nonatomic, copy) NSString *packageDetial;

//@property (nonatomic, strong) NSMutableArray *facilities;

@property (nonatomic, assign) NSInteger saledCount;

@property (nonatomic, copy) NSString *openTime;

@property (nonatomic, assign) NSString *isActive;

@property (nonatomic, copy) NSString *longitude;

@property (nonatomic, copy) NSString *cityName;

@property (nonatomic, assign) NSInteger cityId;

//@property (nonatomic, copy) NSString *recommendTrip;

//@property (nonatomic, copy) NSString *recommendTripStr;

@property (nonatomic, copy) NSString *subTitle;

//@property (nonatomic, strong) NSMutableArray *videoList;

//@property (nonatomic, copy) NSString *bussinessInfo;
//
//@property (nonatomic, copy) NSString *isCanUseCoupon;
//
//@property (nonatomic, copy) NSString *productName;
//
//@property (nonatomic, copy) NSString *trafficGuide;
//
//@property (nonatomic, strong) NSMutableArray *weatherInfo;
//
@property (nonatomic, copy) NSString *channelLinkId;

@property (nonatomic, assign) CGFloat goodRate;

@property (nonatomic, assign) NSInteger productId;

@property (nonatomic, copy) NSString *endDate;

@property (nonatomic, copy) NSString *latitude;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger sortOrder;

#warning 与系统关键字重合
@property (nonatomic, copy) NSString *descriptionStr;

@property (nonatomic, assign) NSInteger imageId;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *flagMsg;

@property (nonatomic, copy) NSString *flagTitle;

@property (nonatomic, assign) NSInteger offerType;

@property (nonatomic, assign) NSInteger sort;

@property (nonatomic, assign) NSInteger flagType;

@property (nonatomic, copy) NSString *flagUrl;

@property (nonatomic, copy) NSString *isShowInList;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *abstract;

@property (nonatomic, copy) NSString *district;

@property (nonatomic, copy) NSString *province;

@property (nonatomic, copy) NSString *modifiedByName;

@property (nonatomic, copy) NSString *tripObjectMapping;

@property (nonatomic, assign) NSInteger createdById;

@property (nonatomic, copy) NSString *city;

@property (nonatomic, copy) NSString *areaId;

@property (nonatomic, assign) NSInteger modifiedById;

@property (nonatomic, copy) NSString *modifiedDate;

@property (nonatomic, copy) NSString *createdByName;

@property (nonatomic, copy) NSString *createdDate;

@property (nonatomic, assign) NSInteger tripId;

@property (nonatomic, copy) NSString *area;

//@property (nonatomic, strong) NSMutableArray *tripDay;
//
//@property (nonatomic, copy) NSString *districtId;
//
//@property (nonatomic, strong) NSMutableArray *tripDayPlace;
//
//@property (nonatomic, copy) NSString *trip;
//
//@property (nonatomic, copy) NSString *placeName;
//
//@property (nonatomic, assign) NSInteger tripDayId;
//
//@property (nonatomic, copy) NSString *standingTime;
//
//@property (nonatomic, assign) NSInteger tripDayPlaceId;
//
//@property (nonatomic, copy) NSString *imageUrl;
//
//@property (nonatomic, assign) NSInteger tripDayItemId;
//
//@property (nonatomic, copy) NSString *itemContent;
//
//@property (nonatomic, copy) NSString *imageDepression;
//
//@property (nonatomic, copy) NSString *currentCity;
//
//@property (nonatomic, copy) NSString *pm25;

//@property (nonatomic, strong) NSMutableArray *weather_Data;

//@property (nonatomic, strong) NSMutableArray *index;

//@property (nonatomic, copy) NSString *nightPictureUrl;
//
//@property (nonatomic, copy) NSString *temperature;
//
//@property (nonatomic, copy) NSString *weather;
//
//@property (nonatomic, copy) NSString *wind;
//
//@property (nonatomic, copy) NSString *dayPictureUrl;
//
//@property (nonatomic, copy) NSString *date;
//
//@property (nonatomic, copy) NSString *des;
//
//@property (nonatomic, copy) NSString *tipt;
//
//@property (nonatomic, copy) NSString *zs;


@end
