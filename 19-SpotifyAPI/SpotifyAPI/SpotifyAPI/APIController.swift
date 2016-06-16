//
//  APIController.swift
//  SpotifyAPI
//
//  Created by Phil Wright on 6/16/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class APIController: NSObject {
    
    let session = NSURLSession.sharedSession()
    
    var artistsArray = [Artist]()
    
    override init() {
        super.init()
    }
    
    func fetchArtists(query: String)
    {
        
        let artistsURLString = "https://api.spotify.com/v1/search?q=\(query)&type=artist"
        
        if let url = NSURL(string: artistsURLString)
        {
        
            let task = self.session.dataTaskWithURL(url, completionHandler: {
            
                (data, response, error) in
                
                // STEP 1 CHECK FOR ERROR
                if error != nil {
                    print("An error occurred")
                    return
                }
                
                // STEP 2 
                
                do {
                    
                    if let data = data {
                        if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                        
                        
                            if let artistsDict = dict["artists"] as? JSONDictionary {
                                
                                if let itemsArray = artistsDict["items"] as? JSONArray {
                                    
                                    
                                    for itemDict in itemsArray {
                                        
                                        //print("\n\nThe itemDict == \(itemDict)\n\n")
                                     
                                        if let name = itemDict["name"] as? String {
                                            print(name)
                                            
                                            self.artistsArray.append(name)
                                            
                                        } else {
                                            print("I could not parse the name")
                                        }
                                        
                                        if let artistId = itemDict["id"] as? String {
                                            print(artistId)
                                        } else {
                                            print("I couldnt parse the artist id")
                                        }
                                        
                                        
                                        
                                        
                                    }
                                    
                                    
                                } else {
                                    print("Could not parse items")
                                }
                                
                                
                            } else {
                                print("I couldnt parse the artists")
                            }
                        
                        } else {
                            print("I couldnt get the JSONDictionary")
                        }
                    }
                    
                    
                } catch {
                    // error happened
                }
                
                
                
            
            })
            task.resume()
        
        }
        
        
    }

}
