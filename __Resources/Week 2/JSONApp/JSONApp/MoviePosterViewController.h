//
//  MoviePosterViewController.h
//  JSONApp
//
//  Created by Phil Wright on 6/6/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MoviePosterViewController : UIViewController

// Create a Public Property that is accessible outside myself
@property (strong, nonatomic) Movie *theMovie;

@end
