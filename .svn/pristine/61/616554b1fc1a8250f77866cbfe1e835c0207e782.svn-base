//
//  CFScanSomeThingViewController.h
//  ToStartTravelAround
//
//  Created by mac on 15/8/6.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFParentViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface CFScanSomeThingViewController : CFParentViewController <AVCaptureMetadataOutputObjectsDelegate>
{
    int num;
    BOOL upOrdown;
    NSTimer * timer;
}
@property (strong,nonatomic)AVCaptureDevice * device;     //捕捉硬件设备
@property (strong,nonatomic)AVCaptureDeviceInput * input; // 外界成像输入配置
@property (strong,nonatomic)AVCaptureMetadataOutput * output; // 成像输出配置
@property (strong,nonatomic)AVCaptureSession * session;       // 捕捉设置
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * prelayer; // 图层布局层
@property (nonatomic, retain) UIImageView * line;

@end
