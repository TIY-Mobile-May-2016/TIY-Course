//
//  ViewController.swift
//  ColorApp
//
//  Created by Phil Wright on 7/5/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var redValue : Float = 0.0
    
    @IBOutlet weak var redSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // LOAD THE RED VALUE FROM THE USER
        self.redValue = NSUserDefaults.standardUserDefaults().floatForKey(kRED)
        
        print(redValue)
        
        self.redSlider.value = redValue
        
        self.view.backgroundColor = UIColor(red: CGFloat(redValue), green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func redSliderValueChanged(sender: UISlider) {
        
        self.redValue = sender.value
        
        print(sender.value)
        
        let color = UIColor(red: CGFloat(sender.value), green: 0, blue: 0, alpha: 1)
        
        self.view.backgroundColor = color
        
        // SAVE THE RED VALUE
        NSUserDefaults.standardUserDefaults().setFloat(sender.value, forKey: kRED)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
}

