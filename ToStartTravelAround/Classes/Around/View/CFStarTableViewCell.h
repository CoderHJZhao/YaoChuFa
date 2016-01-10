//
//  CFStarTableViewCell.h
//  ToStartTravelAround
//
//  Created by mac on 15/8/11.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFStarTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *starView;
@property (weak, nonatomic) IBOutlet UILabel *saleCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *discussLabel;
- (void)fillItemWithModel:(id)model;
@end
