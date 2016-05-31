//
//  StarWarsCharacter.h
//  StarWarsApp
//
//  Created by Phil Wright on 5/31/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StarWarsCharacter : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *spaceship;

-(void)flySpaceship;

@end
