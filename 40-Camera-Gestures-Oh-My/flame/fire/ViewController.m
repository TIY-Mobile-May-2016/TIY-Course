//
//  ViewController.m
//  fire
//
//  Created by Phil Wright on 12/2/13.
//  Copyright (c) 2013 Phil Wright. All rights reserved.
//

#import "ViewController.h"

static const CGFloat kSpeed = 0;

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.slider.hidden = YES;
    NSMutableArray *fireArr = [NSMutableArray array];
    
	for (int i = 1; i <= 29; i++) {
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"flame%d",i] ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
		if (image) [fireArr addObject:image];
    }
	self.fireView.animationImages = fireArr;
	self.fireView.animationDuration = kSpeed;
	[self.fireView startAnimating];
    self.slider.value = 0.5;
}

-(IBAction)changeSpeed:(id)sender
{
    UISlider *s = (UISlider *)sender;
    CGFloat speed = (fabs(s.value * 100) / 10);
    NSLog(@"%0.00f",speed);
    
    [self.fireView stopAnimating];
    self.fireView.animationDuration = speed;
    [self.fireView startAnimating];
}

@end
