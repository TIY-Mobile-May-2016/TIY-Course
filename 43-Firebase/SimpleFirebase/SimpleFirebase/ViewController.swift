//
//  ViewController.swift
//  SimpleFirebase
//
//  Created by Phil Wright on 7/14/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {
    
    var currentUser: FIRUser?
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        
        if let theText = textField.text {
            if self.validateString(theText) == true {
                
                if textField == self.userTextField {
                    self.userTextField.resignFirstResponder()
                    self.passwordTextField.becomeFirstResponder()
                }
                
                if textField == self.passwordTextField {
                    
                    if let email = self.userTextField.text {
                        if let password = self.passwordTextField.text {
                            
                            self.signInUser(email, password: password)
                            
                        }
                    }
                    
                }
            } else {
                self.quickAlert("Error", message: "Please enter valid data")
            }
        }
        
        return true
    }
    
    func validateString(str: String) -> Bool {
        
        if str.characters.count <= 5 {
            return false
        }
        
        return true
    }
    
    // MARK  - Helper Function
    
    func quickAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: {
        })
    }
    
    
    func signInUser(email: String, password: String) {
        
        print("signInUser")
        
        FIRAuth.auth()?.signInWithEmail(email, password: password) {
            
            (user, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            }
            
            if let user = user {
                
                self.currentUser = user
                
                if let theEmail = user.email {
                    print("user signed in \(theEmail)")
                }
            } else {
                print("error could not sign in")
            }
        }
    }
    
    func addUser(email: String, password:String) {
        
        FIRAuth.auth()?.createUserWithEmail(email, password: password) {
            (user, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            }
            
            if let user = user {
                
                self.currentUser = user
                
                let uid = user.uid
                print("Signed up! \(uid)")
            }
        }
    }
    
    func signOutUser() {
        try! FIRAuth.auth()!.signOut()
    }

}

