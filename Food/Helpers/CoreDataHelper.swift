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
    
    static func newFridgeItem() -> FridgeItems {
        let fridgeItem = NSEntityDescription.insertNewObject(forEntityName: "FridgeItems", into: context) as! FridgeItems
        return fridgeItem
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
    
    static func retrieveFood(predicate: NSPredicate?) -> [Food] {
        do {
            
            let fetchRequest = NSFetchRequest<Food>(entityName: "Food")
            if let predicate = predicate {
                fetchRequest.predicate = predicate
            }
            
            let results = try context.fetch(fetchRequest)
            
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
    
    static func retrieveFridgeItems() -> [FridgeItems] {
        do {
            
            let fetchRequest = NSFetchRequest<FridgeItems>(entityName: "FridgeItems")
            
            let results = try context.fetch(fetchRequest)
            
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
    
    
    static func loadFoods(with request: NSFetchRequest<Food> = Food.fetchRequest()) -> [Food] {
        var filteredFoodArray: [Food] = []
        do {
            filteredFoodArray = try context.fetch(request)
        }
        catch {
            print("Error fetching data from context \(error)")
        }
        return filteredFoodArray
    }
    
    //testing this
    static func retrieveFoodAgain() -> [Food] {
        do {
            let fetchRequest: NSFetchRequest<Food> = NSFetchRequest<Food>(entityName: "Food")
            let results = try context.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
            return results as! [Food]
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
    
    //function take in string, return single core data food object
    
    static func addTimer(food: String) -> FridgeItems
{
        let food = NSEntityDescription.insertNewObject(forEntityName: "FridgeItems", into: context) as! FridgeItems
        return food    }
}
