////
////  CountdownHelper.swift
////  Food
////
////  Created by Jun Hee Han on 7/31/18.
////  Copyright © 2018 Jun Hee Han. All rights reserved.
////
//
//import Foundation
//
//class CountdownHelper {
//    func work() {
//    var fullname = "30 months"
//    let fullnamearr = fullname.components(separatedBy: " ")
//
//    var firstname: String = fullnamearr[0]
//    var lastname: String = fullnamearr[1]
//
//
//        var a:Int = Int(firstname)!
//
//
//
//        let whichTimeInterval = lastname
//        switch whichTimeInterval {
//        case "days":
//            a = a * 86400
//        case "weeks":
//            a = a * 604800
//        case "months":
//            a = a * 2419200
//
//        default:
//            print("suck me")
//        }
//
//        let s5 = NSDate(timeIntervalSinceNow: TimeInterval(a)) // it means one minute (60 seconds) before the current time
//        print("\(s5)")
//        //need to extract just 20 from 2020 (the year)
//
//
//        //starter countdown timer
//        let formatter = DateFormatter()
//        let userCalendar = Calendar.current
//        let requestedComponent : Set<Calendar.Component> = [ .year, .month, .day, .hour]
//
//
//        func printTime() {
//            formatter.dateFormat = "yyyy-MM-dd"
//            let startTime = Date()
//            let endTime = formatter.date(from: "2020-05-13")
//            let timeDifference = userCalendar.dateComponents(requestedComponent, from: startTime, to: endTime!)
//        }
//
//
//
//        //add to expiration VC
//        var convertingExpirationDate = foodForTheCurrentIndexPath.expirationDate
//        let fullname = convertingExpirationDate
//        let fullnamearr = fullname.components(separatedBy: " ")
//
//        var firstname: String = fullnamearr[0]
//        var lastname: String = fullnamearr[1]
//
//
//        var a:Int = Int(firstname)!
//
//
//
//        let whichTimeInterval = lastname
//        switch whichTimeInterval {
//        case "days":
//            a = a * 86400
//        case "weeks":
//            a = a * 604800
//        case "months":
//            a = a * 2419200
//
//        default:
//            print("suck me")
//        }
//
//        let s5 = NSDate(timeIntervalSinceNow: TimeInterval(a)) // it means one minute (60 seconds) before the current time
//
//        let formatter = DateFormatter()
//        let userCalendar = Calendar.current
//        let requestedComponent : Set<Calendar.Component> = [ .year, .month, .day, .hour]
//
//
//            formatter.dateFormat = "yyyy-MM-dd"
//            let startTime = Date()
//            let endTime = formatter.date(from: "\(s5)")
//            let timeDifference = userCalendar.dateComponents(requestedComponent, from: startTime, to: endTime!)
//
//
//    }
//    
//}
//
//
