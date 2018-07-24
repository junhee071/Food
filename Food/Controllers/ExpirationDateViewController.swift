//
//  ExpirationDateViewController.swift
//  Food
//
//  Created by Jun Hee Han on 7/23/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

//TODO:
//1. array(array of two dictinaries repeating)
//go into array, check first dictionary's value. match it. then pull out second dictionaries value
//get name of food and expiration date and put them into the view controller side by side


import Foundation
import UIKit

class ExpirationDateViewController: UIViewController {
    
    var foodName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(foodName)
        //access plist file as dictionary
        if let fileUrl = Bundle.main.url(forResource: "output-onlinecsvtools", withExtension: "plist"),
        let data = try? Data(contentsOf: fileUrl) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [[String: Any]] { // [String: Any] which ever it is
                for arr in result {
                    let nameInArr = arr["Product"] as! String
                    if nameInArr == foodName {
                        print(arr["Extension period"] as! String)
                    }
                }
            }
        }
        
           
            
        
        }
    
        
    
    override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
    }
    
   
    

}
