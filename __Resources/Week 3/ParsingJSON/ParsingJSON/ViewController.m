//
//  ViewController.m
//  ParsingJSON
//
//  Created by Phil Wright on 6/10/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ViewController.h"
#import "Resturant.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *resturantsArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.resturantsArray = [[NSMutableArray alloc] init];
    
    NSDictionary *theDictionary = [self parseJSONFile];
    
    NSLog(@"theDict == %@", theDictionary);
    
    // Create the Array
    NSArray *jsonArray = [theDictionary objectForKey:@"restaurants"];
    
    // Loop through array
    for(NSDictionary *dict in jsonArray) {
        
        // Parsing into Resturant Objects
        
        Resturant *theResturant = [[Resturant alloc] init];
        
        // Error Checking Way
        
        NSString *name = [dict objectForKey:@"name"];
        
        if(name != nil) {
            theResturant.name = name;
        } else {
            theResturant.name =@"";
            NSLog(@"I could not parse the name");
        }
        
        NSNumber *latitute = [dict objectForKey:@"latitude"];
        
        if(latitute != nil) {
            theResturant.latitude = latitute;
        } else {
            NSLog(@"I could not parse the latitude");
        }
        
        [self.resturantsArray addObject:theResturant];
        
        //NSLog(@"name: %@", [dict objectForKey:@"name"]);
        //NSLog(@"latitude: %@", [dict objectForKey:@"latitude"]);
    }
    
    NSLog(@"the number of restaurants is %ld", self.resturantsArray.count);
    
    // Looping self.restaurants
    for(Resturant *r in self.resturantsArray) {
        NSLog(@"the restuarant name is %@", r.name);
    }
    
}

-(NSDictionary *)parseJSONFile {
    
    NSDictionary *jsonDictionary = nil;
    
    // 1. Load the JSON data into a NSString
    
    // Get the URL for the file
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    
    // Loads the contents of the file into a string
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath
                                                           encoding:NSUTF8StringEncoding error:NULL];
    
    // Convert json string to data
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    if (data == nil) {
        NSLog(@"There is a problem converting to data");
    } else {
        
        NSError *jsonError = nil;
        
        jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                       options:NSJSONReadingAllowFragments
                                                                         error:&jsonError];
        
        if(jsonError == nil) {
            // we are good
           // NSLog(@"jsonDictionary == %@", jsonDictionary);
        } else {
            // error
            NSLog(@"An error occurred %@", jsonError.localizedDescription);
        }
    }
    return jsonDictionary;
}


@end
