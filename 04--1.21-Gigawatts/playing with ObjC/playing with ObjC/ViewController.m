//
//  ViewController.m
//  playing with ObjC
//
//  Created by Christopher Myers on 5/25/16.
//  Copyright © 2016 DragomanDevelopers, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (strong, nonatomic) NSDateFormatter *formatter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.formatter = [[NSDateFormatter alloc] init];
    self.formatter.dateFormat =@"MMM d, yyyy";
    
    NSDate *today = [NSDate date]; // give me the current date and time
    
    NSLog(@"today == %@", [self.formatter stringFromDate:today]);
    
    NSDate *ourDate = [self.formatter dateFromString:@"Dec 25, 2000"];
    
    // Changing the format that the date displays
    self.formatter.dateFormat =@"E, d MMM yyyy HH:mm:ss Z";
    
    NSLog(@"ourDate == %@", [self.formatter stringFromDate:ourDate]);
    
    
}

- (IBAction)checkDateTapped:(UIButton *)sender {
    
    NSLog(@"checkDate");
    
    self.formatter.dateFormat =@"MMddyy";
    
    NSString *theDateString = self.dateTextField.text;
    
    NSLog(@"the text field has %@", theDateString);
    
    NSDate *theDate = [self.formatter dateFromString:theDateString];
    
    NSLog(@"theDate == %@", theDate);
    
    self.formatter.dateFormat =@"MMM d, yyyy";
    
    self.dateLabel.text = [self.formatter stringFromDate:theDate];
    
}


@end

