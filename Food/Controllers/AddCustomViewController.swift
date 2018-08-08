//
//  AddCustomViewController.swift
//  Food
//
//  Created by Jun Hee Han on 7/30/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import Foundation
import UIKit


class AddCustomViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    var character: String!
    var numMonths: String!
    var monthss: String!
    var numDays: String!
    var days: String!
    
    @IBOutlet weak var addItemLabel: UILabel!
    

    @IBOutlet weak var pickerView1: UIPickerView!
    
    @IBOutlet weak var pickerView2: UIPickerView!
    

    @IBOutlet weak var typeInFoodTextField: UITextField!
    
    
    @IBOutlet weak var doneButton: UIButton!
    
    let numbers = ["days","months"]
    let numbers2 = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()

        pickerView1.tag = 1
        pickerView2.tag = 2
        
        typeInFoodTextField.delegate = self
        pickerView1.delegate = self
        pickerView1.dataSource = self
        pickerView2.delegate = self
        pickerView2.dataSource = self
        
        
        pickerView1.setValue(#colorLiteral(red: 0.3019607843, green: 0.8941176471, blue: 0.4078431373, alpha: 1), forKeyPath: "textColor")

        pickerView2.setValue(#colorLiteral(red: 0.3019607843, green: 0.8941176471, blue: 0.4078431373, alpha: 1), forKeyPath: "textColor")
        
        typeInFoodTextField.layer.borderColor = UIColor.white.cgColor
        typeInFoodTextField.layer.borderWidth = 1.0
        
        doneButton.layer.cornerRadius = 5
        doneButton.layer.borderColor = UIColor.white.cgColor
        doneButton.layer.borderWidth = 1.0
        
        
        typeInFoodTextField.attributedPlaceholder = NSAttributedString(string: "name",
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        //typeInFoodTextField.isUserInteractionEnabled = true
    }
    
    func textFieldShouldReturn(_ typeInFoodTextField: UITextField) -> Bool {
        typeInFoodTextField.resignFirstResponder()
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doneButtonTapped(_ sender: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newCharacterName = typeInFoodTextField.text {
            character = newCharacterName
            character = character.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if character == "" {
                character = "No Name"
            }
        }
    
        
       
        numMonths = numbers2[pickerView2.selectedRow(inComponent: 0)]
        
    
    
        numDays = numbers[pickerView1.selectedRow(inComponent: 0)]
    
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
    
    //months pickerview
//    func numberOfComponents2(in pickerView2: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView2(_ pickerView2: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return numbers2.count
//    }
//
//    func pickerView2(_ pickerView2: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return numbers2[row]
//    }
//
//    func pickerView2(_ pickerView2: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        monthss = numbers2[pickerView2.selectedRow(inComponent: 0)]
//        print("\(monthss) sfss")
//    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if let destination = segue.destination as? SearchViewController {
    //            destination.delegate = self
    //            destination.stringholder = typeInFoodTextField.text!
    //        }
    //    }
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


