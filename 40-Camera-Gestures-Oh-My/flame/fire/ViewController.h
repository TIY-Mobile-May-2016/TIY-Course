//
//  ViewController.h
//  fire
//
//  Created by Phil Wright on 12/2/13.
//  Copyright (c) 2013 Phil Wright. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(IBAction)changeSpeed:(id)sender;

@property (nonatomic,weak) IBOutlet UIImageView *fireView;
@property (nonatomic,weak) IBOutlet UISlider *slider;
@end
