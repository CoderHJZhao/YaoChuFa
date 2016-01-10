//
//  HWNavigationController.m
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HWNavigationController.h"
#import "UIBarButtonItem+Extension.h"
@interface HWNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation HWNavigationController



- (void)viewDidLoad
{
    [super viewDidLoad];
    __weak typeof (self) weakSelf = self;
    //解决因为自定义导航栏按钮,滑动返回失效的问题
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }

    self.navigationBar.translucent = NO;
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    return YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    
}
/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
   


    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
        /* 设置导航栏上面的内容 */
        // 设置左边的返回按钮
       
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"home_nav_bar_back_icon" highImage:@"home_nav_bar_back_icon"];
        // 设置右边的更多按钮
         }

    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    // 因为self本来就是一个导航控制器，self.navigationController这里是nil的
    [self popViewControllerAnimated:YES];
}


@end
