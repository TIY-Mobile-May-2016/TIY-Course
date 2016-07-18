//
//  DataController.swift
//  SimpleCoreData
//
//  Created by Phil Wright on 3/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

class DataController: NSObject {
    
    var managedObjectContext: NSManagedObjectContext
    
    override  init() {
        
        guard let modelURL = NSBundle.mainBundle().URLForResource("myDataModel", withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        
        guard let mom = NSManagedObjectModel(contentsOfURL: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        
        self.managedObjectContext.persistentStoreCoordinator = psc
        
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        
        let docURL = urls[urls.endIndex-1]
        
        let storeURL = docURL.URLByAppendingPathComponent("myDataModel.sqlite")
        
        print(storeURL)
        
        do {
            try psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
        
    }
}