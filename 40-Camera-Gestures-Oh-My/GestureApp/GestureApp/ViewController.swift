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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapDetected(_:)))
        tap.numberOfTapsRequired = 2
        self.yellowView.addGestureRecognizer(tap)
        
    }

    func tapDetected(sender: UITapGestureRecognizer) {
        self.statusLabel.text = "Double Tap"
    }
    
    func pinchDetected(sender: UIPinchGestureRecognizer) {
        let scale = sender.scale
        let velocity = sender.velocity
        let resultString = "Pinch - scale = \(scale), velocity = \(velocity)"
        
        self.statusLabel.text = resultString
    }
    
    func rotationDetected(sender: UIRotationGestureRecognizer) {
        let radians = sender.rotation
        let velocity = sender.velocity
        let resultString = "Rotation - Radians = \(radians), velocity = \(velocity)"
        
        self.statusLabel.text = resultString
    }
    
    func swipeDetected(sender: UISwipeGestureRecognizer) {
        self.statusLabel.text = "swipe"
    }
    
    func longPressDetected(sender: UILongPressGestureRecognizer) {
        self.statusLabel.text = "Long Press"
    }

}

