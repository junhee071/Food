//
//  AddCustomViewController.swift
//  Food
//
//  Created by Jun Hee Han on 7/30/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import Foundation
import UIKit

class AddCustomViewController: UIViewController {
    
    @IBOutlet weak var addItemLabel: UILabel!
    
    
    
    @IBOutlet weak var typeInFoodTextField: UITextField!
    
    
    @IBOutlet weak var doneButton: UIButton!
    
    
    
    override func viewDidLoad() {
        
    }
   
    
    @IBAction func doneButtonTapped(_ sender: Any) {
         self.performSegue(withIdentifier: "SearchViewController", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToSearchVC" {
            let vc = segue.destination as! SearchViewController
            vc.stringHolder = typeInFoodTextField.text!
        }
    }
}
