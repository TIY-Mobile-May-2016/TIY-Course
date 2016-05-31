//
//  ViewController.m
//  SimpleTableView
//
//  Created by Phil Wright on 5/31/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ViewController.h"
#import "StarWarsCharacter.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *charactersArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setup the array
    
    self.charactersArray = [[NSMutableArray alloc] init];
    
    StarWarsCharacter *luke = [[StarWarsCharacter alloc] initWithName:@"Luke Skyewalker" spaceShip:@"X-Wing"];
    [self.charactersArray addObject:luke];
    
    StarWarsCharacter *leia = [[StarWarsCharacter alloc] init];
    leia.name =@"Princess Leia";
    leia.spaceship =@"Millenium Falcon";
    
    [self.charactersArray addObject:leia];
    
    
//    [self.charactersArray addObject:@"Chris"];
//    [self.charactersArray addObject:@"Taylor"];
//    [self.charactersArray addObject:@"Jason"];
//    [self.charactersArray addObject:@"Garrett"];
//    [self.charactersArray addObject:@"Joe"];

}


// Delegate Method that returns the number of rows that I want in the tableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.charactersArray count];
    
}

// Creates all of the cells for the tableView
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Create an instance of the UITableViewCell class
    // By calling the method dequeReusableCellWithIdentifer method on the tableView object
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // UILabel called textLabel that displays in the TableViewCell
    
    // Temporary pointer to one character in the array
    StarWarsCharacter *theCharacter = [self.charactersArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = theCharacter.name;
    
    // returns the actual tableViewCell
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"I clicked on row %ld", indexPath.row);
    
}


@end
