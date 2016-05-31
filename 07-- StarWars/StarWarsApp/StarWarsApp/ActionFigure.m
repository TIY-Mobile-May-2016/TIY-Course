//
//  ActionFigure.,
//  StarWarsApp
//
//  Created by Phil Wright on 5/31/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ActionFigure.h"

@implementation ActionFigure

-(instancetype)init {
    
    if ( self = [super init] ) {
        
        self.name =@"";
        self.numberOfArms = 2;
        self.numberOfLegs = 2;
        self.numberOfHeads = 1;
        
    }
    return self;
}

-(void)run {
    NSLog(@"%@ is running", self.name);
}

-(void)walk {
    
    NSLog(@"%@ is walking", self.name);
    
}



@end
