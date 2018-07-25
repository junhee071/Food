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
        let data = DatabaseHelper.obtainDatabase()
        var food: Food? = nil
        
        //searching based off user input
        for arr in data {
            if arr.name == searchBar.text {
                food = arr
                break
            }
        }

        
        if let foundFood = food {
            //create timer save to coreData
            
            //notift tghe delegate what food was selected by the user
            delegate?.search(self, didSelectANew: foundFood)
            
            //dismiss myself
            self.navigationController?.popViewController(animated: true)
        } else {
            //not found
        }
        
    }
}
