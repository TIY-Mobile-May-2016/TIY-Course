//
//  ViewController.m
//  UnwindApp
//
//  Created by Phil Wright on 6/10/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "ViewController.h"
#import "RedViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (nonatomic, assign) float rating;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rating = 1;
    self.ratingLabel.text =@"1";
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"RatingSegue"]) {
        
        RedViewController *controller = (RedViewController *)segue.destinationViewController;
        controller.currentValue = self.rating;
    }
    
}


-(IBAction)unwindForSegue:(UIStoryboardSegue *)segue {
    
    
    
    NSLog(@"unwindSegue called");
    
    
    RedViewController *redController = (RedViewController *)segue.sourceViewController;
    
    self.rating = redController.currentValue;
    
    NSLog(@"%2.2f", self.rating);
    
    self.ratingLabel.text = [NSString stringWithFormat:@"%2.0f", self.rating];
    
}

@end
