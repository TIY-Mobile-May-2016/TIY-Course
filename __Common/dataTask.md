// 1. Create the urlString that we need
let urlString = "https://api.github.com/users/\(username)"

// 2. Make an NSURL object
if let url = NSURL(string: urlString) {

    let task = session.dataTaskWithURL(url, completionHandler: {
        (data, response, error) in

        if error != nil {
            print(error?.localizedDescription)
            return
        }




    })

} else {
   print("Not a valid url \(urlString)")
}
