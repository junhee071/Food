//
//  Food+CoreDataProperties.swift
//  Food
//
//  Created by Jun Hee Han on 7/25/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//
//

import Foundation
import CoreData


extension Food {

    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var expiration: String
    @NSManaged public var name: String

}
