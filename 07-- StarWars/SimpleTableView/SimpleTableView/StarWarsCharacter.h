//
//  StarWarsCharacter.h
//  SimpleTableView
//
//  Created by Phil Wright on 5/31/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StarWarsCharacter : NSObject

+(instancetype)initWithName:(NSString *)name spaceShip:(NSString *)spaceship;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *spaceship;

@end
