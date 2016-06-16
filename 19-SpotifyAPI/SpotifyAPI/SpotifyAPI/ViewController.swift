//
//  ViewController.swift
//  SpotifyAPI
//
//  Created by Phil Wright on 6/16/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let apiController = APIController()

    override func viewDidLoad() {
        super.viewDidLoad()

        apiController.fetchArtists("u2")
        
        
    }



}

