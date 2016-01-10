//
//  MyJSInterface.h
//  EasyJSWebViewSample
//
//  Created by Lau Alex on 19/1/13.
//  Copyright (c) 2013 Dukeland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EasyJSDataFunction.h"
typedef void (^JSContentBlock) (id content);


@interface MyJSInterface : NSObject


@property (nonatomic,copy)JSContentBlock contentBlock;
- (void) test;
- (void) testWithParam: (NSString*) param;
- (void) testWithTwoParam: (NSString*) param AndParam2: (NSString*) param2;

- (void) testWithFuncParam: (EasyJSDataFunction*) param;
- (void) testWithFuncParam2: (EasyJSDataFunction*) param;

- (NSString*) testWithRet;

@end
