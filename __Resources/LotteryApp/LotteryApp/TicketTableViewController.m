//
//  TicketTableViewController.m
//  LotteryApp
//
//  Created by Phil Wright on 6/1/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "TicketTableViewController.h"
#import "Ticket.h"

@interface TicketTableViewController ()
@property (nonatomic, strong) NSMutableArray *ticketsArray;
@property (nonatomic, strong) Ticket *winningTicket;
@end

@implementation TicketTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self chooseWinningTicket];
    
    self.ticketsArray = [[NSMutableArray alloc] init];
    
}

-(void)chooseWinningTicket {
    
    self.winningTicket = [[Ticket alloc] init];
    
    // randomly generate numbers between 1 and 53
    
    // arc4random
    
    self.winningTicket.lotteryTicket =@"1 34 32 53 23 3";
    
}

#pragma mark - Table view delegate methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"the cell at %ld was tapped", indexPath.row);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ticketsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TicketCell" forIndexPath:indexPath];
    
    Ticket *theTicket = [self.ticketsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = theTicket.lotteryTicket;
    
    return cell;
}

#pragma mark - Action Methods

- (IBAction)addTicket:(UIBarButtonItem *)sender {
    
    NSLog(@"addTicket");
    
    Ticket *ticket = [[Ticket alloc] init];
    ticket.lastName =@"Wright";
    ticket.firstName =@"Phil";
    ticket.lotteryTicket =@"1 5 6 7 82 2 5";
    
    [self.ticketsArray addObject:ticket];
    
    [self.tableView reloadData];
}

- (IBAction)checkTicketTapped:(UIBarButtonItem *)sender {
    
    NSLog(@"check Ticket Tapped");
    
    [self performSegueWithIdentifier:@"PickerSegue" sender:self];
    
}




@end
