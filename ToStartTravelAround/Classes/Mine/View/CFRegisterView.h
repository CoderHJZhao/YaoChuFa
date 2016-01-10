//
//  CFRegisterView.h
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/3.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFParentView.h"
#import "CFExtensionButton.h"
@interface CFRegisterView : CFParentView
@property (weak, nonatomic) IBOutlet UIView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UITextField *getCodeTf;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTf;
@property (weak, nonatomic) IBOutlet UILabel *lineLabelPhone;
@property (weak, nonatomic) IBOutlet UILabel *lineLabelCode;
@property (weak, nonatomic) IBOutlet UILabel *lineLabelPassword;
@property (weak, nonatomic) IBOutlet UILabel *lineLabelRegister;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf;
@property (weak, nonatomic) IBOutlet CFExtensionButton *getCodeBtn;


-(void)createCountDownBtn;
-(void)stopCountDownBtn;
-(void)stateNomalBtn;
@end
