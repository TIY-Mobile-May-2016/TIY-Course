//
//  ViewController.swift
//  PinchApp
//
//  Created by Phil Wright on 7/14/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pinchCharacter : PinchZoomImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pinchCharacter = PinchZoomImageView(image: UIImage(named: "6"))
        
        if let myChar = self.pinchCharacter {
            
            let width = self.view.frame.size.width / 2
            let height = self.view.frame.size.height / 2
            
            let randomX = CGFloat(arc4random_uniform(UInt32(width)))
            
            
            let randomY = CGFloat(arc4random_uniform(UInt32(height)))
            
            let newFrame = CGRect(x: randomX, y: randomY, width: 100, height: 100)
            
            myChar.frame = newFrame
            
            self.view.addSubview(myChar)
        }
        
        
    }
    

}

