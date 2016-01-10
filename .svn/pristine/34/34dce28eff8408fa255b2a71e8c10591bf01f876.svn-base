//
//  CFLoginController.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFLoginController.h"
#import "CFLoginView.h"
#import "CFRegisterController.h"

typedef enum
{
    kGetVerifyCodeRequest = 1,//获取验证码
    kPostLoginRequest = 2,    //登录请求
}KRequestType;


@interface CFLoginController (){
    
    NSString *_phoneNum;
    NSString *_password;
    
}
@property (nonatomic, strong)CFLoginView *loginView;
@end

@implementation CFLoginController

#pragma mark - ====================== 视图生命周期 ==========================
- (void)viewDidLoad {
    [super viewDidLoad];
    //调用创建视图的方法
    [self createView];
}

#pragma mark - ====================== 创建视图 =============================

-(void)createView{
    
    //设置导航栏的按钮
    [self setUpNavigationBar];
    
    //从xib加载登录视图
    _loginView = [[[NSBundle mainBundle] loadNibNamed:@"CFLoginView" owner:self options:nil] objectAtIndex:0];
    self.view = _loginView;
    
    //设置点击事件的block
    __weak typeof(self)weakSelf = self;
    _loginView.sendBlock = ^(id sender){
        
        [weakSelf clickAction:sender];
    };
}
//设置NavigationBar
-(void)setUpNavigationBar{
    
    UIBarButtonItem *loginBBi = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(registerBBiDidClicked:)];
    self.navigationItem.rightBarButtonItem = loginBBi;
}

#pragma mark - ====================== 数据请求类 ==========================
// 请求目录（简单工厂方法模式）
- (void)getRequestWithType:(KRequestType)type
{
    switch (type) {
        case kGetVerifyCodeRequest:
        {
        if([RegularTools validateMobile:_loginView.phoneNumTf.text]) {
                [self.loginView createCountDownBtn];
                [self getVerifyCodeRequest];

        }else{
        
            [self remindRegisterStatus:@"请输入正确的手机号码"];
         }
 
        }
            break;
        case kPostLoginRequest:
        {
            // 判断手机号是否11位手机号
            if([RegularTools validateMobile:_loginView.phoneNumTf.text])
            {
                [self postLoginRequest];
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

/**
 *  获取验证码请求
 */
-(void)getVerifyCodeRequest{
#warning 登录页面的验证码请求需要md5解密。暂时未做
   
    
    _phoneNum = self.loginView.phoneNumTf.text;
    
     NSDictionary *params = @{@"phone":_phoneNum, @"version":@"4.2.6", @"system":@"ios", @"channel":@"AppStore", @"machineCode":@"0316B31D-CEAE-4C94-A3F8-F5BB581B0CE3"};
    
    [CFNetWork networkRegisterVerificationCodeRequest:params whileSuccess:^(id responseObject) {
        
        [self remindRegisterStatus:@"对不起，请使用密码登录"];
        
    } orFail:^(id responseObject) {
        
    }];
}

/**
 *  登录请求
 */
-(void)postLoginRequest{

    _phoneNum = self.loginView.phoneNumTf.text;
    _password = self.loginView.passwordTf.text;
    NSDictionary *params = @{@"phone":_phoneNum, @"password":_password, @"remember":@"true", @"system":@"ios", @"longitude":@"113.9513626098633", @"latitude":@"113.9513626098633", @"channel":@"AppStore", @"machineCode":@"0316B31D-CEAE-4C94-A3F8-F5BB581B0CE3"};
    
    [CFNetWork networkUserLoginRequest:params whileSuccess:^(id responseObject) {
        //输入账号和密码之后返回登录成功或失败的信息给用户
        [self remindRegisterStatus:[NSString  stringWithFormat:@"%@", responseObject[@"message"]]];
        //假如匹配登录成功，则将用户信息存入数据库，并且跳转至个人中心
        if ([responseObject[@"message"] isEqualToString:@"登录成功！"]) {
            //用户是一个单例，登录成功后的数据为单例赋值
            CFUserInformationModel *userInfoModel = [CFUserInformationModel sharedInstance];
            [userInfoModel setValuesForKeysWithDictionary:responseObject[@"data"]];
            
            [[FMDBManager sharedInstace] creatTable:userInfoModel];
            [[FMDBManager sharedInstace] insertAndUpdateModelToDatabase:userInfoModel];
            
            [[NSUserDefaults standardUserDefaults] setValue:@"login" forKey:@"loginStatus"];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        
    } orFail:^(id responseObject) {
        
    }];
}

#pragma mark - ====================== 各类触发方法 ==========================

-(void)clickAction:(CFExtensionButton *)sender{
    
    switch (sender.tag) {

            //获取验证码按钮
        case 100:{
            
            [self getRequestWithType:kGetVerifyCodeRequest];
            
        }
            break;
            //登录按钮
        case 101:{
           
            [self getRequestWithType:kPostLoginRequest];
        }
            break;
            
        default:
            break;
    }
}

//点击注册按钮触发事件
-(void)registerBBiDidClicked:(UIBarButtonItem *)bbi{
    //实例化注册控制器并设置导航控制器的根视图
    CFRegisterController *registerVC = [[CFRegisterController alloc] init];
    //跳转至注册页面
    [self.navigationController pushViewController:registerVC animated:NO];
}

//弹框提醒方法
- (void)remindRegisterStatus:(NSString *)info
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:info delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
}
@end