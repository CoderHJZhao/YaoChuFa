//
//  CFRegisterView.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/3.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFRegisterView.h"

@implementation CFRegisterView


- (IBAction)sender:(id)sender {
    
    self.sendBlock(sender);
}


-(void)awakeFromNib{
    
    self.backgroundColor = [UIColor colorWithWhite:0.835 alpha:1.000];
    //设置各个控件的边界及颜色
    self.lineLabelCode.layer.borderWidth = 1;
    self.lineLabelCode.layer.borderColor = [[UIColor colorWithWhite:0.835 alpha:1.000] CGColor];
    
    self.lineLabelPassword.layer.borderWidth = 1;
    self.lineLabelPassword.layer.borderColor = [[UIColor colorWithWhite:0.835 alpha:1.000] CGColor];
    
    self.lineLabelPhone.layer.borderWidth = 1;
    self.lineLabelPhone.layer.borderColor = [[UIColor colorWithWhite:0.835 alpha:1.000] CGColor];
    
    self.lineLabelRegister.layer.borderWidth = 1;
    self.lineLabelRegister.layer.borderColor = [[UIColor colorWithWhite:0.835 alpha:1.000] CGColor];
    
    self.getCodeBtn.layer.borderWidth = 1;
    self.getCodeBtn.layer.borderColor = [[UIColor colorWithWhite:0.835 alpha:1.000] CGColor];
    self.getCodeBtn.layer.cornerRadius = 3;
    
    self.registerBtn.layer.cornerRadius = 3;
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

/**
 *  输入状态下的btn
 */
-(void)stateNomalBtn{

    self.getCodeBtn.backgroundColor = [UIColor whiteColor];
    self.getCodeBtn.layer.borderWidth = 1;
    self.getCodeBtn.layer.borderColor = [[UIColor orangeColor] CGColor];
    self.getCodeBtn.layer.cornerRadius = 3;
    [self.getCodeBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];

}
@end
