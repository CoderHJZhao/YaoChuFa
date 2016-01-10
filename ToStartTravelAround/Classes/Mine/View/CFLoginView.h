//
//  CFLoginView.h
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFParentView.h"
#import "CFExtensionButton.h"
@interface CFLoginView : CFParentView
@property (weak, nonatomic) IBOutlet UILabel *lineLabelphone;
@property (weak, nonatomic) IBOutlet UILabel *lineLabelPassword;
@property (weak, nonatomic) IBOutlet UILabel *lineLabelGetCode;
@property (weak, nonatomic) IBOutlet UILabel *LineLabellogin;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTf;
@property (weak, nonatomic) IBOutlet CFExtensionButton *getCodeBtn;

-(void)createCountDownBtn;
-(void)stopCountDownBtn;
@end
