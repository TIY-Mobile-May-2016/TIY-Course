//
//  StarWarsCharacter.m
//  SimpleTableView
//
//  Created by Phil Wright on 5/31/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "StarWarsCharacter.h"

@implementation StarWarsCharacter

-(instancetype)initWithName:(NSString *)n spaceShip:(NSString *)s {
    
    if ( self = [super init] ) {
        self.name = n;
        self.spaceship = s;
    }
    return self;
}

@end
