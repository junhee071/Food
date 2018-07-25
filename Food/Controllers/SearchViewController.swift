//
//  SearchViewController.swift
//  Food
//
//  Created by Jun Hee Han on 7/23/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewControllerDelegate: class {
    func search(_ viewController: SearchViewController, didSelectANew food: Food)
}

class SearchViewController: UIViewController {
    
    weak var delegate: SearchViewControllerDelegate?
    
    @IBOutlet weak var searchBar: UITextField!
    
    @IBOutlet weak var FindExpirationDate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.destination is ExpirationDateTableViewController {
//            let vc = segue.destination as? ExpirationDateTableViewController
//            vc?.foodName = searchBar.text!
//
//        }
//    }
    
    @IBAction func findExpirationDateButtonTapped(_ sender: UIButton) {
        let data = DatabaseHelper().obtainDatabase()
        var food: String = ""
        var expiration: String = ""
        for arr in data {
            food = arr["Product"] as! String
            if food == searchBar.text {
                expiration = arr["Extension period"] as! String
                break
            }
        }

        
        if true {
            
            //food was found from the database from the user's input
            let newFood = food
            
            //notift tghe delegate what food was selected by the user
            delegate?.search(self, didSelectANew: newFood.name)
            
            //dismiss myself
            self.navigationController?.popViewController(animated: true)
        } else {
            //not found
        }
    }
}
