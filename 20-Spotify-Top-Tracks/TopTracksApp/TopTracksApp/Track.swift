//
//  Track.swift
//  TopTracksApp
//
//  Created by Phil Wright on 6/20/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class Track: NSObject {
    
    var name: String = ""
    var previewURL: String = ""
    
    override init() {
        super.init()
        
        self.name = ""
        self.previewURL = ""
    }

}
