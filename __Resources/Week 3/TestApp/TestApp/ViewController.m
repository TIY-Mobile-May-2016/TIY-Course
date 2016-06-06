//
//  ViewController.m
//  TestApp
//
//  Created by Phil Wright on 6/6/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ViewController.h"
#import "Post.h"

@interface ViewController ()

// 1. Create a property for the Posts Array
@property (nonatomic, strong) NSMutableArray *postsArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self parseJSON];
    
}

-(void)parseJSON {
    // 2. IMPORTANT
    self.postsArray = [[NSMutableArray alloc] init];
    
    // 3. Load the posts.json file into NSString
    NSString *jsonString = [self stringFromJSONFile];
    
    // 4. Convert the jsonString into data
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    // 5. Convert the data into an NSDictionary using NSJSONSerialization
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingAllowFragments error:NULL];
    
    //NSLog(@"jsonDictionary == %@", jsonDictionary);
    
    // 6. Get the results array from the jsonDictionary
    
    NSArray *jsonArray = [jsonDictionary objectForKey:@"results"];
    
    for(NSDictionary *dict in jsonArray) {
        Post *thePost = [[Post alloc] initWithDictionary:dict];
        [self.postsArray addObject:thePost];
    }
    NSLog(@"count of posts == %ld", self.postsArray.count);
}

#pragma mark - Helper Methods

-(NSString *)stringFromJSONFile {
    
    // 1. Get the FilePath from the Bundle
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"posts" ofType:@"json"];
    
    // Load the contents of the file into jsonString
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath
                                                           encoding:NSUTF8StringEncoding
                                                              error:NULL];
    //NSLog(@"%@", jsonString);
    return jsonString;
}

@end
