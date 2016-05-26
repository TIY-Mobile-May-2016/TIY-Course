//
//  PopupViewController.m
//  NavApp2
//
//  Created by Phil Wright on 5/26/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "PopupViewController.h"

@interface PopupViewController ()

@end

@implementation PopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)closeButtonTapped:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
