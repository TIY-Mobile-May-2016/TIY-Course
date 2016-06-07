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