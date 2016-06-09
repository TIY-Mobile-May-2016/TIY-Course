//
//  MenuViewController.m
//  NavApp
//
//  Created by Phil Wright on 6/9/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(IBAction)menuButtonTapped:(id)sender {
    [self performSegueWithIdentifier:@"RestaurantsSegue" sender:nil];
}


#pragma mark - Navigation Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}

@end
