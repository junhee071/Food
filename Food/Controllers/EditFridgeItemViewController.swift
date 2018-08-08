//
//  EditFridgeItemViewController.swift
//  Food
//
//  Created by Jun Hee Han on 8/3/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import Foundation
import UIKit

class EditFridgeItemViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var character: String!
    var numMonths: String!
    var monthss: String!
    var numDays: String!
    var days: String!
    var originalName: String!
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var pickerView1: UIPickerView!
    
    @IBOutlet weak var pickerView2: UIPickerView!
    
    @IBOutlet weak var editNameTextField: UITextField!
    
    let numbers = ["days","months"]
    let numbers2 = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60"]
    
    var passedValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()

        editNameTextField.text = passedValue
        
        
        pickerView1.tag = 1
        pickerView2.tag = 2
        
        editNameTextField.delegate = self
        pickerView1.delegate = self
        pickerView1.dataSource = self
        pickerView2.delegate = self
        pickerView2.dataSource = self
        
        editNameTextField.layer.borderColor = UIColor.white.cgColor
        editNameTextField.layer.borderWidth = 1.0
   
        pickerView1.setValue(#colorLiteral(red: 0.3019607843, green: 0.8, blue: 0.4078431373, alpha: 1), forKeyPath: "textColor")
        pickerView2.setValue(#colorLiteral(red: 0.3019607843, green: 0.8, blue: 0.4078431373, alpha: 1), forKeyPath: "textColor")
        
        doneButton.layer.cornerRadius = 5
        doneButton.layer.borderColor = UIColor.white.cgColor
        doneButton.layer.borderWidth = 1.0
        
        editNameTextField.attributedPlaceholder = NSAttributedString(string: "name",
                                                                       attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font : UIFont(name: "PingFang HK", size: 15.0)!], for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        editNameTextField.text = ""
    }
    
    func textFieldShouldReturn(_ typeInFoodTextField: UITextField) -> Bool {
        typeInFoodTextField.resignFirstResponder()
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newCharacterName = editNameTextField.text {
            character = newCharacterName
            character = character.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            
            if character == "" {
                character = "No Name"
            }
        
        }
        
        
        numMonths = numbers2[pickerView2.selectedRow(inComponent: 0)]
        
        
        
        numDays = numbers[pickerView1.selectedRow(inComponent: 0)]
        let check:Bool!
        
        print(numMonths)
        print(numDays)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return numbers.count
        case 2:
            return numbers2.count
        default:
            return 0
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return numbers[row]
        case 2:
            return numbers2[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            days = numbers[pickerView.selectedRow(inComponent: 0)]
        } else if pickerView.tag == 2 {
            monthss = numbers2[pickerView.selectedRow(inComponent: 0)]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if pickerView.tag == 2 {
            let stringData = numbers2
            let myFont = NSAttributedString(string: stringData[row], attributes: [NSAttributedStringKey.foregroundColor:#colorLiteral(red: 0.3019607843, green: 1, blue: 0.4078431373, alpha: 1)])
            return myFont
        } else {
        let stringData = numbers
        let myFont = NSAttributedString(string: stringData[row], attributes: [NSAttributedStringKey.foregroundColor:#colorLiteral(red: 0.3019607843, green: 1, blue: 0.4078431373, alpha: 1)])
        return myFont
        }
        
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
    }
    
    
}
