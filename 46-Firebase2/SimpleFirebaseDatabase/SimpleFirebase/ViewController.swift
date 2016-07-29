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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var postsArray = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // IMPORTANT
        observePosts()
    }
    
    func observePosts() {
        let ref = FIRDatabase.database().reference()
        
        ref.child("posts").observeEventType(.Value, withBlock: {
            
            (snapshot) in
            
            self.postsArray = []
            
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snapshots {
                    if let dict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let post = Post(key: key, dict: dict)
                        
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            self.postsArray.insert(post, atIndex: 0)
                            print("Count == \(self.postsArray.count)")
                            self.tableView.reloadData()
                        })
                        
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let post = self.postsArray[indexPath.row]
        cell.textLabel?.text = post.title
        
        return cell
    }
    
    @IBAction func addPostTapped(sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add Post",
                                      message: "Add a new post", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .Default,
                                       handler: {
                                        (action) in
                                        
                                        let p = Post()
                                        
                                        if let textField = alert.textFields?.first {
                                            
                                            if let title = textField.text {
                                                p.title = title
                                            }
                                        }
                                        
                                        if let textField = alert.textFields?[1] {
                                            
                                            if let body = textField.text {
                                                p.body = body
                                            }
                                        }
                                        
                                        p.save()
        })
        
        // Add the action to the alert instance
        alert.addAction(saveAction)
        
        // Create an action called Cancel
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .Default) {
                                            (action) in
        }
        
        alert.addAction(cancelAction)
        
        alert.addTextFieldWithConfigurationHandler {
            (textField) in
            textField.placeholder = "post title"
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField) in
            textField.placeholder = "post body"
        }
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

