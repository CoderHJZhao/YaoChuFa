//
//  CFScanSomeThingViewController.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/6.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFScanSomeThingViewController.h"
// webView控制器
#import "CTWebViewCtrl.h"
@interface CFScanSomeThingViewController ()
{
    NSString *timeString; // 进入次数
}
@end

@implementation CFScanSomeThingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    timeString = @"0";
    self.title = @"扫描";
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.alpha = 0.2;
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.view.alpha = 0.9;
    UIButton * scanButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [scanButton setTitle:@"取消" forState:UIControlStateNormal];
    scanButton.frame = CGRectMake(100, 450, 120, 40);
    scanButton.backgroundColor = [UIColor whiteColor];
    [scanButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scanButton];
    
    UILabel * labIntroudction= [[UILabel alloc] initWithFrame:CGRectMake(15, 70, 290, 45)];
    labIntroudction.backgroundColor = [UIColor clearColor];
    labIntroudction.numberOfLines=2;
    labIntroudction.textColor=[UIColor blackColor];
    labIntroudction.text=@"将二维码图像置于矩形方框内，离手机摄像头10CM左右，系统会自动识别。";
    [self.view addSubview:labIntroudction];
    
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 120, 300, 300)];
    imageView.image = [UIImage imageNamed:@"qr_scanning_frame_bg"];
    [self.view addSubview:imageView];
    
    upOrdown = NO;
    num =0;
    _line = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 220, 2)];
    _line.image = [UIImage imageNamed:@"qr_scanning_line_bg"];
    [self.view addSubview:_line];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
    
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:timer forMode:NSRunLoopCommonModes];
    // 创建设置摄像头
    [self setupCamera];

    // Do any additional setup after loading the view.
}
// 扫描线的动画效果
-(void)animation1
{
    if (upOrdown == NO) {
        num ++;
        _line.frame = CGRectMake(50, 120+2*num, 220, 2);
        if (2*num == 300) {
            upOrdown = YES;
        }
    }
    else {
        num --;
        _line.frame = CGRectMake(50, 120+2*num, 220, 2);
        if (num == 0) {
            upOrdown = NO;
        }
    }
    
}
-(void)backAction
{
    
    [self dismissViewControllerAnimated:YES completion:^{
        [timer invalidate];
    }];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 判断本来是否开启，本来没有开启就开启摄像头
    if (!_session.running) {
        // Start 开启摄像头运行
        [_session startRunning];
    }
}

- (void)setupCamera
{
    // Device （获取手机设备的硬件 —— 摄像头）
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input （获取手机摄像头的输入流设置）
    _input = [AVCaptureDeviceInput deviceInputWithDevice:_device error:nil];
    
    // Output （获取手机摄像头的输出流设置）
    _output = [[AVCaptureMetadataOutput alloc]init];
    // 设置输出流代理AVCaptureMetadataOutputObjectsDelegate
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // Session 硬件配置设置
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    // 加入硬件配置的输入输出流
    // 策略模式：用策略方法去处理逻辑判断，使用者并不需要知道里面的内部实现，它只需要知道对应返回值去判断下一步处理
    
    if ([_session canAddInput:self.input])
    {
        [_session addInput:self.input];
    }
    
    if ([_session canAddOutput:self.output])
    {
        [_session addOutput:self.output];
    }
    /*
     NSString *const  AVMetadataObjectTypeUPCECode ;
     NSString *const  AVMetadataObjectTypeCode39Code ;
     NSString *const  AVMetadataObjectTypeCode39Mod43Code ;
     NSString *const  AVMetadataObjectTypeEAN13Code ;
     NSString *const  AVMetadataObjectTypeEAN8Code ;
     NSString *const  AVMetadataObjectTypeCode93Code ;
     NSString *const  AVMetadataObjectTypeCode128Code ;
     NSString *const  AVMetadataObjectTypePDF417Code ;
     NSString *const  AVMetadataObjectTypeQRCode ;
     NSString *const  AVMetadataObjectTypeAztecCode ;
     NSString *const  AVMetadataObjectTypeInterleaved2of5Code ;
     NSString *const  AVMetadataObjectTypeITF14Code ;
     NSString *const  AVMetadataObjectTypeDataMatrixCode;
     */
    
    // 条码类型 AVMetadataObjectTypeQRCode
    _output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code];
    
    // Preview 二维码图层（花边等图案）
    _prelayer =[AVCaptureVideoPreviewLayer layerWithSession:self.session];
    _prelayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _prelayer.frame =CGRectMake(10,120,300,300);
    [self.view.layer insertSublayer:self.prelayer atIndex:0];
}


#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    // 判断设备是否在运行，如果在运行，停止设备
    if (_session.running) {
        // 扫描成功后调用，解析二维码
        [_session stopRunning];
        NSString *stringValue;
        // 元数据对象
        if ([metadataObjects count] >0)
        {
            // 可读码对象
            AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
            stringValue = metadataObject.stringValue;
            // 调用判断是否连接语句
            if ([self isURLString:stringValue]) {
                CTWebViewCtrl *webViewCtrl = [[CTWebViewCtrl alloc]init];
                webViewCtrl.mediaUrl = stringValue;
                [self.navigationController pushViewController:webViewCtrl animated:YES];
            }
        }
    }
    
}

// 判断是否网络连接
- (BOOL)isURLString:(NSString *)urlString
{
    NSURL *url =[NSURL URLWithString:urlString];
    if (url.scheme) {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
