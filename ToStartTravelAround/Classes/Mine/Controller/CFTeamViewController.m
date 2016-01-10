//
//  CFTeamViewController.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFTeamViewController.h"
#import "CFWebViewController.h"
@interface CFTeamViewController ()

@end

@implementation CFTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开发团队";
}
- (IBAction)blogLink:(UIButton *)sender {
    CFWebViewController *webView = [[CFWebViewController alloc]init];
    webView.title = @"技术博客";
    webView.url = sender.currentTitle;
    [self.navigationController pushViewController:webView animated:YES];
}


@end
