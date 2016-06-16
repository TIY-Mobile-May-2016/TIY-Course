// Asynchronous Loading of an image from a url
        
        // Step 1 NSURL
        if let imageURL = NSURL(string: currentMovie.posterPath) {

            // Step 2 - Create a session
            let session = NSURLSession.sharedSession()

            // Step 3 - create a session task
            let task = session.dataTaskWithURL(imageURL, completionHandler: {

                (data, response, error) in

                if error != nil {
                    print("Something bad happened")
                    return
                }

                if let data = data {

                    let image = UIImage(data: data)

                    dispatch_async(dispatch_get_main_queue(), {
                        cell.imageView?.image = image
                        cell.setNeedsLayout()
                    })

                } else {
                    print("No data found")
                }


            })

            // IMPORTANT
           task.resume()

        }
