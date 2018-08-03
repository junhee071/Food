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

//



class ExpirationDateTableViewController: UITableViewController, SearchViewControllerDelegate {
    func passFood(string: String) {
        print("sup")
    }
    
    
    
    
    func search(_ viewController: SearchViewController, didSelectANew food: Food) {
        print("helloooo")
        let fridgeItem = CoreDataHelper.newFridgeItem(food: food)
        fridge.append(fridgeItem)
//        viewController.s
//        fridge.insert(food, at: 0)
//        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        tableView.reloadData()
    }
    
    
    
    @IBAction func manualSearchPressed(_ sender: Any) {

        let searchStoryboard = UIStoryboard(name: "SearchScreen", bundle: nil)
        let searchVC = searchStoryboard.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController
        searchVC?.delegate = self
        self.navigationController?.pushViewController(searchVC!, animated: true)
    

    }
    
    
    @IBAction func refreshButtonTapped(_ sender: UIBarButtonItem) {
        tableView.reloadData()
    }
    
    var fridge: [FridgeItems] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "showsearchviewcontroller":
                guard let otherViewController = segue.destination as? SearchViewController else {
                    return assertionFailure("storyboard not setup correctly")
                }
                
                otherViewController.delegate = self
                CoreDataHelper.saveFood()
            default:
                break
            }
        }
    }
   
    
//    var foodName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let num = 245
        print("The number is \(num)")
        
        
//        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(printTime), userInfo: nil, repeats: true)
//        timer.fire()

//        print(foodName)
//        //access plist file as dictionary
//        if let fileUrl = Bundle.main.url(forResource: "output-onlinecsvtools", withExtension: "plist"),
//        let data = try? Data(contentsOf: fileUrl) {
//            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [[String: Any]] { // [String: Any] which ever it is
//                for arr in result {
//                    let nameInArr = arr["Product"] as! String
//                    if nameInArr == foodName {
//                        print(arr["Extension period"] as! String)
//                    }
//                }
//            }
//        }
        
           
            
        
        }
    
    override func viewWillAppear(_ animated: Bool) {
        fridge = CoreDataHelper.retrieveFridgeItems()
    }
    override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
    }
    
    
//    func obtainDatabase() -> [[String: Any]] {
//        //access plist file as dictionary
//        if let fileUrl = Bundle.main.url(forResource: "output-onlinecsvtools", withExtension: "plist"),
//        let data = try? Data(contentsOf: fileUrl) {
//        if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [[String: Any]] { // [String: Any] which ever it is
//            return result
//        }
//        }
//        return [[:]]
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fridge.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let foodInfo = data[foodName] {
//            let nOfDays = foodInfo.expirationTime
//            nOfDays
//
//        } else {
//            //no food was found
//        }
//
//        let
//        let expirationDate = Date(timeIntervalSinceNow: 60*60*24*nOfDaysUntilExpires)
//
//        let data = obtainDatabase()
//        var food: String = ""
//        var expiration: String = ""
//        for arr in data {
//            food = arr["Product"] as! String
//            if food == foodName {
//                expiration = arr["Extension period"] as! String
//                break
//            }
//        }
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "expirationTableViewCell", for: indexPath) as! ExpirationDateTableViewCell
        
        
        let foodForTheCurrentIndexPath = fridge[indexPath.row]

        cell.foodNameLabel.text = foodForTheCurrentIndexPath.name
        
        var stringNumber = foodForTheCurrentIndexPath.expirationDate
       // cell.expiryTimeInterval = numberFromString
        
        cell.expirationTimeLabel.text = "\(Int((Double(fridge[indexPath.row].expirationDate)) - Date().timeIntervalSince1970))"
        
        //5433200
//        cell.printTime(holder: foodForTheCurrentIndexPath.expirationDate!)
        //cell.expirationTimeLabel.text = "\(foodForTheCurrentIndexPath.expirationDate //foodForTheCurrentIndexPath.expirationDate)"
        
        return cell
    }
    
//    @objc func printTime(aHolder: String, textLabel: UILabel) {
//        var convertingExpirationDate = aHolder
//        let fullname = convertingExpirationDate
//        let fullnamearr = fullname.components(separatedBy: " ")
//
//        var firstname: String = fullnamearr[0]
//        var lastname: String = fullnamearr[1]
//
//
//        var a:Int = Int(firstname)!
//
//        let whichTimeInterval = lastname
//        switch whichTimeInterval {
//        case "days":
//            a = a * 86400
//        case "weeks":
//            a = a * 604800
//        case "months":
//            a = a * 2630200
//
//        default:
//            print("0 days left")
//        }
//
//        //obtain date from today that food will expire
//        let s5 = NSDate(timeIntervalSinceNow: TimeInterval(a))
//        let stringHolder = "\(s5)"
//        let formatter = DateFormatter()
//        let userCalendar = Calendar.current
//        let requestedComponent : Set<Calendar.Component> = [ .month, .day, .hour]
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = stringHolder
//
//        let s6 = stringHolder.components(separatedBy: " ")
//        var date: String = s6[0]
//
//        let isoDate = "\(date)"
//
//        let dateFormatter2 = DateFormatter()
//        dateFormatter2.dateFormat = "yyyy-MM-dd"
//        dateFormatter2.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
//        let dateFinal = dateFormatter2.date(from: isoDate)!
//
//        formatter.dateFormat = "yyyy-MM-dd"
//        let startTime = Date()
//        let endTime = date
//        let timeDifference = userCalendar.dateComponents(requestedComponent, from: startTime, to: dateFinal)
//        let holder = "\(timeDifference.month!) Months \(timeDifference.day!) Days left"
//        textLabel.text = holder
//    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let foodToDelete = fridge[indexPath.row]
            CoreDataHelper.delete(fridgeItem: foodToDelete)
            fridge.remove(at: indexPath.row)
//            fridge = CoreDataHelper.retrieveFood(predicate: nil)
            tableView.reloadData()
//            self.fridge.remove(at: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    

}
