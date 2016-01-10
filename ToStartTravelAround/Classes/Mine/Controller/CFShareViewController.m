
//
//  CFShareViewController.m
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/8.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFShareViewController.h"
#import "UIView+Extension.h"
#import "UMSocialSnsService.h"
#import "UMSocialControllerService.h"
#import "UMSocialSnsPlatformManager.h"

@interface CFShareViewController ()<UMSocialUIDelegate>

@end

@implementation CFShareViewController


-(void)loadView{

    [super loadView];
    
    [self createView];

}

-(void)viewDidLoad{

    [super viewDidLoad];

}

//创建显示的内容
-(void)createView{
    
    UILabel *titleLabel = [[UILabel alloc] init];
    
    titleLabel.frame = CGRectMake(0, 0, IphoneWidth, 30);
    titleLabel.text = @"分享到";
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:titleLabel];
    
    
    UILabel *lineLabel = [[UILabel alloc] init];
    lineLabel.frame = CGRectMake(0, 30, IphoneWidth, 1);
    [self.view addSubview:lineLabel];
    lineLabel.backgroundColor = [UIColor lightGrayColor];
    
    NSArray  *titles = @[@"微信好友", @"朋友圈", @"QQ好友", @"QQ空间", @"新浪微博",@"腾讯微博", @"短信", @"复制"];
    
    NSArray *images  = @[@"share_wechat_icon", @"share_wechat_friend_icon", @"share_qq_icon", @"share_qzone_icon", @"share_weibo_icon",@"share_tweibo_icon", @"share_msg_icon", @"share_copy_icon",];
    
    NSArray *sharePlatform = @[UMShareToWhatsapp, UMShareToWechatFavorite, UMShareToQQ, UMShareToQzone,UMShareToSina, UMShareToTencent, UMShareToSms, UMShareToEmail];
   
   
    CGFloat btnWidth = IphoneWidth *0.2;
    CGFloat btnHeight = IphoneHeight*0.1;
    CGFloat margin = (IphoneWidth*0.2 - 20) / 3;
    
    CGFloat labelHeght = btnHeight*0.5;
    CGFloat labelWidth = btnWidth;
    
    int row = 2;
    int col = 4;
    
    
    NSInteger btnIndex = 0;
    for (int i=0; i<row; i++) {
        
        for (int j=0; j<col; j++) {
            
      CFOwnButton   *shareBtn = [CFOwnButton buttonWithType:UIButtonTypeCustom];
            shareBtn.frame = CGRectMake(10 + j*(btnWidth +margin) , 40+i*(btnHeight +margin +20) , btnWidth, btnHeight);
            [shareBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", images[btnIndex]]]forState:UIControlStateNormal];
            shareBtn.shareType = sharePlatform[btnIndex];
           // NSLog(@"%@", shareBtn.shareType);
            
            shareBtn.tag = 10+i;
            
            [shareBtn addTarget:self action:@selector(shareBtnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:shareBtn];
            
            UILabel *label = [[UILabel alloc] init];
            label.frame = CGRectMake(10 +j*(labelWidth +margin) , 40+btnHeight +i*(btnHeight+ margin + 20), labelWidth, labelHeght);
            
            label.textAlignment = NSTextAlignmentCenter;
            
            label.text = titles[btnIndex];
            label.font = [UIFont systemFontOfSize:13];
            [self.view addSubview:label];
            btnIndex++;
        }
    }
}

-(void)shareBtnDidClicked:(CFOwnButton *)btn{
    
    
        NSString *shareText = @"享受轻松愉快的旅游，不必远方，要出发周边游";
        UIImage *shareImg = [UIImage imageNamed:@"AppIcon57x57"];

    if (btn.tag) {
        
       
        [[UMSocialControllerService defaultControllerService] setShareText:shareText shareImage: shareImg socialUIDelegate:self];        //设置分
        
        [UMSocialSnsPlatformManager getSocialPlatformWithName:btn.shareType].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
    }
}


-(BOOL)closeOauthWebViewController:(UINavigationController *)navigationCtroller socialControllerService:(UMSocialControllerService *)socialControllerService
{
    return NO;
}

/**
 关闭当前页面之后
 
 @param fromViewControllerType 关闭的页面类型
 
 */
-(void)didCloseUIViewController:(UMSViewControllerType)fromViewControllerType
{
   // NSLog(@"%s", __func__);
}

/**
 各个页面执行授权完成、分享完成、或者评论完成时的回调函数
 
 @param response 返回`UMSocialResponseEntity`对象，`UMSocialResponseEntity`里面的viewControllerType属性可以获得页面类型
 */
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
   // NSLog(@"%s", __func__);
}

@end
