//
//  RTViewController.m
//  iOS7LongShadowDemo
//
//  Created by ricky on 14-3-28.
//  Copyright (c) 2014年 ricky. All rights reserved.
//

#import "RTViewController.h"
#import "RTLongShadowView.h"

@interface RTViewController ()
@property (nonatomic, assign) IBOutlet RTLongShadowView *longShadow;
@end

@implementation RTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSwitch:(UISwitch *)onoff
{
    self.longShadow.shadowOn = onoff.isOn;
}

@end
