//
//  Food+CoreDataClass.swift
//  Food
//
//  Created by Jun Hee Han on 7/25/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//
//

import Foundation
import CoreData


public class Food: NSManagedObject {
    
    
//    public required init(from decoder: Decoder) throws {
//        let context = CoreDataHelper.context
//        guard let entity = NSEntityDescription.entity(forEntityName: "Food", in: context) else { fatalError("Failed to make entity from core data model") }
//        
//        super.init(entity: entity, insertInto: context)
//        
//        enum FoodKey: String, CodingKey {
//            case name, expiration
//        }
//        let contenaire = try! decoder.container(keyedBy: FoodKey.self)
//        self.name = try! contenaire.decodeIfPresent(String.self, forKey: .name)
//        self.expiration = try!  contenaire.decodeIfPresent(String.self, forKey: .expiration)
//
//    }
////    public convenience required init(from decoder: Decoder) throws {
//
//        enum FoodKey: String, CodingKey{
//            case name, expiration
//        }
//
//        let context = CoreDataHelper.context
//        guard let entity = NSEntityDescription.entity(forEntityName: "Food", in: context) else {fatalError()}
//
//        self.init(entity: entity, insertInto: context)
//
//
//        let contenaire = try? decoder.container(keyedBy: FoodKey.self)
//        self.name = try! contenaire?.decodeIfPresent(String.self, forKey: .name)
//        self.expiration = try!  contenaire?.decodeIfPresent(String.self, forKey: .expiration)
//
//    }
}
