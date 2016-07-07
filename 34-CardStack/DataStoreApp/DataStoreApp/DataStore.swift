//
//  DataStore.swift
//  DataStoreApp
//
//  Created by Phil Wright on 7/7/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class DataStore: NSObject {

    static let sharedInstance = DataStore()
    private override init() { }
    
    private var allDogs = [DirtyDog]()

    
    func seedDogs() {
        
        for i in 1...20 {
            let d = DirtyDog()
            d.name = "\(i) Dog Name"
            self.addDog(d)
        }
        
    }
    
    func dogAt(index: Int) -> DirtyDog? {
        
        // Safety Check
        if self.allDogs.count > 0 || self.allDogs.count <= index {
            return self.allDogs[index]
        }
        return nil
    }
    
    func addDog(dog: DirtyDog) {
        self.allDogs.append(dog)
    }
    
    func numberOfDogs() -> Int {
        return self.allDogs.count
    }

    
    
    
    
    
    
    
    
}
