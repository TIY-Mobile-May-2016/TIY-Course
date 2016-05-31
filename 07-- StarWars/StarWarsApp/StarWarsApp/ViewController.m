//
//  ViewController.m
//  StarWarsApp
//
//  Created by Phil Wright on 5/31/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ViewController.h"
#import "ActionFigure.h"
#import "SuperHeroActionFigure.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *charactersArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ActionFigure *taylor = [[ActionFigure alloc] init];
    taylor.name =@"Taylor";
    
    
    ActionFigure *joe = [[ActionFigure alloc] init];
    joe.name = @"Joe";
    
    [joe run];
    
    [taylor walk];
    
    
    SuperHeroActionFigure *superman = [[SuperHeroActionFigure alloc] init];
    
    superman.name = @"Superman";
    
    [superman fly];
    
    
    
    
    
}

@end
