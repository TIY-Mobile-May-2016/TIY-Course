1. Load the JSON File into a JSONString

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath
                                                       encoding:NSUTF8StringEncoding error:NULL];

2. Convert JSONString into an NSData object.

  NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];

  // Make sure the data comes is not nil or it will crash

3. Convert NSData using NSJSONSerialization into NSDictionary

    // Create the error object
    NSError *jsonError = nil;

    // NSJSONSerialization JSONObjectWithData
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:&jsonError];

  if(jsonError == nil) {
      // we are good
} else {
  // error
}
