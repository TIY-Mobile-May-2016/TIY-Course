//
//  ViewController.swift
//  NavApp
//
//  Created by Phil Wright on 6/23/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentCity = City()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "Maps"
        
    }

    @IBAction func MyUnwindSegue(segue: UIStoryboardSegue) {
    
        if let cityController = segue.sourceViewController as? CityViewController {
            
            currentCity.name = cityController.cityString
            currentCity.zipCode = cityController.zipCodeString
            
            print(cityController.cityString)
            print(cityController.zipCodeString)
            
        }
        
        
        print("Unwind called")
        
    }

    

}

