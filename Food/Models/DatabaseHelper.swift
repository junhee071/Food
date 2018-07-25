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
    
    func obtainDatabase() -> [[String: Any]] {
        //access plist file as dictionary
        if let fileUrl = Bundle.main.url(forResource: "output-onlinecsvtools", withExtension: "plist"),
            let data = try? Data(contentsOf: fileUrl) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [[String: Any]] { // [String: Any] which ever it is
                return result
            }
        }
        return [[:]]
    }
    
}
