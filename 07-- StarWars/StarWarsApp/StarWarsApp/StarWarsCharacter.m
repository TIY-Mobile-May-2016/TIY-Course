//
//  StarWarsCharacter.m
//  StarWarsApp
//
//  Created by Phil Wright on 5/31/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "StarWarsCharacter.h"

@implementation StarWarsCharacter

-(instancetype)init {
    
    if ( self = [super init] ) {

    }
    return self;
    
}


-(void)flySpaceship {
    
    NSLog(@"%@ flies an %@", self.name, self.spaceship);
}

@end
