// Synchronous Loading of an image from a url

// Step 1 NSURL
if let imageURL = NSURL(string: currentMovie.posterPath) {

    // Step 2 NSData
    if let data = NSData(contentsOfURL: imageURL) {

        // Step 3 - Use the data to create an image
        let image = UIImage(data: data)

        // Step 4 - assign the imageView image to the image
        cell.imageView?.image = image
    }
}
