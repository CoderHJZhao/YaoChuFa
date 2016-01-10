//
//  MyJSInterface.m
//  EasyJSWebViewSample
//
//  Created by Lau Alex on 19/1/13.
//  Copyright (c) 2013 Dukeland. All rights reserved.
//

#import "MyJSInterface.h"

@implementation MyJSInterface

// 无参使用
- (void)test{
    if (self.contentBlock) {
        self.contentBlock(@"test");
    }
}

// 一个参数使用
- (void) testWithParam: (NSString*) param{
    if (self.contentBlock) {
        self.contentBlock(param);
    }
}

// 两个个参数使用
- (void) testWithTwoParam: (NSString*) param AndParam2: (NSString*) param2{
    if (self.contentBlock) {
    self.contentBlock(@{@"param1":param,@"param2":param2});
    }
}

// 方法当参数使用
- (void) testWithFuncParam: (EasyJSDataFunction*) param{
	NSLog(@"test with func");
	
	param.removeAfterExecute = YES;
	NSString* ret = [param executeWithParam:@"—— 呵呵呵呵"];
	
	NSLog(@"Return value from callback: %@", ret);
}

- (void) testWithFuncParam2: (EasyJSDataFunction*) param{
	NSLog(@"test with func 2 but not removing callback after invocation");
	
	param.removeAfterExecute = NO;
	[param executeWithParam:@"data 1"];
	[param executeWithParam:@"data 2"];
}

- (NSString*) testWithRet{
	NSString* ret = @"js";
	return ret;
}

@end
