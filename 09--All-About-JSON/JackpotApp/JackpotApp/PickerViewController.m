//
//  PickerViewController.m
//  JackpotApp
//
//  Created by Phil Wright on 6/2/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) NSMutableArray *numbersArray;

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad");
    
    self.numbersArray = [[NSMutableArray alloc] init];
    
    for(int i=1; i <= 53; i++) {
        [self.numbersArray addObject:[NSString stringWithFormat:@"%i",i]];
    }
}

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear");
    
    NSLog(@"PickerViewController winning ticket %@", self.theWinningTicket.lottoTicketString);
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSLog(@"I changed something");

    NSLog(@"I selected %ld in component %ld", row, component);
    
    
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 6;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.numbersArray.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.numbersArray objectAtIndex:row];
}


@end
