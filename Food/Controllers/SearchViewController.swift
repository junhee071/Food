//
//  SearchViewController.swift
//  Food
//
//  Created by Jun Hee Han on 7/23/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UITextField!
    
    @IBOutlet weak var FindExpirationDate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ExpirationDateTableViewController {
            let vc = segue.destination as? ExpirationDateTableViewController
            vc?.foodName = searchBar.text!

        }
    }
    
    @IBAction func findExpirationDateButtonTapped(_ sender: UIButton) {
        
    }
}
