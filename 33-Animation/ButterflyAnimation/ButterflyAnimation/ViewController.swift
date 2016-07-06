//
//  ViewController.swift
//  ButterflyAnimation
//
//  Created by Phil Wright on 7/6/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var butterflyImageView: UIImageView!
    
    var timer : NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imagesArray = [UIImage]()
        
        for i in 1...17 {
            if let image = UIImage(named: "bf_\(i)") {
                imagesArray.append(image)
                print("bf_\(i)")
            }
        }
        
        butterflyImageView.animationImages = imagesArray
        butterflyImageView.animationDuration = 0.5
        butterflyImageView.animationRepeatCount = 0
        butterflyImageView.startAnimating()
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(moveButterfly), userInfo: nil, repeats: true)
        
    }
    
    func moveButterfly() {
        
        let width = self.view.frame.size.width * 0.9
        let height = self.view.frame.size.height * 0.9
        
        
        let xCoordinate : CGFloat = CGFloat(arc4random_uniform(UInt32(width)))
        let yCoordinate : CGFloat = CGFloat(arc4random_uniform(UInt32(height)))
        
        UIView.animateWithDuration(2.0) { 
            
            self.butterflyImageView.center = CGPoint(x: xCoordinate, y: yCoordinate)
            
            UIView.animateWithDuration(2.0, animations: { 
                self.butterflyImageView.center = CGPoint(x: 0, y: 0)
            })
        }
    
    }
    


}

