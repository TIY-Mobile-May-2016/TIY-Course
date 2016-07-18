//
//  ViewController.swift
//  SimpleCoreData
//
//  Created by Phil Wright on 3/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
    
    let moc = DataController().managedObjectContext
    var peopleArray = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchAll()
        //self.addPerson("Phil")
        //self.addPerson("Steve")
        
//        self.addPerson("Joe")
//        self.addPerson("Jason")
//        self.addPerson("Taylor")
//        self.addPerson("Chris")
        

    }

   
    func fetchAll() {
        
        let fetchPerson = NSFetchRequest(entityName: "Person")
        
        do {
            let personsArray = try moc.executeFetchRequest(fetchPerson) as! [Person]

            if personsArray.count > 0 {
                self.peopleArray = personsArray
                self.tableView.reloadData()
            }
            
            for person in personsArray {
                if let name = person.name {
                    print(name)
                }
            }
            
        } catch {
            fatalError("failure to fetch person \(error)")
        }
    }

    func addPerson(name: String) {
        
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: moc) as! Person
        
        entity.setValue(name, forKey: "name")
        
        do {
            try moc.save()
            
        } catch {
            
            fatalError("failure to save context \(error)")
        }
        
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.peopleArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let person = self.peopleArray[indexPath.row]
        cell.textLabel?.text = person.name
        
        
        return cell
    }
    
}


