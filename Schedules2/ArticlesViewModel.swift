//
//  ArticlesViewModel.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/17/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import Foundation
import Moya
import Mapper
import Moya_ModelMapper
import RxSwift

struct ArticlesViewModel {
    
    let provider: RxMoyaProvider<Articles>
    
    func getArticles() -> Observable<[Article]> {
        return getAllArticles()
            .observeOn(MainScheduler.instance)
            .map { pagination -> [Article] in
                return pagination.data
            }
            .shareReplay(1)
    }
    
    internal func getAllArticles() -> Observable<Pagination<Article>> {
        return provider
            .request(.Index)
            .debug()
            .mapObject(Pagination<Article>.self)
            .shareReplay(1)
        
    }
    
}
