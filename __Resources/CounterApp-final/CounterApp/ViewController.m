//
//  ViewController.m
//  CounterApp
//
//  Created by Phil Wright on 5/16/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) NSUInteger count;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.count = [self randomInteger];
    
    [self updateUI];
}

-(void)updateUI {
    self.stepper.value = (double)self.count;
    self.slider.value = (float)self.count;
    self.countLabel.text = [NSString stringWithFormat:@"%ld", self.count];
}

-(NSUInteger)randomInteger {
    return arc4random_uniform(100) + 1;
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    
    NSLog(@"sliderValueChanged");
    
    self.count = (int)sender.value;
    [self updateUI];
}


- (IBAction)stepperChanged:(UIStepper *)sender {
    
    NSLog(@"stepperChanged");
    
    self.count = (int)sender.value;
    [self updateUI];
}

@end
