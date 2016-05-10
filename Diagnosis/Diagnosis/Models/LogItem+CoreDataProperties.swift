//
//  LogItem+CoreDataProperties.swift
//  Diagnosis
//
//  Created by Prashannth Vijayakumar on 10/05/16.
//  Copyright © 2016 Doctor. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension LogItem {

    @NSManaged var name: String?
    @NSManaged var age: String?
    @NSManaged var isMale: String?
    @NSManaged var hasMigraines: String?
    @NSManaged var usesDrugs: String?
    @NSManaged var result: String?

}
