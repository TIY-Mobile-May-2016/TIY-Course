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
    }
    


}

