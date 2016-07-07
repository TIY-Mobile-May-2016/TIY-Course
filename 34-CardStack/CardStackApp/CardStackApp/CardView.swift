//
// CardView.swift
//
//
//  Created by Phil Wright on 7/6/16.
//  Copyright © 2016 torch. All rights reserved.
//

import UIKit

class CardView: UIView {
    var dog : Dog! {
        didSet {
            imageView.image = dog.image
            nameLabel.text = dog.name
            ageLabel.text = dog.age
        }
    }
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let ageLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defaultInit()
    }
    
    func defaultInit() {
        self.backgroundColor = UIColor.whiteColor()
        
        for v in [imageView, nameLabel, ageLabel] {
            v.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(v)
        }
        
        //Image View
        NSLayoutConstraint(item: imageView, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: imageView, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: imageView, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: imageView, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0.8, constant: 0).active = true
        
        //Name
        NSLayoutConstraint(item: nameLabel, attribute: .Top, relatedBy: .Equal, toItem: imageView, attribute: .Bottom, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: nameLabel, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: 7).active = true
        NSLayoutConstraint(item: nameLabel, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: 0).active = true
        
        //Age
        NSLayoutConstraint(item: ageLabel, attribute: .Top, relatedBy: .Equal, toItem: imageView, attribute: .Bottom, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: ageLabel, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: -7).active = true
        NSLayoutConstraint(item: ageLabel, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: 0).active = true
        
        nameLabel.font = UIFont(name: "HelveticaNeue", size: 24)
        nameLabel.textColor = UIColor.blackColor()
        nameLabel.textAlignment = .Left
        
        ageLabel.font = UIFont(name: "HelveticaNeue", size: 18)
        ageLabel.textColor = UIColor.greenColor()
        ageLabel.textAlignment = .Right
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        self.imageView.contentMode = .ScaleAspectFill
        self.imageView.clipsToBounds = true
    }
}