//
//  RedViewController.m
//  UnwindApp
//
//  Created by Phil Wright on 6/10/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "RedViewController.h"

@interface RedViewController ()
@property (weak, nonatomic) IBOutlet UISlider *ratingSlider;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self updateUI];
}


-(void)updateUI {
    
    self.ratingLabel.text = [NSString stringWithFormat:@"%1.0f", self.currentValue];
    self.ratingSlider.value = self.currentValue;
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    
    self.currentValue = ceilf(self.ratingSlider.value);
    
    [self updateUI];
}



@end
