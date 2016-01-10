//
//  MyButton.m
//  CustomizedTabBar
//
//  Created by DancewithPeng on 15/6/3.
//  Copyright (c) 2015年 dancewithpeng@gmail.com. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 35, frame.size.width, 10)];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.textColor = CFColor(128, 129, 137);
        _nameLabel.font = [UIFont systemFontOfSize:10];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_nameLabel];
        [self addSubview:_iconImageView];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected
{
    // 父类去做了些保存这个是否被选中的标记
    [super setSelected:selected];
    
    if (selected == YES) {
        _iconImageView.image = _selectedImage;
        _nameLabel.textColor = [UIColor orangeColor];
    }
    else {
        _iconImageView.image = _image;
        _nameLabel.textColor = CFColor(128, 129, 137);
    }
}

- (void)setImage:(UIImage *)image
{
    if (_image != image) {
        _image = image;
        
        _iconImageView.image = image;
    }
}

@end
