//
//  CFRegisterController.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/3.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFRegisterController.h"
#import "CFRegisterView.h"

typedef enum
{
    kGetVerifyCodeRequest = 1,//获取验证码
    kPostRegisterRequest = 2, //注册请求
    
}KRequestType;
@interface CFRegisterController ()<UITextFieldDelegate>
{

    NSString    *_phoneNum;//手机号码
    NSString    *_password;//密码
    NSString    *_verificationCode;//验证码

}

@property (nonatomic, strong)CFRegisterView *registerView;
@end

@implementation CFRegisterController

#pragma mark - ====================== 视图生命周期 ==========================

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createView];
    
   
    
}

#pragma mark - ====================== 视图创建方法 ==========================

-(void)createView{
    //加载注册页面UI
     _registerView= [[[NSBundle mainBundle] loadNibNamed:@"CFRegisterView" owner:self options:nil] objectAtIndex:0];
    self.view = _registerView;
    __weak typeof(self)weakSelf = self;
    _registerView.sendBlock = ^(id sender){
        
        [weakSelf clickAction:sender];
    };
    
    //设置导航栏
    [self setUpNavigationBar];
    //设置phoneNumTf的代理
     self.registerView.phoneNumTf.delegate = self;
    //设置键盘类型
    self.registerView.passwordTf.keyboardType = UIKeyboardTypeNumberPad;
    self.registerView.phoneNumTf.keyboardType = UIKeyboardTypeNumberPad;
     self.registerView.getCodeTf.keyboardType = UIKeyboardTypeNumberPad;
}

-(void)setUpNavigationBar{
    
    UIBarButtonItem *loginBBi = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(loginBBiDidClicked:)];
    
    self.navigationItem.rightBarButtonItem = loginBBi;

}

#pragma mark - ====================== 数据请求方法 ==========================

// 请求目录（简单工厂方法模式）
- (void)getRequestWithType:(KRequestType)type
{
    switch (type) {
        case kGetVerifyCodeRequest:{
            
            [self getVerifyCodeRequest];
        
        }
            break;
        case kPostRegisterRequest:{
            // 判断手机号是否11位手机号
            if([RegularTools validateMobile:_registerView.phoneNumTf.text])
            {
                [self postRegisterRequest];
            }
            else
            {
                [self remindRegisterStatus:@"请输入正确的手机号码"];
            }
        }
            break;
        default:
            break;
    }
}

-(void)postRegisterRequest{

    _phoneNum = self.registerView.phoneNumTf.text;
    _password = self.registerView.passwordTf.text;
    _verificationCode = self.registerView.getCodeTf.text;

    
    NSDictionary *params = @{@"phone":_phoneNum, @"password":_password, @"system":@"ios", @"longitude":@"113.9513626098633", @"latitude":@"113.9513626098633", @"channel":@"AppStore", @"machineCode":@"0316B31D-CEAE-4C94-A3F8-F5BB581B0CE3", @"version": @"4.2.6", @"msgCode": _verificationCode, @"userName":@"", @"email":@""};
    
    
//    userName=&email=&phone=18565703960&password=12345678&system=ios&machineCode=0316B31D-CEAE-4C94-A3F8-F5BB581B0CE3&channel=AppStore&version=4.2.6&latitude=22.54060935974121&longitude=113.951416015625&msgCode=2432
    
    
    [CFNetWork networkUserRegisterRequest:params whileSuccess:^(id responseObject) {
       
        
        
        
        //输入账号、密码、验证码之后返回登录成功或失败的信息给用户
        [self remindRegisterStatus:[NSString  stringWithFormat:@"%@", responseObject[@"message"]]];
        //假如匹配登录成功，则将用户信息存入数据库，并且跳转至个人中心
        if ([responseObject[@"message"] isEqualToString:@"注册成功，您已获得：\n20元现金券。"]) {
            
            
            //用户是一个单例，登录成功后的数据为单例赋值
            CFUserInformationModel *userInfoModel = [CFUserInformationModel sharedInstance];
            [userInfoModel setValuesForKeysWithDictionary:responseObject[@"data"]];
            [[FMDBManager sharedInstace] creatTable:userInfoModel];
            [[FMDBManager sharedInstace] insertAndUpdateModelToDatabase:userInfoModel];
            
            [[NSUserDefaults standardUserDefaults] setValue:@"login" forKey:@"loginStatus"];
            //跳转至个人中心页面
            [self.navigationController popToRootViewControllerAnimated:YES];

        }
    } orFail:^(id responseObject) {
        
    }];
    
}

/**
 *  获取验证码请求
 */
-(void)getVerifyCodeRequest{
    
    _phoneNum = self.registerView.phoneNumTf.text;

    NSDictionary *params = @{@"phone":_phoneNum, @"version":@"4.2.6", @"system":@"ios", @"channel":@"AppStore", @"machineCode":@"0316B31D-CEAE-4C94-A3F8-F5BB581B0CE3"};
    
    [CFNetWork networkRegisterVerificationCodeRequest:params whileSuccess:^(id responseObject) {
        
       [self remindRegisterStatus:[NSString stringWithFormat:@"%@", responseObject[@"message"]]];
     
        if ([responseObject[@"message"] isEqualToString:@"注册验证码发送成功，10分钟内有效！"]) {
            
            [self.registerView createCountDownBtn];
        }
        
    } orFail:^(id responseObject) {
        
    }];
    
    
}


#pragma mark - ====================== 各类触发方法 ==========================

-(void)loginBBiDidClicked:(UIBarButtonItem *)bbi{
    
    [self.navigationController popViewControllerAnimated:NO];
}



-(void)clickAction:(CFExtensionButton *)sender{
    
    switch (sender.tag) {
            //获取验证码按钮
        case 102:{
           
        [self getRequestWithType:kGetVerifyCodeRequest];
            
        }
            break;
            //注册按钮
        case 103:{
            
            [self getRequestWithType:kPostRegisterRequest];
        }
         break;
            
        default:
            break;
    }
}

//弹框提醒方法
- (void)remindRegisterStatus:(NSString *)info
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:info delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
}

#pragma mark - ====================== 代理协议方法 ==========================

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

 [self.registerView stateNomalBtn];

    return YES;

}

@end
