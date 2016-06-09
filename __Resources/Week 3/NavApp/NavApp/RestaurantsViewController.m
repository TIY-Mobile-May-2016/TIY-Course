//
//  RestaurantsViewController.m
//  NavApp
//
//  Created by Phil Wright on 6/9/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "RestaurantsViewController.h"
#import "MenusViewController.h"
#import "RestaruantTableViewCell.h"
#import "Restaurant.h"

@interface RestaurantsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *restaurantsArray;

@property (strong, nonatomic) Restaurant *currentRestaurant;
@end

@implementation RestaurantsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.restaurantsArray = [[NSMutableArray alloc] init];
    
    [self seedArray];

}

#pragma mark - Seed Data

-(void)seedArray {
    
    Restaurant *oliveGarden = [[Restaurant alloc] init];
    oliveGarden.name = @"Olive Garden";
    oliveGarden.imageNameString =@"olivegarden";
    
    [self.restaurantsArray addObject:oliveGarden];
    
}

#pragma mark - Table View Delegate Methods


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.restaurantsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RestaruantTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RestaurantCell" forIndexPath:indexPath];
    
    Restaurant *theRestaurant = [self.restaurantsArray objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = theRestaurant.name;
    cell.resturantImageView.image = [UIImage imageNamed:theRestaurant.imageNameString];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"did Select");
    
    self.currentRestaurant = [self.restaurantsArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"MenusSegue" sender:nil];
    
}


#pragma mark - Navigation Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"MenusSegue"]) {
        
        MenusViewController *controller = (MenusViewController *) segue.destinationViewController;
        controller.theResturant = self.currentRestaurant;
        
        
        
        
    }
    
}

@end
