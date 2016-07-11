//
//  CardsViewController.swift
//
//
//  Created by Phil Wright on 7/6/16.
//  Copyright © 2016 torch. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, CardStackDelegate {
    
    @IBOutlet weak var cardStack: CardStack!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.cardStack.delegate = self
    }
    
    func cardInterested(dog: Dog) {
        print("cardInterested == \(dog.imageName)")
    }
    
    func cardNotInterested(dog: Dog) {
        print("cardNotInterested == \(dog.imageName)")
    }
    

}
