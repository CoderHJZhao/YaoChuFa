//
//  CFThirdTableViewCell.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFThirdTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation CFThirdTableViewCell
//首页
- (void)fillItemWithModel:(id)model
{

    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:[model valueForKey:@"url"]] placeholderImage:nil];
    _headerImageView.layer.cornerRadius = 2;
    _headerImageView.clipsToBounds = YES;
    _titleLabel.text = [NSString stringWithFormat:@"%@",[model valueForKey:@"productName"]];
    _desLabel.text = [NSString stringWithFormat:@"[%@] %@",[model valueForKey:@"cityName"],[model valueForKey:@"productTitleContent"]];
    
    //富文本--方法一
        NSDictionary *attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle),NSStrikethroughStyleAttributeName,[UIColor blackColor],NSForegroundColorAttributeName,nil];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"￥%@",[model valueForKey:@"originalPrice"]] attributes:attributeDict];
    _oldPriceLabel.attributedText = str;
    
    //富文本--方法二
    
//    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"￥%@",[model valueForKey:@"originalPrice"]]];
//    NSUInteger length = [[NSString stringWithFormat:@"￥%@",[model valueForKey:@"originalPrice"]] length];
//    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
//    [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, length)];
//    [_oldPriceLabel setAttributedText:attri];
    
    
    
    
    _priceLabel.text = [NSString stringWithFormat:@"￥%@",[model valueForKey:@"price"]];
//    _oldPriceLabel.text = [NSString stringWithFormat:@"￥%@",[model valueForKey:@"originalPrice"]];
    _saleCountLabel.text = [NSString stringWithFormat:@"已售%@",[model valueForKey:@"saledCount"]];


  
}

//周边
- (void)fillItemWithAroundModel:(id)model
{

    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:AROUNDURLWITH([model valueForKey:@"url"])] placeholderImage:nil];
    _headerImageView.layer.cornerRadius = 2;
    _headerImageView.clipsToBounds = YES;
    _titleLabel.text = [NSString stringWithFormat:@"%@",[model valueForKey:@"productName"]];
    _desLabel.text = [NSString stringWithFormat:@"[%@] %@",[model valueForKey:@"cityName"],[model valueForKey:@"productTitleContent"]];
    
    //富文本--方法一
    NSDictionary *attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle),NSStrikethroughStyleAttributeName,[UIColor blackColor],NSForegroundColorAttributeName,nil];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"￥%@",[model valueForKey:@"originalPrice"]] attributes:attributeDict];
    _oldPriceLabel.attributedText = str;
    
    //富文本--方法二
    
    //    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"￥%@",[model valueForKey:@"originalPrice"]]];
    //    NSUInteger length = [[NSString stringWithFormat:@"￥%@",[model valueForKey:@"originalPrice"]] length];
    //    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
    //    [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, length)];
    //    [_oldPriceLabel setAttributedText:attri];
    
    
    
    
    _priceLabel.text = [NSString stringWithFormat:@"￥%@",[model valueForKey:@"price"]];
    //    _oldPriceLabel.text = [NSString stringWithFormat:@"￥%@",[model valueForKey:@"originalPrice"]];
    _saleCountLabel.text = [NSString stringWithFormat:@"已售%@",[model valueForKey:@"saledCount"]];
    
    
    
}

@end
