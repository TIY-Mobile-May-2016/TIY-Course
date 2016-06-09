//
//  MenusViewController.m
//  NavApp
//
//  Created by Phil Wright on 6/9/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "MenusViewController.h"

@interface MenusViewController ()

@end

@implementation MenusViewController


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if(self.theResturant != nil) {
        
        NSLog(@"name == %@", self.theResturant.name);
        
    }
}


@end
