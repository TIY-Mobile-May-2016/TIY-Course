//
//  ViewController.swift
//  SwiftKata1-SimpleCamera
//
//  Created by Phil Wright on 11/25/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView : UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.imagePicker.delegate = self
    }
    
    @IBAction func chooseImage() {
        
        if  UIImagePickerController.isSourceTypeAvailable(.Camera) {
            
            imagePicker.sourceType = .Camera
            
        } else {
            // Camera Not Available
            self.imagePicker.sourceType = .PhotoLibrary
        }
        
        self.imagePicker.allowsEditing = true
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
    }


    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // Notice: UIImagePickerControllerEditedImage rather than UIImagePickerControllerOrginalImage
        
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            self.imageView.contentMode = .ScaleAspectFit
            self.imageView.image = pickedImage
            
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
}

