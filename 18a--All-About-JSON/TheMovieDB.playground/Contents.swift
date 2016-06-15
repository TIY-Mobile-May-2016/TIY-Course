/*:
![Remote Image](https://www.theironyard.com/etc/designs/theironyard/icons/iron-yard-logo.svg)
## The Movie Database
*/



import UIKit
import XCPlayground


// 1. create your typealias (this will make it easier for you!)

typealias JSONDictionary = [String:AnyObject]
typealias JSONArray = [JSONDictionary]

// Create a Movie Object

class Movie {
    
    var title: String = ""
    var posterPath: String = ""
    
    init() {
        self.title = ""
        self.posterPath = ""
    }
    
    init(title: String, posterPath: String) {
        self.title = title
        self.posterPath = posterPath
    }
    
    init(jsonDictionary: JSONDictionary) {
        
        if let posterPath = jsonDictionary["poster_path"] as? String {
            //print(posterPath)
            
            self.posterPath = "http://image.tmdb.org/t/p/w500\(posterPath)"
            
        } else {
            print("I couldnt parse the PosterPath")
        }
        
        if let title = jsonDictionary["original_title"] as? String {
            //print(title)
            
            self.title = title
            
        } else {
            print("I couldnt parse the title")
        }
        
    }
}

// Create an Array of Movies

var moviesArray = [Movie]()


// 2 load the json file into an nsurl

if let filePath = NSBundle.mainBundle().URLForResource("popular", withExtension: "json") {

    // 2. Create the NSURL to NSData
    
    if let data = NSData(contentsOfURL: filePath) {
        
        do {
            
            // LEVEL 1
            if let jsonDict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                
                // LEVEL 2
                if let resultsArray = jsonDict["results"] as? JSONArray {
                    
                    // Level 2
                    for resultsDict in resultsArray {
                        
                        var theMovie = Movie(jsonDictionary: resultsDict)
                        moviesArray.append(theMovie)
                    }
                    
                    
                    
                } else {
                    print("I cant parse the results")
                }
                
            } else {
                
                print("I cant parse the dictionary")
                
            }
            
        } catch {
            print("I could not parse the json data")
        }
        
        
        
    }
    
    

} else {
    
    print("I could not the file.")
    
}


print(moviesArray.count)


for theMovie in moviesArray {
    
    print(theMovie.title)
    
    
}



