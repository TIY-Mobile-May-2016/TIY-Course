//
//  Post.h
//  ToDoApp
//
//  Created by Phil Wright on 6/6/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

-(instancetype)initWithDictionary:(NSDictionary *)dict;

@property (nonatomic, strong) NSNumber *postId;
@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;

@end
