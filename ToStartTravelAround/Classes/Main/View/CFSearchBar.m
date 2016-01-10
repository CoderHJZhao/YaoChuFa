//
//  CFSearchBar.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFSearchBar.h"

@implementation CFSearchBar
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"请输入城市";;;
        UIImageView *searchIcon = [[UIImageView alloc]init];
        searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.contentMode = UIViewContentModeCenter;

        self.backgroundColor = [UIColor whiteColor];
               self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.layer.cornerRadius = 5;
        

    }
    return self;
}
+ (instancetype)searchBar
{
    return [[self alloc] init];
}
@end
