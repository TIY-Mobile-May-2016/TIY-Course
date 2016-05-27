//
//  ViewController.m
//  UnwindSegueApp
//
//  Created by Phil Wright on 5/27/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (IBAction)unwindSegue:(UIStoryboardSegue *)segue {
    
    NSLog(@"unwindSegue");
    
    [self reset];
    
}


- (IBAction)travelBackTapped:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"PopupSegue" sender:nil];
}

-(void)reset {
    NSLog(@"Reset");
    
    // set milesPerHour = 0
    // set
}


@end
