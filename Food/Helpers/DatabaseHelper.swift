//
//  DatabaseHelper.swift
//  Food
//
//  Created by Jun Hee Han on 7/24/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct DatabaseHelper {
    
    static var count: Int = 0
    static let userDefaults = UserDefaults.standard
    
    
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func populateDataBaseWithDefaultFoodData() {
        //load the file from the plist
        if let theCount = userDefaults.value(forKey: "Count") {
            count = theCount as! Int
            
        }
        else {
                if let fileUrl = Bundle.main.url(forResource: "PropertyList", withExtension: "plist"),
                    let data = try? Data(contentsOf: fileUrl) {
                    
                    //-------------------------------
                    //decode the file into swift models
                    if let loadedFoodItems = try? PropertyListDecoder().decode([FoodPlist].self, from: data) {
                        
                        //create core data instances for the swift models that came from the plist file
                        for foodItem in loadedFoodItems {
                            let newFoodCoreDataItem = CoreDataHelper.newFood()
                            newFoodCoreDataItem.name = foodItem.name
                            newFoodCoreDataItem.expiration = foodItem.expiration
                        }
                        CoreDataHelper.saveFood()
                        count = count + 1
                        userDefaults.set(count, forKey: "Count")
                    }
                    
                }
        }
    }
    
//    static func populate() {
//        let newFoodCoreDataItem = CoreDataHelper.newFood()
//       newFoodCoreDataItem.name = "Apple"
//        newFoodCoreDataItem.expiration = "fasoj"
//    }
    
        //set up data base with items plist into database
        //get the food objects from the plist
        
        //save each food object into the database
        //        let data: [Food] = []
        //        for aFood in data {
        //            //add aFood into the database
        //
        //        }
        
        //save the new chagnes

    
    
    //return food object if food name in our database matches user's searchterm
    static func getFood(for searchTerm: String) -> Food? {
        //use fetch and predicates for coredata
        var holder: Food
        do {
            let predicate = NSPredicate(format: "name == %@", searchTerm)
            let fetchedResults = CoreDataHelper.retrieveFood(predicate: predicate)
//            let fetchRequest: NSFetchRequest<Food> = CoreDataHelper.retrieveFood() as! NSFetchRequest<Food>
//            fetchRequest.predicate = NSPredicate(format: "name == %@", searchTerm)
//            let fetchedResults = try context.fetch(fetchRequest) as! [Food]
            if fetchedResults[0].name == searchTerm{
                holder = fetchedResults[0]
                return holder
            } else {
                return nil
            }
        }

        catch  {
            print("Fetch task failed")
        }
    }
    
    static func getFood2(for searchTerm: String) -> [Food]? {
        //use fetch and predicates for coredata
        do {
            let predicate = NSPredicate(format: "name == %@", searchTerm)
            let fetchedResults = CoreDataHelper.retrieveFood(predicate: predicate)
            //            let fetchRequest: NSFetchRequest<Food> = CoreDataHelper.retrieveFood() as! NSFetchRequest<Food>
            //            fetchRequest.predicate = NSPredicate(format: "name == %@", searchTerm)
            //            let fetchedResults = try context.fetch(fetchRequest) as! [Food]
            return fetchedResults
        }
            
        catch  {
            print("Fetch task failed")
        }
    }
    
}
    
    
    
//        let fetchRequest = NSFetchRequest<Food>(entityName: "Food")
//        let predicate = NSPredicate(format: "SELF.name contains %@", searchTerm)
//        var arr: Food? = nil
//        var theName: String
//        for item in hi {
//            if item.name == searchTerm {
//                let newFoodCoreDataItem = CoreDataHelper.newFood()
//                newFoodCoreDataItem.name = tem.name
//                newFoodCoreDataItem.expiration = foodItem.expiration
//                arr = item
//                theName = item.name
//            }
//        }
    
        
        
//        let match = item.filter { $0.contains(searchTerm) }
//        arr = match
//        return arr!
//    }
//
//
//    }
    

    





    


