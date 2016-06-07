//
//  Artist.h
//  SpotifyTest
//
//  Created by Phil Wright on 6/7/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject

-(instancetype) initWithDictionary:(NSDictionary *)dict;

@property (nonatomic,strong) NSString *artistId;
@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *url640String;
@property (nonatomic,strong) NSString *url320String;
@property (nonatomic,strong) NSString *thumbnailURLString;


@end
