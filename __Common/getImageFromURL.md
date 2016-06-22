func getImageFromURLString(urlString: String) {

    // Convert from string to NSURL
    if let url = NSURL(string: urlString) {

      let session = NSURLSession.sharedSession()


        let task = session.dataTaskWithURL(url, completionHandler: {
            (data, response, error) in

            if error != nil {
                print("\(error?.localizedDescription)")
                return
            }

            if let data = data {
                let image = UIImage(data: data)
                dispatch_async(dispatch_get_main_queue(), {
                    self.imageView.image = image
                    self.imageView.setNeedsLayout()
                })
            }
        })
        task.resume()
    } else {
        print("Not a valid url \(urlString)")
    }

}
