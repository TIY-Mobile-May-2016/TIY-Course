//
//  ViewController.m
//  QAApp
//
//  Created by Phil Wright on 5/26/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    int currentIndex;
}


@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@property (strong, nonatomic) NSMutableArray *questionsArray;
@property (strong, nonatomic) NSMutableArray *answersArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // call the method to setup the view
    
    [self setup];
    
    // Call Method for Updating the User Interface
    [self updateUI];
    
    // 4. Loop through the elements of the array and print them out
    
    for(NSString *question in self.questionsArray) {
        
        NSLog(@"Question is equal to %@", question);
        
    }
    
    // 5. Loop through the elements of the answers array
    
    for(NSString *answer in self.answersArray) {
        
        NSLog(@"Answer is equal to %@", answer);
        
    }
    
}

-(void)setup {
    
    // Do some tasks when the view loads
    
    // 1. Initialize the Arrays
    
    currentIndex = 0;
    
    self.questionsArray = [[NSMutableArray alloc] init];
    self.answersArray = [[NSMutableArray alloc] init];
    
    
    // 2. Add Objects to the Arrays
    
    [self.questionsArray addObject:@"What color is the sky"];
    [self.questionsArray addObject:@"Roses Are Red"];
    [self.questionsArray addObject:@"What color is the Iron Yard Logo"];
    [self.questionsArray addObject:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu ligula porttitor, tristique ex eget, bibendum purus. Cras ante libero, porttitor vitae sagittis eget, congue eu odio. Sed consectetur, leo commodo pharetra hendrerit, mauris justo dignissim quam, sit amet vulputate odio ante pretium ante."];
    
    
    //NSLog(@"question == %@", [self.questionsArray objectAtIndex:0]);
    
    [self.answersArray addObject:@"Blue"];
    [self.answersArray addObject:@"Violets Are Blue"];
    [self.answersArray addObject:@"Dark Gray"];
    [self.answersArray addObject:@"YellowRed"];
    
    // 3. Print out the maximum count of each array
    
    NSLog(@"%lu", [self.answersArray count]);
    NSLog(@"%lu", self.questionsArray.count);
    
}

// Update the User Interface

-(void)updateUI {
    
    // Add the Question and Answer to the Label Text
    
    self.questionLabel.text = [self.questionsArray objectAtIndex:currentIndex];
    self.answerLabel.text = [self.answersArray objectAtIndex:currentIndex];
    
}

- (IBAction)nextQuestionTapped:(UIButton *)sender {
    
    // Add one to the index
    
    currentIndex = currentIndex + 1;
    
    // Check to see if we are at the end of the questions list
    
    if(currentIndex >= self.questionsArray.count) {
        currentIndex = 0;
    }
    
    // Call Method for Updating the User Interface
    [self updateUI];
    
    NSLog(@"nextQuestionTapped");
    
}



@end
