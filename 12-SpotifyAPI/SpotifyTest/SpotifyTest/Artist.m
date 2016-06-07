//
//  Artist.m
//  SpotifyTest
//
//  Created by Phil Wright on 6/7/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "Artist.h"

@implementation Artist

-(instancetype) initWithDictionary:(NSDictionary *)dict {
    
    if ( (self = [super init])) {
        //NSLog(@"dict == %@",dict);
        
        //NSLog(@"name == %@",[itemDict valueForKey:@"name"]);
        
        self.name = [dict valueForKey:@"name"];
        
        //NSLog(@"id == %@",[itemDict valueForKey:@"id"]);
        
        self.artistId = [dict valueForKey:@"id"];
        
        
        // get the images array
        
        NSArray *imagesArray = [dict valueForKey:@"images"];
        
    }
    return self;
}


@end

