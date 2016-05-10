//
//  LogItem.swift
//  Diagnosis
//
//  Created by Prashannth Vijayakumar on 10/05/16.
//  Copyright © 2016 Doctor. All rights reserved.
//

import Foundation
import CoreData


class LogItem: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    class func createInManagedObjectContext(moc: NSManagedObjectContext, name: String, age: String, isMale: String, hasMigraines: String, usesDrugs: String, result: String) -> LogItem {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("LogItem", inManagedObjectContext: moc) as! LogItem
        newItem.name = name
        newItem.age = age
        newItem.isMale = isMale
        newItem.hasMigraines = hasMigraines
        newItem.usesDrugs = usesDrugs
        newItem.result = result
        
        return newItem
    }
}
