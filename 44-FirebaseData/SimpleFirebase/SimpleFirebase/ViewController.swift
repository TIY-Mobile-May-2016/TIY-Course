//
//  ViewController.swift
//  SimpleFirebase
//
//  Created by Phil Wright on 7/14/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    
    var postsArray = [Post]()
    
    var ref : FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ref = FIRDatabase.database().reference()
        
        self.ref.child("posts").observeSingleEventOfType(.Value, withBlock: {
            
            (snapshot) in
            
            self.postsArray = []
            
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snapshots {
                    if let dict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let post = Post(key: key, dict: dict)
                        self.postsArray.insert(post, atIndex: 0)
                    }
                }
            }
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
                
                let uid = user.uid
                print("Signed up! \(uid)")
            }
        }
    }
    
    func signOutUser() {
        try! FIRAuth.auth()!.signOut()
    }
    
}

