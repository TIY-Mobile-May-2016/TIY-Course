//
//  MovieTableViewController.m
//  JSONApp
//
//  Created by Phil Wright on 6/6/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "MovieTableViewController.h"
#import "Movie.h"
#import "MoviePosterViewController.h"

@interface MovieTableViewController ()
@property (nonatomic, strong) NSMutableArray *moviesArray;
@property (nonatomic, strong) Movie *currentMovie;
@end

@implementation MovieTableViewController


#pragma mark - View Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // IMPORTANT
    self.moviesArray = [[NSMutableArray alloc] init];
    
    [self loadJSONFile];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.moviesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    Movie *theMovie = [self.moviesArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = theMovie.originalTitle;
    
    // 1. Load the image from the web
    UIImage *theImage = [self imageFromURLString:theMovie.posterPath];
    
    // Assign the image to the imageView of the cell
    cell.imageView.image = theImage;
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"didSelectRow == %ld", indexPath.row);
    
    self.currentMovie = [self.moviesArray objectAtIndex:indexPath.row];
    
    NSLog(@"%@", self.currentMovie.originalTitle);
    
    [self performSegueWithIdentifier:@"MoviePosterSegue" sender:nil];
    
}


#pragma mark - Navigation Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    // 1. check to see if the identifier is the one we want
    if ([segue.identifier isEqualToString:@"MoviePosterSegue"]) {
        
        // 2. Grab the pointer to the destination view Controller
        MoviePosterViewController *controller =
            (MoviePosterViewController *)segue.destinationViewController;
        
        // 3. Pass the data
        controller.theMovie = self.currentMovie;
    }
    
}

#pragma mark - Load the JSON

-(void)loadJSONFile {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"popular" ofType:@"json"];
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    //NSLog(@"%@", jsonString);
    
    
    NSError *error = nil;
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if(error == nil) {
        //NSLog(@"jsonArray == %@", jsonArray);
        
        NSArray *resultsArray = [jsonDictionary objectForKey:@"results"];
        
        for(NSDictionary *dict in resultsArray) {
            NSLog(@"dict == %@", dict);
            
            Movie *m = [[Movie alloc] init];
            
            NSString *title = [dict objectForKey:@"original_title"];
            
            if (title != nil) {
                m.originalTitle = title;
            } else {
                m.originalTitle =@"";
                NSLog(@"Could not parse title field");
            }
            
            NSString *posterPath = [dict objectForKey:@"poster_path"];
            
            if (posterPath != nil) {
                m.posterPath = posterPath;
            } else {
                m.posterPath =@"";
                NSLog(@"Could not parse powers field");
            }
            
            if (m != nil) {
                [self.moviesArray addObject:m];
            }
            NSLog(@"Movie Count: %ld", self.moviesArray.count);
        }
        
    } else {
        NSLog(@"Could not parse json into NSDictionary");
    }
}

-(UIImage *)imageFromURLString:(NSString *)urlString {
    
    UIImage *theImage = nil;
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSLog(@"Attempting to Load urlString == %@", urlString);
    
    if(url) {
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        if(data) {
            theImage = [UIImage imageWithData:data];
        }
    }
    return theImage;
}

@end
