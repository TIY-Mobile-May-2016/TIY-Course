//
//  ViewController.m
//  TimerApp
//
//  Created by Phil Wright on 5/26/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    int milesPerHour;
}

@property (weak, nonatomic) IBOutlet UILabel *milageLabel;
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. Set milesperhour to zero
    
    milesPerHour = 0;
    
    // 1. Create the Timer
    
    float speed = 0.1; // lower number is faster
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:speed
                                                  target:self
                                                selector:@selector(updateMiles)
                                                userInfo:nil
                                                 repeats:YES];

}

-(void)updateMiles {
    
    milesPerHour = milesPerHour + 1;
    
    if(milesPerHour == 10) {
        [self.timer invalidate];
    }
    
    self.milageLabel.text = [NSString stringWithFormat:@"%i", milesPerHour];
    
    NSLog(@"updateMiles");
}


@end
