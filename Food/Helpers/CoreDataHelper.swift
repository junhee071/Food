//
//  CoreDataHelper.swift
//  Food
//
//  Created by Jun Hee Han on 7/25/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func newFood() -> Food {
        let food = NSEntityDescription.insertNewObject(forEntityName: "Food", into: context) as! Food
        return food
    }
    
    static func saveFood() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
        
    }
    
    static func delete(food: Food) {
        context.delete(food)
        
        saveFood()
    }
    
    static func retrieveFood() -> [Food] {
        do {
            let fetchRequest = NSFetchRequest<Food>(entityName: "Food")
            let results = try context.fetch(fetchRequest)
            
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
    
    //function take in string, return single core data food object
    
    static func addFood(food: String) -> [Food] {
        
    }
}
