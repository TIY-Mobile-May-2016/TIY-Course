//
//  ViewController.swift
//  SimpleAlertController
//
//  Created by Phil Wright on 6/22/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var citiesArray = [City]()
    
    var cityName: String = ""
    var zipcode: String = ""
    
    
    @IBAction func addButtonClicked(sender : AnyObject){
        
        
        // Create AlertController
        let alertController = UIAlertController(title: "Add City", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
        // Create the Save Action with textfields
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default, handler: {
            alert -> Void in
            
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            
            if let name = firstTextField.text {
                self.cityName = name
            }
            
            if let code = secondTextField.text {
                self.zipcode = code
            }
            
            // call geocode
            self.geocoding(self.zipcode, completion: {
                (latitude, longitude) in
                
                // we have city, zipcode and latitude and longie
                
                let city = City()
                city.name = self.cityName
                city.zipcode = self.zipcode
                city.latitude = latitude
                city.longitude = longitude
                
                // I have the City!
                self.citiesArray.append(city)
                
                // reload tableview
                
            })
            
            
            
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter City Name"
        }
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Zipcode"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    // Func geocoding
    
    func geocoding(location: String, completion: (Double, Double) -> ()) {
        CLGeocoder().geocodeAddressString(location) {
            
            (placemarks, error) in
            
            if placemarks?.count > 0 {
                let placemark = placemarks?[0]
                let location = placemark!.location
                let coordinate = location?.coordinate
                completion((coordinate?.latitude)!, (coordinate?.longitude)!)
            }
        }
    }
    

}

