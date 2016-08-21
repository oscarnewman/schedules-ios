//
//  CountdownView.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/18/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import UIKit

class CountdownView: UIView {

    @IBOutlet weak var scheduleNameLabel: UILabel!
    @IBOutlet weak var minutesRemainingLabel: UILabel!

    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var nextLabel: UILabel!
    
    @IBOutlet weak var startedTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    @IBOutlet weak var noSchoolLabel: UILabel!
    
    @IBOutlet weak var minsStackView: UIStackView!
    @IBOutlet weak var dataStackView: UIStackView!
    
    var school: Bool = true {
        didSet {
            if school {
                self.noSchoolLabel.hidden = true
                
                self.scheduleNameLabel.hidden = false
                self.minsStackView.hidden = false
                self.dataStackView.hidden = false
            } else {
                self.noSchoolLabel.hidden = false
                
                self.scheduleNameLabel.hidden = true
                self.minsStackView.hidden = true
                self.dataStackView.hidden = true
            }
        }
    }
    
    static func initFromNib() -> CountdownView{
        return NSBundle.mainBundle().loadNibNamed("Countdown", owner: self, options: nil)[0] as! CountdownView
    }
    
    
    
    func update(schedule: Schedule?) {
        guard let schedule = schedule else {
            school = false
            return
        }
        
        if !schedule.isSchoolDay() {
            school = false
            return
        }
        
        if Day.current() != .Either {
            scheduleNameLabel.text = "\(schedule.name) \(Day.current().rawValue) schedule"
        } else {
            scheduleNameLabel.text = "\(schedule.name) schedule"
        }
        
        minutesRemainingLabel.text = "\(schedule.timeLeft())"
        
        currentLabel.text = schedule.currentPeriod()?.type.name(Day.current()) ?? " "
        nextLabel.text = schedule.nextPeriod()?.type.name(Day.current()) ?? "nothing"
        
        startedTimeLabel.text = schedule.currentPeriod()?.start.string ?? " "
        endTimeLabel.text = schedule.nextPeriod()?.start.string ?? schedule.currentPeriod()?.end.string ?? " "
        
    }

}
