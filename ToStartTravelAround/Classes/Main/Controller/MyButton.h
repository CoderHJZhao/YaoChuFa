//
//  MyButton.h
//  CustomizedTabBar
//
//  Created by DancewithPeng on 15/6/3.
//  Copyright (c) 2015年 dancewithpeng@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyButton : UIButton
@property (nonatomic, strong) UIImageView   *iconImageView;
@property (nonatomic, strong) UILabel   *nameLabel;
@property (nonatomic, strong) UIImage   *image;
@property (nonatomic, strong) UIImage   *selectedImage;

- (instancetype)initWithFrame:(CGRect)frame;

@end
