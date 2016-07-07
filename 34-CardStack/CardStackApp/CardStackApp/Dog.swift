//
//  Dog.swift
//  Torch
//
//  Created by Phil Wright on 7/6/16.
//  Copyright © 2016 torch. All rights reserved.
//

import UIKit

class Dog: NSObject {

    var name: String = ""
    var age: String = ""
    var imageName: String = ""
    
    var image : UIImage? {
        return UIImage(named: self.imageName)
    }
}
