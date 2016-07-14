//
//  ViewController.swift
//  GestureApp
//
//  Created by Phil Wright on 7/14/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet weak var yellowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Create Tap Gesture
        // 2. Add the target as self (this ViewController)
        // 3. Add an action that occurs when the tap is detected
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapDetected(_:)))
        
        // 4. Add various properties
        tap.numberOfTapsRequired = 2
        
        // 5. Add to the view
        self.yellowView.addGestureRecognizer(tap)
        
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchDetected(_:)))
        
        self.yellowView.addGestureRecognizer(pinch)
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotationDetected(_:)))
        
        self.yellowView.addGestureRecognizer(rotate)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected(_:)))
        
        self.yellowView.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeDetected(_:)))
        
        leftSwipe.direction = .Left
        
        self.yellowView.addGestureRecognizer(leftSwipe)
    
    }

    func tapDetected(sender: UITapGestureRecognizer) {
        print("Double Tap")
        self.statusLabel.text = "Double Tap"
    }
    
    func pinchDetected(sender: UIPinchGestureRecognizer) {
        let scale = sender.scale
        let velocity = sender.velocity
        let resultString = "Pinch - scale = \(scale), velocity = \(velocity)"
        
        print(resultString)
        //self.statusLabel.text = resultString
    }
    
    func rotationDetected(sender: UIRotationGestureRecognizer) {
        let radians = sender.rotation
        let velocity = sender.velocity
        let resultString = "Rotation - Radians = \(radians), velocity = \(velocity)"
        
        print(resultString)
        //self.statusLabel.text = resultString
    }
    
    func swipeDetected(sender: UISwipeGestureRecognizer) {
        self.statusLabel.text = "swipe"
        
        let direction = sender.direction
        
        print(direction)
        
        switch(direction) {
            case UISwipeGestureRecognizerDirection.Left: print("left")
            case UISwipeGestureRecognizerDirection.Right:
                print("right")
                
            default: print("other")
        }
        
    }
    
    func leftSwipeDetected(sender: UISwipeGestureRecognizer) {
        print("left swiped")
    }
    
    func longPressDetected(sender: UILongPressGestureRecognizer) {
        self.statusLabel.text = "Long Press"
    }

}

