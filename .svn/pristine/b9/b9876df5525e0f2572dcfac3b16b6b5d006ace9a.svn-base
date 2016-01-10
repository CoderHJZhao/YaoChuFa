//
//  CFDetailSecondTableViewCell.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/11.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFDetailSecondTableViewCell.h"
#import "CFDetailPageModel.h"
@implementation CFDetailSecondTableViewCell

- (void)fillItemWithModel:(NSArray *)model
{
    if (model.count>2) {
        CFDetailPageModel *detailModel1 = model[1];
        _reducePriceLabel.text = detailModel1.flagMsg;
        
        CFDetailPageModel *detailModel2 = model[2];
        _cashTicketLabel.text = detailModel2.flagMsg;
    }
    else if (model.count<3) {
        CFDetailPageModel *detailModel1 = model[0];
        _reducePriceLabel.text = detailModel1.flagMsg;
        
        _dropDownImageView = nil;
    }
    
}
@end
