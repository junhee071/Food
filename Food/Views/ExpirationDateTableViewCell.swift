//
//  ExpirationDateTableViewCell.swift
//  Food
//
//  Created by Jun Hee Han on 7/24/18.
//  Copyright © 2018 Jun Hee Han. All rights reserved.
//

import Foundation
import UIKit
class ExpirationDateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    @IBOutlet weak var expirationTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
//    func printTime(holder: Date) {
//        let formatter = DateFormatter()
//        let userCalendar = Calendar.current
//        let requestedComponent : Set<Calendar.Component> = [ .month, .day, .hour]
//        formatter.dateFormat = "yyyy-MM-dd"
//        let startTime = Date()
//        let endTime = holder
//        let timeDifference = userCalendar.dateComponents(requestedComponent, from: startTime, to: endTime)
//        expirationTimeLabel.text = "\(timeDifference.day!) Months \(timeDifference.day!) Days"
//    }
    
    private var timer: Timer?
    private var timeCounter: Double = 0
    
    var expiryTimeInterval: TimeInterval? {
        didSet {
            startTimer()
        }
    }
    
    private func startTimer() {
        if let interval = expiryTimeInterval {
            timeCounter = interval
//            timer = Timer(timeInterval: 1.0,
//                              target: self,
//                              selector: #selector(onComplete),
//                              userInfo: nil,
//                              repeats: true)
            
            timer = Timer.scheduledTimer(withTimeInterval: 86400.0, repeats: true, block: { (timer) in
                guard self.timeCounter >= 0 else {
                    self.timer?.invalidate()
                    self.timer = nil
                    print("timer over")
                    
                    return
                }
                
//                if self.timeCounter >= 30 {
//                    self.expirationTimeLabel.text = "\(Int(self.timeCounter / 30)) month and \(self.timeCounter.truncatingRemainder(dividingBy: 30))  days left"
//                    self.timeCounter -= 1
//
//                }
//                else if self.timeCounter < 30 {
//                    self.expirationTimeLabel.text = "\(self.timeCounter) days left"
//                    self.timeCounter -= 1
//
//                }
                //2 months or more
                if self.timeCounter >= 5260400 {
                    self.expirationTimeLabel.text = "\(Int(self.timeCounter / 2630200)) months and \(Int(((self.timeCounter / 2630200).truncatingRemainder(dividingBy: 86400) + 0.99))) days left"
                    self.timeCounter -= 86400
                }
                //between 1 and 2 months
                else if self.timeCounter >= 2630200 && self.timeCounter < 5260400 {
                    self.expirationTimeLabel.text = "\(Int(self.timeCounter / 2630200)) month and \(Int(((self.timeCounter / 2630200).truncatingRemainder(dividingBy: 86400) + 0.99))) days left"
                    self.timeCounter -= 86400
                    
                }
                    
                //between 1 day - 1 month
                else if self.timeCounter < 2630200 && self.timeCounter > 86400 {
                    self.expirationTimeLabel.text = "\((Int((self.timeCounter) / 86400 + 0.99))) days left"
                    self.timeCounter -= 86400
                    
                }
                
                //between 1 minute - 1 day
                else if self.timeCounter <= 86400 && self.timeCounter > 60{
                    self.expirationTimeLabel.text = "\(Int(self.timeCounter / 86400 + 0.99)) day left"
                    self.timeCounter -= 86400
                }
                
                //1 minute or less
                else {
                    self.expirationTimeLabel.text = "\(Int(self.timeCounter)) seconds left"
                    self.timeCounter -= 1
                }
                
                


                //self.expirationTimeLabel.text = String(self.timeCounter)
                //self.timeCounter -= 1
            })
        }
    }
    
//    @objc func onComplete() {
//        guard timeCounter >= 0 else {
//            timer?.invalidate()
//            timer = nil
//            return
//        }
//        expirationTimeLabel.text = String(format: "%d", timeCounter)
//        timeCounter -= 1
//    }
}
