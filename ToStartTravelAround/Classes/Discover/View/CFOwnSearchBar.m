//
//  CFOwnSearchBar.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/7.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFOwnSearchBar.h"

@implementation CFOwnSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [self sharedInit];
    }
    return self;
}

- (id)initWithCoder: (NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        self = [self sharedInit];
    }
    return self;
    
    
}

- (id)sharedInit {
    self.backgroundColor = [UIColor whiteColor];
    self.placeholder = @"搜索目的地/景点/酒店等";
    self.keyboardType = UIKeyboardTypeDefault;
    self.tintColor = [UIColor lightGrayColor];
    self.showsCancelButton = NO;

    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:@"取消"];
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //通过遍历UISearchBar的方法，找到里面的子控件
    for (UIView *view in self.subviews) {
        
        if ([view isKindOfClass:NSClassFromString(@"UIView")] && view.subviews.count > 0) {
            [[view.subviews objectAtIndex:1] setBackgroundColor:[UIColor colorWithWhite:0.929 alpha:1.000]];
            
            UIView *view1 = [view.subviews objectAtIndex:1];
            view1.layer.borderWidth = 1;
            view1.layer.borderColor = [[UIColor lightGrayColor] CGColor];
            view1.layer.cornerRadius = 5;
            break;
      
        }
    }
    return self;
}


@end
