//
//  ExpirationDateViewController.swift
//  Food
//
//  Created by Jun Hee Han on 7/23/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import Foundation
import UIKit

class ExpirationDateViewController: UIViewController {
    
    var foodName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(foodName)
    }
    
    //create dictionary from csv
//    func readDataFromCSV(fileName:String, fileType: String)-> String!{
//        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
//            else {
//                return nil
//        }
//        do {
//            var contents = try String(contentsOfFile: filepath, encoding: .utf8)
//            contents = cleanRows(file: contents)
//            return contents
//        } catch {
//            print("File Read Error for file \(filepath)")
//            return nil
//        }
//    }
//    
//    
//    func cleanRows(file:String)->String{
//        var cleanFile = file
//        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
//        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
//        //        cleanFile = cleanFile.replacingOccurrences(of: ";;", with: "")
//        //        cleanFile = cleanFile.replacingOccurrences(of: ";\n", with: "")
//        return cleanFile
//    }
//    
//    func csv(data: String) -> [[String]] {
//        var result: [[String]] = []
//        let rows = data.components(separatedBy: "\n")
//        for row in rows {
//            let columns = row.components(separatedBy: ";")
//            result.append(columns)
//        }
//        
//        return result
//    }
//    
//    var data = readDataFromCSV(fileName: Table 1-Table 1.csv, fileType: kCSVFileExtension)
//    data = cleanRows(file: data!)
//    let csvRows = csv(data: data!)
//    print(csvRows[1][1])

}
