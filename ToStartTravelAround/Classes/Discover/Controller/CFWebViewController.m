//
//  CFWebViewController.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFWebViewController.h"

@interface CFWebViewController ()<UIWebViewDelegate>
{
    UIWebView *_webView;
}
@end

@implementation CFWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    _webView.delegate = self;
    NSURL *url = [NSURL URLWithString:self.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
    // Do any additional setup after loading the view.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSMutableString *js = [NSMutableString string];
    [js appendString:@"var header = document.getElementsByTagName('header')[0];"];
    [js appendString:@"header.parentNode.removeChild(header);"];
    [webView stringByEvaluatingJavaScriptFromString:js];
    
    
    NSString *html = [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML;"];
    NSLog(@"%@",html);
}
@end
