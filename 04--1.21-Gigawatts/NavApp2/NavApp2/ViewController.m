//
//  ViewController.m
//  NavApp2
//
//  Created by Phil Wright on 5/26/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonTapped:(UIButton *)sender {
    
    NSLog(@"buttonTapped");
    
    // Actually calls the segue on the navigation controller
    [self performSegueWithIdentifier:@"PopupSegue" sender:self];
}



@end
