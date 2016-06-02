//
//  ViewController.m
//  TextFieldApp
//
//  Created by Phil Wright on 5/27/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ViewController.h"

// Step 1 add the delegate protocol in < >

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *dateTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    NSLog(@"return key pressed");
    
    // This will remove the keyboard from the app
    [self.dateTextField resignFirstResponder];
    
    return YES;
}



@end
