//
//  ViewController.swift
//  WeatherApp
//
//  Created by Phil Wright on 6/23/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit


// MAKE SURE APP TRANSPORT SECURITY IS OFF!

protocol WeatherAPIDelegate : class {
    func passWeather(weather: Weather)
}

class ViewController: UIViewController, WeatherAPIDelegate {
    
    let apiController = APIController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // IMPORTANT
        
        self.apiController.delegate = self
        
        self.apiController.fetchWeather("44.343,-111.2323")
        
 
    }
    
    func passWeather(weather: Weather) {
        
        print("I have the weather")
        
    }


}

