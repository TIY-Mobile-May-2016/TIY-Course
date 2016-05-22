//
//  ViewController.h
//  CounterApp
//
//  Created by Phil Wright on 5/16/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    // This is called an instance variable; in this case it can contain a whole number, e.g. 1,2,3...
    int currentCount;
}

// These are called properties; they connect elements in the storyboard with the code so you can update the UI elements from code.
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // This allows the app to set its current count when the app first loads.
    // The line below simply generates a random number and then makes sure it falls within the bounds 1-100.
    currentCount = arc4random() % 100;
    
    //
    // 1. Once the currentCount variable is set, each of the UI elements on the screen need to be updated to match the currentCount.
    //    There is a method below that performs these steps. All you need to do perform a method call in the line below.
    //
    
    [self <#Name of method#>];
}

- (void)updateViewsWithCurrentCount
{
    // Here we are updating the different subviews in our main view with the current count.
    
    //
    // 2. The textfield needs to always show the current count. Fill in the blank below to set the text value of the textfield.
    //
    self.counterLabel.text = [NSString stringWithFormat:@"%ld", (long)<#variable name#>];
    
    //
    // 3. Here we are setting the value property of the UISlider in the view. This causes the slider to set it's handle to the
    //    appropriate position. Fill in the blank below.
    //
    self.slider.value = <#variable name#>;
    
    //
    // 4. We also need to update the value of the UIStepper. The user will not see any change to the stepper, but it needs to have a
    //    current value nonetheless, so when + or - is tapped, it will know what value to increment. Fill in the blanks below.
    //
    self.stepper.<#what are we setting?#> = <#variable name#>;
}

#pragma mark - Action Handlers

- (IBAction)sliderValueChanged:(UISlider *)sender
{
    //
    // 5. This method will run whenever the value of the slider is changed by the user. The "sender" object passed in as an argument
    //    to this method represents the slider from the view. We need to take the value of the slider and use it to update the
    //    value of our "currentCount" instance variable. Fill in the blank below.
    //
    currentCount = sender.<#what property should we use here to set our currentCount?#>;
    
    //
    // 6. Once we update the value of currentCount, we need to make sure all the UI elements on the screen are updated to keep
    //    everything in sync. We have previously done this (look in viewDidLoad). Fill in the blank below.
    //
    <#What instruction should go here?#>
}

- (IBAction)stepperValueChanged:(UIStepper *)sender
{
    //
    // 7. This method is run when the value of the stepper is changed by the user. If you've done steps 5 and 6 already, these steps
    //    should look pretty familiar, hint, hint. ;) Fill in the blanks below.
    //
    currentCount = <#What goes here?#>;
    <#How about here?#>
}

@end
