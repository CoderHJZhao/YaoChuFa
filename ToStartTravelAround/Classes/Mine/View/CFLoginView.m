//
//  CFLoginView.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFLoginView.h"

@implementation CFLoginView


- (IBAction)sender:(id)sender {
    
    self.sendBlock(sender);
}


-(void)awakeFromNib{
    //设置背景颜色
     self.backgroundColor = [UIColor colorWithWhite:0.835 alpha:1.0000];
    
    //设置各个控件的边界及颜色
    self.lineLabelGetCode.layer.borderWidth = 1;
    self.lineLabelGetCode.layer.borderColor = [[UIColor colorWithWhite:0.835 alpha:1.000] CGColor];
    
    self.LineLabellogin.layer.borderWidth = 1;
    self.LineLabellogin.layer.borderColor = [[UIColor colorWithWhite:0.835 alpha:1.000] CGColor];
    
    self.lineLabelPassword.layer.borderWidth = 1;
    self.lineLabelPassword.layer.borderColor = [[UIColor colorWithWhite:0.835 alpha:1.000] CGColor];
    
    self.lineLabelphone.layer.borderWidth = 1;
    self.lineLabelphone.layer.borderColor = [[UIColor colorWithWhite:0.835 alpha:1.000] CGColor];
    
    self.getCodeBtn.layer.borderWidth = 1;
    self.getCodeBtn.layer.borderColor = [[UIColor colorWithWhite:0.835 alpha:1.000] CGColor];
    self.getCodeBtn.layer.cornerRadius = 3;

    self.loginBtn.layer.cornerRadius = 3;
    
}

/**
 *  创建自定义类型的btn并开始计时
 */
-(void)createCountDownBtn{
    
    self.getCodeBtn.backgroundColor = [UIColor lightGrayColor];
    [self.getCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.getCodeBtn.enabled = NO;
    //button type要 设置成custom 否则会闪动
    [self.getCodeBtn startWithSecond:60];
    [self.getCodeBtn didChange:^NSString *(CFExtensionButton *countDownButton,int second) {
        NSString *title = [NSString stringWithFormat:@"剩余%d秒",second];
        return title;
    }];
    [self.getCodeBtn didFinished:^NSString *(CFExtensionButton *countDownButton, int second) {
        countDownButton.enabled = YES;
        self.getCodeBtn.backgroundColor = [UIColor orangeColor];
        return @"重新获取";
    }];
}

/**
 *  获取验证码btn停止倒计时
 */
-(void)stopCountDownBtn{

    [self.getCodeBtn stop];
}
@end
