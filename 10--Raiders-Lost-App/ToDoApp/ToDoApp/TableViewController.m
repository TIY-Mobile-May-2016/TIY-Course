//
//  TableViewController.h
//  ToDoApp
//
//  Created by Phil Wright on 6/5/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text =@"Test";
    
    return cell;
    
}
- (IBAction)addPost:(UIBarButtonItem *)sender {
    
    NSLog(@"Post");
}



@end
