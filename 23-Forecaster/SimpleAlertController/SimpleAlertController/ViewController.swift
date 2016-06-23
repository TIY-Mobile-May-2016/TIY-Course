//
//  ViewController.swift
//  SimpleAlertController
//
//  Created by Phil Wright on 6/22/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
            
            print(firstTextField.text)
            print(secondTextField.text)
            
            // call geocode
            
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
    

}

