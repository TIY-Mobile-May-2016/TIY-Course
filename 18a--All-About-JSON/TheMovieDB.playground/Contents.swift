/*:
![Remote Image](https://www.theironyard.com/etc/designs/theironyard/icons/iron-yard-logo.svg)
## The Movie Database
*/



import UIKit
import XCPlayground


// 1. create your typealias (this will make it easier for you!)

typealias JSONDictionary = [String:AnyObject]
typealias JSONArray = [AnyObject]


// 2. Create your Movie Class

class Movie {
    var title: NSString = ""
    var posterPath: NSString = ""
}

// 3. Create an empty array for your movies

var moviesArray = [Movie]()


// Step 2 Load file popular.json

if let filePath = NSBundle.mainBundle().URLForResource("popular", withExtension: "json") {

    // Step 3 Convert the contents to NSData

    if let data = NSData(contentsOfURL: filePath) {
        
            // Step 4 Use the do / try / catch to parse the json
            do {
                if let jsonDict = try
                    NSJSONSerialization.JSONObjectWithData(data, options: []) as?
                JSONDictionary {
                    
                    // Parse the JSONDict
                    
                    print(jsonDict)
                    
                    if let resultsArray = jsonDict["results"] as? JSONArray {
                        
                        for dict in resultsArray {
                            
                            // Step 1 Create Movie object
                            
                            let theMovie = Movie()
                            
                            if let title = dict["original_title"] as? String {
                                theMovie.title = title
                            } else {
                                print("Could not parse title string")
                            }
                            
                            if let posterPath = dict["poster_path"] as? String {
                                theMovie.posterPath = posterPath
                            } else {
                                print("Could not parse the poster path")
                            }
                            
                            moviesArray.append(theMovie)
                        }
                    }
                }
            } catch {
                print("Something went wrong parsing the data")
            }
    }
    
    for theMovie in moviesArray {
        print(theMovie.title)
    }
}



