//
//  TableViewController.h
//  ToDoApp
//
//  Created by Phil Wright on 6/5/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "TableViewController.h"
#import "Post.h"

@interface TableViewController ()
@property (nonatomic, strong) NSMutableArray *postsArray;
@end

@implementation TableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.postsArray = [[NSMutableArray alloc] init];
    
    // Loading the jsonString from the file
    NSString *jsonString = [self stringFromJSONFile];
    //NSLog(@"jsonString == %@", jsonString);
    
    // 2. Convert the JSON String into NSData
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    // 3. Create an NSError
    NSError *error = nil;
    
    // 4. Parsing the data file into an NSDictionary
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingAllowFragments error:&error];
    
    // if there is an error Display the error message otherwise we have
    // a valid NSDictionary
    if(error == nil) {
        
        //NSLog(@"jsonDictionary == %@", jsonDictionary);
        
        NSArray *array = [jsonDictionary objectForKey:@"results"];
        
        
        for(NSDictionary *dict in array) {
            
            NSLog(@"dict == %@", dict);
            
            // Create the new object for the post
            Post *thePost = [[Post alloc] init];
            
            // Parse the JSON attributes
            
            NSString *title = [dict objectForKey:@"title"];
            
            if (title != nil) {
                thePost.title = title;
            } else  {
                thePost.title =@"";
                NSLog(@"I could not parse the title");
            }
            
            NSString *body = [dict objectForKey:@"body"];
            
            if (body != nil) {
                thePost.body = body;
            } else {
                thePost.body =@"";
                NSLog(@"I could not parse the body");
            }
            
            
            NSNumber *postId = [dict objectForKey:@"id"];
            
            if(postId != nil) {
                thePost.postId = postId;
            } else {
                thePost.postId = [NSNumber numberWithInteger:0];
                NSLog(@"I could not parse the postId");
            }
            
            
            NSNumber *userId = [dict objectForKey:@"userId"];
            
            if(userId != nil) {
                thePost.userId = userId;
            } else {
                thePost.userId = [NSNumber numberWithInteger:0];
                NSLog(@"I could not parse the userId");
            }
            
            [self.postsArray addObject:thePost];
        }
        NSLog(@"posts count == %ld", self.postsArray.count);
        
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text =@"Test";
    
    return cell;
    
}
- (IBAction)addPost:(UIBarButtonItem *)sender {
    
    NSLog(@"Post");
}

#pragma mark - Helper Methods

-(NSString *)stringFromJSONFile {
    
    // 1. Create empty nsstring
    NSString *str = [[NSString alloc] init];
    
    // 2. Get the main bundle
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    // Get the string for the filePath
    NSString *filePath = [mainBundle pathForResource:@"posts" ofType:@"json"];
    
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath
                                                           encoding:NSUTF8StringEncoding error:NULL];
    
    // Make sure the string returned is a valid string
    if (jsonString != nil) {
        str = jsonString;
    }
    
    // Last Step return the str
    return str;
}



@end
