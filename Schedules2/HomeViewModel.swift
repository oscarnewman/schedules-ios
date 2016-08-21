//
//  HomeViewModel.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/19/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    
    
    private let schedule: Observable<Schedule?>
    private let timer: Observable<Int>
    private let disposeBag = DisposeBag()
    
    var minutesRemaining: Variable<String>
//    var scheduleName: Driver<String>
    var currentPeriodName: Driver<String>
    var nextPeriodName: Driver<String>
    var currentPeriodTime: Driver<String>
    var nextPeriodTime: Driver<String>
    
    
    init() {
        schedule = Schedule.getCurrent()
        
//        let currentSchedule = Schedule.current()
        
        timer = Observable<Int>.interval(0.1, scheduler: MainScheduler.instance)
        
        
        minutesRemaining = Variable<String>("0")
//         Initialize Observers
//        minutesRemaining = schedule.asDriver(onErrorJustReturn: nil)
//            .map { schedule in
//                guard let schedule = schedule else { return "0" }
//                return "\(schedule.timeLeft())"
//            }
        
//        minutesRemaining.asObservable()
//            .distinctUntilChanged()
//            .subscribeNext { timeLeft in
//                
//            }
//            .addDisposableTo(disposeBag)
        
//        scheduleName = minutesRemaining.asDriver()
//            .map { _ in
//                return schedule.map { schedule -> String in
//                    return "\(schedule!.name) schedule"
//                }
//            }
        
        currentPeriodName = schedule.asDriver(onErrorJustReturn: nil)
            .map { ($0?.currentPeriod()?.type.name(Day.current())) ?? " " }
        
        nextPeriodName = schedule.asDriver(onErrorJustReturn: nil)
            .map { ($0?.nextPeriod()?.type.name(Day.current())) ?? " " }
        
        currentPeriodTime = schedule.asDriver(onErrorJustReturn: nil)
            .map { $0?.currentPeriod()?.start.string ?? " " }
        
        nextPeriodTime = schedule.asDriver(onErrorJustReturn: nil)
            .map { $0?.nextPeriod()?.start.string ?? " " }
        
    }
    
    func watch() {
        
        timer.subscribeNext { secs -> Void in
            self.update()
        }
        .addDisposableTo(disposeBag)
        
    }
    
    func update() {
        // Initialize Observers
        schedule.subscribeNext { currentSchedule in
            guard let currentSchedule = currentSchedule else {
                return
            }
            self.minutesRemaining.value = "\(currentSchedule.timeLeft())"
        }.addDisposableTo(disposeBag)
        
//        scheduleName = schedule.asDriver(onErrorJustReturn: nil)
//            .map { "\($0?.name) schedule" }
//        
        currentPeriodName = schedule.asDriver(onErrorJustReturn: nil)
            .map { ($0?.currentPeriod()?.type.name(Day.current())) ?? " " }
        
        nextPeriodName = schedule.asDriver(onErrorJustReturn: nil)
            .map { ($0?.nextPeriod()?.type.name(Day.current())) ?? " " }
        
        currentPeriodTime = schedule.asDriver(onErrorJustReturn: nil)
            .map { $0?.currentPeriod()?.start.string ?? " " }
        
        nextPeriodTime = schedule.asDriver(onErrorJustReturn: nil)
            .map { $0?.nextPeriod()?.start.string ?? " " }
    }
    
    

}