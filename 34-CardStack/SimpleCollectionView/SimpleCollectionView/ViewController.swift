//
//  ViewController.swift
//  SimpleCollectionView
//
//  Created by Phil Wright on 7/7/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var numbersArray = ["1","2","3","4","5","6","7"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numbersArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! PhilsCollectionViewCell
        
        let numberString = self.numbersArray[indexPath.row]
        cell.nameLabel.text = numberString
        
        
        return cell
        
    }

}

