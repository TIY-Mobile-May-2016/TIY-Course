//
//  ViewController.swift
//  SimpleFirebase
//
//  Created by Phil Wright on 7/14/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var currentUser: FIRUser?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let email = "touchopia@me.com"
        let password = "12345678"
        
        self.signInUser(email, password: password)
        
        
        
        
    }
    
    func signInUser(email: String, password: String) {
        
        print("signInUser")
        
        FIRAuth.auth()?.signInWithEmail(email, password: password) {
            
            (user, error) in
            
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

