//
//  ViewController.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/17/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Moya
import DateTools

class ArticleListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    var articlesViewModel: ArticlesViewModel!
    var provider: RxMoyaProvider<Articles>!
    var refreshControl: UIRefreshControl!
    var activityIndicator: ActivityIndicator!
    
    var callback: Article->() = {_ in}
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupRx()
    }
    
    func setupUI() {
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.editing = false
        tableView.dataSource = self
        
        tableView.registerNib(UINib(nibName: "ArticleDateHeaderCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
        
        
    }
    
    func setupRx() {
        provider = RxMoyaProvider<Articles>()
        articlesViewModel = ArticlesViewModel(provider: provider)
        
        activityIndicator = ActivityIndicator()
        refreshControl = UIRefreshControl()
        tableView.addSubview(refreshControl)
        
        articlesViewModel
            .getArticles()
            .subscribeNext { articles in
                self.articles = articles
                self.tableView.reloadData()
            }
            .addDisposableTo(disposeBag)
//        
//        articlesViewModel
//            .getArticles()
//            .bindTo(tableView.rx_itemsWithCellFactory) { (tableView, row, item) in
//                let cell = tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: NSIndexPath(forRow: row, inSection: 0)) as! ArticleCell
//                cell.setup(item)
//                return cell
//            }
//            .addDisposableTo(disposeBag)
        
        tableView
            .rx_itemSelected
            .subscribeNext { indexPath in
                self.callback(self.articles[indexPath.row])
            }
            .addDisposableTo(disposeBag)
        
        refreshControl
            .rx_controlEvent(.ValueChanged)
            .flatMapLatest { [unowned self] _ in
                return self.articlesViewModel.getArticles()
                    .trackActivity(self.activityIndicator)
            }
            .subscribeNext { [unowned self] articles in
                self.articles = articles
                self.tableView.reloadData()
            }
            .addDisposableTo(disposeBag)
        
        activityIndicator.asObservable()
            .bindTo(refreshControl.rx_refreshing)
            .addDisposableTo(disposeBag)
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ArticleListViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: NSIndexPath(forRow: indexPath.row, inSection: 0)) as! ArticleCell
        cell.setup(articles[indexPath.row])
        return cell
    }
    
}


