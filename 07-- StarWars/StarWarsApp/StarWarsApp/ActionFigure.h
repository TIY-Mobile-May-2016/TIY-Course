//
//  ActionFigure.h
//  StarWarsApp
//
//  Created by Phil Wright on 5/31/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

// Public properties and methods

@interface ActionFigure : NSObject

@property (strong, nonatomic) NSString *name;

@property (assign, nonatomic) NSUInteger numberOfLegs;

@property (assign, nonatomic) NSUInteger numberOfArms;

@property (assign, nonatomic) NSUInteger numberOfHeads;

@property (strong, nonatomic) NSString *gender;

-(void)run;

-(void)walk;

@end
