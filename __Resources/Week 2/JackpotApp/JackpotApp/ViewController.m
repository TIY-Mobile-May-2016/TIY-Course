//
//  ViewController.m
//  JackpotApp
//
//  Created by Phil Wright on 6/2/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ViewController.h"
#import "Ticket.h"
#import "PickerViewController.h"

@interface ViewController ()
@property (nonatomic, strong) Ticket *winningTicket;
@property (nonatomic, strong) NSMutableArray *ticketsArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ticketsArray = [[NSMutableArray alloc] init];
    
    self.winningTicket = [self ticketWithRandomNumber];
    
    Ticket *randomT = [self ticketWithRandomNumber];
    
    if ([self.winningTicket.lottoTicketString isEqualToString:randomT.lottoTicketString]) {
        NSLog(@"equal");
    } else {
        NSLog(@"not equal");
    }
    
    NSLog(@"Winning Number is:%@",self.winningTicket.lottoTicketString);
}

-(Ticket *)ticketWithRandomNumber {
    Ticket *t = [[Ticket alloc] init];
    t.lottoTicketString = [self generateRandomNumberString];
    return t;
}

-(NSString *)generateRandomNumberString {
    
    int num1 = arc4random_uniform(53) + 1;
    int num2 = arc4random_uniform(53) + 1;
    int num3 = arc4random_uniform(53) + 1;
    int num4 = arc4random_uniform(53) + 1;
    int num5 = arc4random_uniform(53) + 1;
    int num6 = arc4random_uniform(53) + 1;
    
    
    return [NSString stringWithFormat:@"%i %i %i %i %i %i", num1, num2, num3, num4, num5, num6];
}

- (IBAction)addTicket:(UIBarButtonItem *)sender {
    
    Ticket *theTicket = [self ticketWithRandomNumber];
    [self.ticketsArray addObject:theTicket];
}

- (IBAction)checkStatusTapped:(UIBarButtonItem *)sender {
   
    // Called First
    [self performSegueWithIdentifier:@"PickerSegue" sender:nil];
    
    // delegate calls perpareForSegue
    
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSLog(@"perapreForSegue called %@", segue.identifier);
    
    // 1. Get the new view controller using [segue destinationViewController].
    PickerViewController *controller = segue.destinationViewController;
    
    // 2. Pass the selected object to the new view controller.
    controller.theWinningTicket = self.winningTicket;
}


@end
