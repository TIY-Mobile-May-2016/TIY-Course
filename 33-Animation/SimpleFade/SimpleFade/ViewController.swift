//
//  ViewController.swift
//  SimpleFade
//
//  Created by Phil Wright on 7/6/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var redView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redViewFrame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        self.redView = UIView(frame: redViewFrame)
        
        self.redView.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(self.redView)
        
        
        UIView.animateWithDuration(5.0) {
            self.redView.alpha = 0.0
            
            UIView.animateWithDuration(2.0, animations: { 
                self.redView.alpha = 1.0
            })
        }
        
        
    }


}

