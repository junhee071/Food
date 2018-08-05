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
    
    static func newFridgeItem(food: Food) -> FridgeItems {
        let fridgeItem = NSEntityDescription.insertNewObject(forEntityName: "FridgeItems", into: context) as! FridgeItems
        fridgeItem.name = food.name
        
        let holder = food.expiration!
        var convertingExpirationDate = holder
        if convertingExpirationDate == "0" {
            convertingExpirationDate = "0 days"
        }
        let fullname = convertingExpirationDate
        let fullnamearr = fullname.components(separatedBy: " ")
        print("\(fullnamearr[0])")
        var a: Int = 0
        if let firstname: String = fullnamearr[0] {
            a = Int(firstname)!
            
            print(firstname)
        }
        var lastname: String = fullnamearr[1]
        
        
        

        let x = a
        let whichTimeInterval = lastname
        switch whichTimeInterval {
        case "seconds":
            a = x
        case "days":
            a = a * 86400
        case "weeks":
            a = a * 604800
        case "months":
            a = a * 2630200

        default:
            print("0 days left")
        }
        
        let b: (Int32) = Int32(a)
        //var myString = String(b)
        let y = Int32(NSDate().timeIntervalSince1970)
        fridgeItem.expirationDate = b + y
        
        //obtain date from today that food will expire
//        let s5 = NSDate(timeIntervalSinceNow: TimeInterval(a))
//        let stringHolder = "\(s5)"
//
//
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = stringHolder
//
//        let s6 = stringHolder.components(separatedBy: " ")
//        var date: String = s6[0]
//        let dateFormatter2 = DateFormatter()
//        dateFormatter2.dateFormat = "yyyy-MM-dd"
//        dateFormatter2.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
//        let dateFinal = dateFormatter2.date(from: "\(date)")!
//        fridgeItem.expirationDate = dateFinal

        saveFood()
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
    
    static func delete(fridgeItem: FridgeItems) {
        context.delete(fridgeItem)
        
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
