```
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
```