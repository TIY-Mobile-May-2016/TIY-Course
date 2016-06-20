//
//  APIController.swift
//  TopTracksApp
//
//  Created by Phil Wright on 6/20/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class APIController: NSObject {
    
    // Create a session constant
    let session = NSURLSession.sharedSession()
    
    // Fetch the Artists from the Web API
    
    func fetchArtists(query: String) {
        
        // 1. Put the URLString for the API Call
        let urlString = "https://api.spotify.com/v1/search?q=\(query)&type=artist"
        
        print(urlString)
        
        // 2. Attempt to create a valid NSURL from the string
        if let url = NSURL(string: urlString) {
            
            // 3. Create a Data Task for pulling the data from the URL
            
            let task = session.dataTaskWithURL(url, completionHandler: {
              
                (data, response, error) in
                
                // 4. Check if there is an error
                
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                
                if let jsonDictionary = self.parseJSON(data) {
                    
                    if let artistsDict = jsonDictionary["artists"] as? JSONDictionary {
                        
                        if let itemsArray = artistsDict["items"] as? JSONArray {
                            
                            for itemDict in itemsArray {
                                
                                let theArtist = Artist(dict: itemDict)
                                
                                
                                print(theArtist.name)
                                print(theArtist.artistID)
                                
                                DataStore.sharedInstance.addArtist(theArtist)
                                
                            
                            }
                        }
                        
                    }
                    
                    
                    
                    
                } else {
                    
                    print("I could not parse the jsonDictionary")
                    
                }
                
                
                
                
                
            })
            task.resume()
            
            
            
        }
        
        
        
        
    }
    
    // This method allows us to send some NSData and get back a JSONDictionary
    
    func parseJSON(data: NSData?) -> JSONDictionary? {
        
        var theDictionary : JSONDictionary? = nil
        
        if let data = data {
            do {
                
                if let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                    
                    
                    theDictionary = jsonDictionary
                    
                    //print(jsonDictionary)
                    
                    
                    
                } else {
                    print("Could not parse jsonDictionary")
                }
                
            } catch {
                
            }
            
            
        } else {
            print("Could not unwrap data")
        }
        
        return theDictionary
    }



}
