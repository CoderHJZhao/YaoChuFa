//
//  CFExtensionButton.h
//  ToStartTravelAround
//
//  Created by SkyWalker on 15/8/4.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CFExtensionButton;

typedef NSString* (^DidChangeBlock)(CFExtensionButton *countDownButton,int second);
typedef NSString* (^DidFinishedBlock)(CFExtensionButton *countDownButton,int second);

typedef void (^TouchedDownBlock)(CFExtensionButton *countDownButton,NSInteger tag);


@interface CFExtensionButton : UIButton
{
    int _second;
    int _totalSecond;
    
    NSTimer *_timer;
    NSDate *_startDate;
    
    DidChangeBlock _didChangeBlock;
    DidFinishedBlock _didFinishedBlock;
    TouchedDownBlock _touchedDownBlock;
}
//@property(nonatomic,strong)UIColor *changeFontColor;
//@property(nonatomic,strong)UIColor *normalFontColor;
-(void)addToucheHandler:(TouchedDownBlock)touchHandler;

-(void)didChange:(DidChangeBlock)didChangeBlock;
-(void)didFinished:(DidFinishedBlock)didFinishedBlock;
-(void)startWithSecond:(int)second;
- (void)stop;
@end
