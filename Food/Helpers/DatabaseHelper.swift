//
//  DatabaseHelper.swift
//  Food
//
//  Created by Jun Hee Han on 7/24/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import Foundation

struct DatabaseHelper {
    static func populateDataBaseWithDefaultFoodData() {
        
        //set up data base with items plist into database
        //get the food objects from the plist
        
        //save each food object into the database
        //        let data: [Food] = []
        //        for aFood in data {
        //            //add aFood into the database
        //
        //        }
        
        //save the new chagnes
    }
    
    static func obtainDatabase() -> [Food] {
        
        
        //load the file from the plist
        if let fileUrl = Bundle.main.url(forResource: "PropertyList", withExtension: "plist"),
            let data = try? Data(contentsOf: fileUrl) {
            
            //-------------------------------
            //decode the file into swift models
            if let loadedFoodItems = try? PropertyListDecoder().decode([FoodPlist].self, from: data) {
                var foodItems: [Food] = []
                
                //create core data instances for the swift models that came from the plist file
                for foodItem in loadedFoodItems {
                    let newFoodCoreDataItem = CoreDataHelper.newFood()
                    newFoodCoreDataItem.name = foodItem.name
                    newFoodCoreDataItem.expiration = foodItem.expiration
                    foodItems.append(newFoodCoreDataItem)
                }
                
                CoreDataHelper.saveFood()
                
                return foodItems
            }
            
            
            
            
//            if let loadedFoodItems = try? JSONDecoder().decode([Food].self, from: data){
//                if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [[String: Any]] { // [String: Any] which ever it is
//                   return loadedFoodItems
//                }
//            }
        }
        
        return []

    }

}
