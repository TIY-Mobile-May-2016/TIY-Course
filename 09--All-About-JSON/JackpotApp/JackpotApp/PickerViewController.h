//
//  PickerViewController.h
//  JackpotApp
//
//  Created by Phil Wright on 6/2/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"

@interface PickerViewController : UIViewController
@property (strong, nonatomic) Ticket *theWinningTicket;
@end
