//
//  ViewController.m
//  FTPopOverMenu
//
//  Created by liufengting on 16/4/5.
//  Copyright © 2016年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import "ViewController.h"
#import "FTPopOverMenu.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (IBAction)showMenuFromButton:(UIButton *)sender
{
    
    // Do any of the following setting to set the style (Only set what you want to change)
    // Maybe do this when app starts (in AppDelegate) or anywhere you wanna change the style.

    
    // uncomment the following line to use custom settings.
    
//#define USE_CUSTOM_SETTINGS

#ifdef USE_CUSTOM_SETTINGS
    FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
    configuration.menuRowHeight = 80;
    configuration.menuWidth = 120;
    configuration.textColor = [UIColor orangeColor];
    configuration.textFont = [UIFont boldSystemFontOfSize:14];
    configuration.tintColor = [UIColor whiteColor];
    configuration.borderColor = [UIColor blackColor];
    configuration.borderWidth = 0.5;
//    configuration.textAlignment = NSTextAlignmentCenter;
//    configuration.ignoreImageOriginalColor = YES;// set 'ignoreImageOriginalColor' to YES, images color will be same as textColor

#endif
    
    
    
    // supports image name, UIImage, image remote URL (NSURL), image remote URL string
    
    NSString *icomImageURLString = @"https://avatars1.githubusercontent.com/u/4414522?v=3&s=40";
    
    NSURL *icomImageURL = [NSURL URLWithString:icomImageURLString];

    [FTPopOverMenu showForSender:sender
                   withMenuArray:@[@"MenuOne", @"MenuTwo", @"MenuThree", @"MenuFour",]
                      imageArray:@[icomImageURLString, icomImageURL, [UIImage imageNamed:@"Pokemon_Go_03"], @"Pokemon_Go_04"]
                       doneBlock:^(NSInteger selectedIndex) {
                           
                           NSLog(@"done block. do something. selectedIndex : %ld", (long)selectedIndex);
                           
                       } dismissBlock:^{
                           
                           NSLog(@"user canceled. do nothing.");
                           
//                           FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
//                           configuration.allowRoundedArrow = !configuration.allowRoundedArrow;
                           
                       }];
    
    
    
}

- (IBAction)NOThree:(id)sender {
    
    FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
    configuration.menuRowHeight = 40;
    configuration.menuWidth = 60;
    configuration.textColor = [UIColor whiteColor];
    configuration.textFont = [UIFont systemFontOfSize:13];
    configuration.tintColor = [UIColor blackColor];
    configuration.borderColor = [UIColor colorWithRed:52.f/255.f green:56.f/255.f blue:67/255.f alpha:1];
    configuration.borderWidth = 0.5;
    configuration.denyArrow = YES;
    configuration.textAlignment = NSTextAlignmentCenter;
    configuration.allowRoundedArrow = NO;
    configuration.allowseparter = NO;
    NSArray *menuarr = @[@"3分",@"15分",@"2时",@"4时",@"6时",@"12时",@"周线"];
    [FTPopOverMenu showForSender:sender withMenuArray:menuarr doneBlock:^(NSInteger selectedIndex) {
        [sender setTitle:menuarr[selectedIndex] forState:UIControlStateNormal];
        
    } dismissBlock:^{
        
    }];
}

- (IBAction)haveseparate:(id)sender {
    FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
    configuration.menuRowHeight = 40;
    configuration.menuWidth = 60;
    configuration.textColor = [UIColor whiteColor];
    configuration.textFont = [UIFont systemFontOfSize:13];
    configuration.tintColor = [UIColor blackColor];
    configuration.borderColor = [UIColor colorWithRed:52.f/255.f green:56.f/255.f blue:67/255.f alpha:1];
    configuration.borderWidth = 0.5;
    configuration.denyArrow = NO; //可不传 默认还是箭头
    configuration.textAlignment = NSTextAlignmentCenter;
    configuration.allowRoundedArrow = YES;
    configuration.allowseparter = YES;
    NSArray *menuarr = @[@"3分",@"15分",@"2时",@"4时",@"6时",@"12时",@"周线"];
    [FTPopOverMenu showForSender:sender withMenuArray:menuarr doneBlock:^(NSInteger selectedIndex) {
        [sender setTitle:menuarr[selectedIndex] forState:UIControlStateNormal];
        
    } dismissBlock:^{
        
    }];
}

@end
