//
//  MoviePosterViewController.m
//  JSONApp
//
//  Created by Phil Wright on 6/6/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "MoviePosterViewController.h"

@interface MoviePosterViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation MoviePosterViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.theMovie != nil) {
        
        self.titleLabel.text = self.theMovie.originalTitle;
        
        // 1. Load the image from the urlString
        UIImage *theImage = [self imageFromURLString:self.theMovie.posterPath];
        
        self.posterImageView.image = theImage;
        
        NSLog(@"title: %@", self.theMovie.originalTitle);
        NSLog(@"posterPath: %@", self.theMovie.posterPath);
    }
}

-(UIImage *)imageFromURLString:(NSString *)urlString {
    
    UIImage *theImage = nil;
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSLog(@"Attempting to Load urlString == %@", urlString);
    
    if(url) {
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        if(data) {
            theImage = [UIImage imageWithData:data];
        }
    }
    return theImage;
}

@end
