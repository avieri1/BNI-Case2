//
//  HomePresenter.swift
//  case2
//
//  Created by aldo on 01/02/24.
//

import Foundation

enum FetchErrorReason: Error {
    case failure
}

protocol AnyHomePresenter {
    var router: AnyHomeRouter? { get set }
    var interactor: AnyHomeInteractor? { get set }
    var view: AnyHomeView? { get set }
    
    func interactorDidFetchPromos(with result: Result<promos, Error>)
    func viewDidGetDetailLink(with detailLink: String)
}

class HomePresenter: AnyHomePresenter {
    
    var router: AnyHomeRouter?
    
    var interactor: AnyHomeInteractor? {
        didSet {
            interactor?.getPromos()
        }
    }
    
    var view: AnyHomeView?
    
    func interactorDidFetchPromos(with result: Result<promos, Error>) {
        switch result {
        case .success(let promo):
            view?.update(with: promo)
        case .failure:
            view?.update(with: "Error")
        }
    }
    
    func viewDidGetDetailLink(with detailLink: String) {
        router?.pushToDetail(on: view!, with: detailLink)
    }
    
    
}
