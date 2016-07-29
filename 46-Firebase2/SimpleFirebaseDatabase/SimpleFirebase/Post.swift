//
//  Post.swift
//  SimpleFirebase
//
//  Created by Phil Wright on 7/20/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Post : NSObject {
    
    let ref = FIRDatabase.database().reference().child("posts")
    
    var key : String = ""
    var uid : String = ""
    var title : String = ""
    var body : String = ""
    
    override init() {
        
    }
    
    init(key: String, dict: Dictionary<String, AnyObject>) {
        
        self.key = key
        
        if let title = dict["title"] as? String {
            self.title = title
        }
        
        if let body = dict["body"] as? String {
            self.body = body
        }
    }
    
    func save() {
        
        let dict: [String:AnyObject] = [
            "title": self.title,
            "body": self.body
        ]
        
        let postRef = self.ref.childByAutoId()
        postRef.setValue(dict)
    }
}
