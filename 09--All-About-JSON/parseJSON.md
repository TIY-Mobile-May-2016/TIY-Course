```

-(void)loadJSONFile {

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"movies" ofType:@"json"];
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
```