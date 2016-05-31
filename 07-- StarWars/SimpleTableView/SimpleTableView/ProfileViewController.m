//
//  ProfileViewController.m
//  SimpleTableView
//
//  Created by Phil Wright on 5/31/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *spaceshipLabel;

@end

@implementation ProfileViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.nameLabel.text = self.theCharacter.name;
    self.spaceshipLabel.text = self.theCharacter.spaceship;
    
}


@end
