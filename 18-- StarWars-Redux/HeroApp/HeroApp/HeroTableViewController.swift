//
//  HeroTableViewController.swift
//  HeroApp
//
//  Created by Phil Wright on 6/15/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class HeroTableViewController: UITableViewController {
    
    var herosArray = [Hero]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let luke = Hero(name: "Luke", imageName: "skywalker")
        self.herosArray.append(luke)

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.herosArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        if indexPath.row % 2 == 0 {
            
            // Hero
            
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! HeroTableViewCell
            
            let hero = self.herosArray[indexPath.row]
            
            cell.nameLabel.text = hero.name
            
            cell.heroImageView.image = UIImage(named: hero.imageName)
            
            return cell
            
        
        } else {
            
            // RightHero

            
            let cell = tableView.dequeueReusableCellWithIdentifier("RightCell", forIndexPath: indexPath) as! RightHeroTableViewCell
            
            let hero = self.herosArray[indexPath.row]
            
            cell.nameLabel.text = hero.name
            
            cell.heroImageView.image = UIImage(named: hero.imageName)
            
            return cell
        }
        
    }
 

}
