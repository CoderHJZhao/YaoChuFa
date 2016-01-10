//
//  UIButton+Extension.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)
+ (UIButton *)btnWithTarget:(id)target action:(SEL)action image:(NSString *)image selectImage:(NSString *)selectImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    // 设置尺寸
    //    btn.size = btn.currentBackgroundImage.size;
    btn.frame = CGRectMake(0, 0, btn.currentBackgroundImage.size.width, btn.currentBackgroundImage.size.height);
    return btn;

}
@end
