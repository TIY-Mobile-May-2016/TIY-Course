//
//  StarWarsCharacter.m
//  SimpleTableView
//
//  Created by Phil Wright on 5/31/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "StarWarsCharacter.h"

@implementation StarWarsCharacter

+(instancetype)initWithName:(NSString *)n spaceShip:(NSString *)s {
    
    StarWarsCharacter *theCharacter = [[StarWarsCharacter alloc] init];
    theCharacter.name = n;
    theCharacter.spaceship = s;
    
    return theCharacter;
}

@end
