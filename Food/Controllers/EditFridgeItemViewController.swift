//
//  EditFridgeItemViewController.swift
//  Food
//
//  Created by Jun Hee Han on 8/3/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import Foundation
import UIKit

class EditFridgeItemViewController: UIViewController {
    
    @IBOutlet weak var pickerView1: UIPickerView!
    
    @IBOutlet weak var pickerView2: UIPickerView!
    
    @IBOutlet weak var editNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        editNameTextField.text = "Sf"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "update":
            print("update bar button item tapped")
            
            let destination = segue.destination as! ExpirationDateTableViewController
            destination.fridge.
        
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
    }
    
    
}
