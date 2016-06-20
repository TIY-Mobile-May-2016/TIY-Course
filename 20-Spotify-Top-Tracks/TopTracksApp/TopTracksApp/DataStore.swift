//
//  DataStore.swift
//  TopTracksApp
//
//  Created by Phil Wright on 6/20/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

// DataStore will hold all of our artists and arrays for the app

class DataStore: NSObject {
    
    // Make this a singleton
    static let sharedInstance = DataStore()
    override private init() {} // This prevents any additional objects from being created
    
    var artistsArray = [Artist]()
    var tracksArray = [Track]()
    
    
    func addArtist(theArtist: Artist) {
        self.artistsArray.append(theArtist)
    }
    

}
