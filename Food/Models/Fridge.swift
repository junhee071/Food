//
//  Fridge.swift
//  Food
//
//  Created by Jun Hee Han on 7/24/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import Foundation

struct Food: Decodable {
    let name: String
    
    //in the form of days
    let expiration: String
}

//class Note {
//    var food = ""
//    var expirationTime = ""
//}
