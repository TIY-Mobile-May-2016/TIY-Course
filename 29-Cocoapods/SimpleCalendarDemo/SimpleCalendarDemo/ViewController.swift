//
//  ViewController.swift
//  SimpleCalendarDemo
//
//  Created by Phil Wright on 2/29/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
import CalendarView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendar = CalendarView(frame: CGRectMake(0, 0, CGRectGetWidth(view.frame), 320))
        view.addSubview(calendar)
    }

}

