//
//  AddCustomViewController.swift
//  Food
//
//  Created by Jun Hee Han on 7/30/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import Foundation
import UIKit


class AddCustomViewController: UIViewController, UITextFieldDelegate {
    
    var character: String!
    
    @IBOutlet weak var addItemLabel: UILabel!
    
    
    
    @IBOutlet weak var typeInFoodTextField: UITextField!
    
    
    @IBOutlet weak var doneButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeInFoodTextField.delegate = self
        
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doneButtonTapped(_ sender: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newCharacterName = typeInFoodTextField.text {
            character = newCharacterName
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? SearchViewController {
//            destination.delegate = self
//            destination.stringholder = typeInFoodTextField.text!
//        }
//    }
}
