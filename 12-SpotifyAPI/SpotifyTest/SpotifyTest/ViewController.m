//
//  ViewController.m
//  SpotifyTest
//
//  Created by Phil Wright on 6/7/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ViewController.h"
#import "Artist.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *artistsArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // IMPORTANT
    self.artistsArray = [[NSMutableArray alloc] init];

    // 1. load json string
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"wham" ofType:@"json"];
    
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    //NSLog(@"jsonString == %@", jsonString);
    
    // 2. Convert to NSData from String
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    if (data != nil) {
    
        NSError *jsonError = nil;

        // 3. Get the NSDictionary using NSJSONSerialization

        // LEVEL 1
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                               options:NSJSONReadingAllowFragments
                                                                 error:&jsonError];
        if (jsonError == nil) {
            
            // Success I have the dictionary
            //NSLog(@"jsonDictionary == %@", jsonDictionary);
            
            // LEVEL 2
            NSDictionary *artistsDict = [jsonDictionary valueForKey:@"artists"];
            //NSLog(@"artistsDict == %@", artistsDict);
            
            // LEVEL 3
                NSArray *itemsArray = [artistsDict valueForKey:@"items"];
                //NSLog(@"items array == %@", itemsArray);
            
                for(NSDictionary *itemDict in itemsArray) {
                    
                    Artist *theArtist = [[Artist alloc] initWithDictionary:itemDict];
                    [self.artistsArray addObject:theArtist];
                }
            
            NSLog(@"The number of artsist parsed is %ld", self.artistsArray.count);
            
            
        } else {
            NSLog(@"An error occurred == %@", [jsonError localizedDescription]);
        }
    } else {
        NSLog(@"I was not able to create the NSData");
    }
    
}

@end
