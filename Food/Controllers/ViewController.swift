//
//  ViewController.swift
//  Food
//
//  Created by Jun Hee Han on 7/23/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(printTime), userInfo: nil, repeats: true)
        timer.fire()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func printTime() {
        var convertingExpirationDate = "35 months"
        let fullname = convertingExpirationDate
        let fullnamearr = fullname.components(separatedBy: " ")
        
        var firstname: String = fullnamearr[0]
        var lastname: String = fullnamearr[1]
        
        
        var a:Int = Int(firstname)!
        
        
        
        let whichTimeInterval = lastname
        switch whichTimeInterval {
        case "days":
            a = a * 86400
        case "weeks":
            a = a * 604800
        case "months":
            a = a * 2419200
            
        default:
            print("0")
        }
        
        let s5 = NSDate(timeIntervalSinceNow: TimeInterval(a)) // it means one minute (60 seconds) before the current time
        
        let formatter = DateFormatter()
        let userCalendar = Calendar.current
        let requestedComponent : Set<Calendar.Component> = [ .month, .day, .hour]
        
        
        formatter.dateFormat = "yyyy-MM-dd"
        let startTime = Date()
        let endTime = formatter.date(from: "\(s5)")
        let timeDifference = userCalendar.dateComponents(requestedComponent, from: startTime, to: endTime!)
        label.text = "\(timeDifference.month) Months  \(timeDifference.day) Days"
    }


}

