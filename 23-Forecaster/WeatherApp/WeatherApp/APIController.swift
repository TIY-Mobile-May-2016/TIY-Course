//
//  APIController.swift
//  WeatherApp
//
//  Created by Phil Wright on 6/23/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class APIController: NSObject {
    
    let session = NSURLSession.sharedSession()
    
    weak var delegate: WeatherAPIDelegate?
    
    func fetchWeather(location: String) {
        
       // ... (we have the data)
        
        let data = NSData()
        
        if let jsonDictionary = self.parseJSON(data) {
            let weather = Weather(dict: jsonDictionary)
            
            
            self.delegate?.passWeather(weather)
            
        }
        
    }

    
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
