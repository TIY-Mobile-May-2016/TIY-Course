//
//  Post.m
//  ToDoApp
//
//  Created by Phil Wright on 6/6/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "Post.h"

@implementation Post

-(instancetype)initWithDictionary:(NSDictionary *)dict {
    if ( self = [super init] ) {
        self.title = [dict objectForKey:@"title"];
        self.body = [dict objectForKey:@"body"];
        self.userId = [dict objectForKey:@"userId"];
        self.postId = [dict objectForKey:@"id"];
    }
    return self;
}

@end
