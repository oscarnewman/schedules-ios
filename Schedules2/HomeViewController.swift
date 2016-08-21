//
//  HomeViewController.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/18/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    var countdownView: CountdownView!
    
    var homeViewModel: HomeViewModel!
    let disposeBag = DisposeBag()
    var selectedArticle: Article?

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
//        setupRx()
    }
    
    func setup() {

        self.view.tintColor = Stylesheet.primaryColor

        // Add countdown view
        countdownView = CountdownView.initFromNib()
        countdownView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: Metrics.countdownHeight)
        view.addSubview(countdownView)
        
        let articleListViewController = self.childViewControllers[0] as! ArticleListViewController
        articleListViewController.callback = { article in
            self.selectedArticle = article
            self.performSegueWithIdentifier("articleView", sender: self)
        }
        
        update()
        setupTimer()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // Hide nav bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)

    }
    

    
    func setupTimer() {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Second, fromDate: date)
        let second = Double(components.second)
        
        let fireDate = NSDate(timeIntervalSinceNow: 60 - second)
        let timer = NSTimer(fireDate: fireDate,
                            interval: 60,
                            target: self,
                            selector: #selector(update),
                            userInfo: nil,
                            repeats: true)
        
        NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSDefaultRunLoopMode)

    }
    
    func update() {
        countdownView.update(Schedule.current())
    }
    
    func setupRx() {
        homeViewModel = HomeViewModel()
        
        homeViewModel.watch()
        
        homeViewModel.minutesRemaining.asDriver()
            .drive(countdownView.minutesRemainingLabel.rx_text)
            .addDisposableTo(disposeBag)
        
//        homeViewModel.scheduleName
//            .drive(countdownView.scheduleNameLabel.rx_text)
//            .addDisposableTo(disposeBag)
//        
        homeViewModel.currentPeriodName
            .drive(countdownView.currentLabel.rx_text)
            .addDisposableTo(disposeBag)
        
        homeViewModel.currentPeriodTime
            .drive(countdownView.startedTimeLabel.rx_text)
            .addDisposableTo(disposeBag)
        
        homeViewModel.nextPeriodName
            .drive(countdownView.nextLabel.rx_text)
            .addDisposableTo(disposeBag)
        
        homeViewModel.nextPeriodTime
            .drive(countdownView.endTimeLabel.rx_text)
            .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Changing Status Bar
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard let id = segue.identifier where id == "articleView" else { return }
        guard let article = selectedArticle else { return }
        
        let articleVC = segue.destinationViewController as! ArticleViewController
        articleVC.article = article
    }
    

}
