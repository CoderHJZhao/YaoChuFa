//
//  CFParentView.h
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/7/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>




//定义一个传递视图的block类型
typedef void (^SendViewBlock)(id sender);


@interface CFParentView : UIView
//传递视图的block
@property (nonatomic,copy)SendViewBlock sendBlock;

- (void)createView;
@end
