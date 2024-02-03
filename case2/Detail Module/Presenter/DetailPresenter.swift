//
//  DetailPresenter.swift
//  case2
//
//  Created by aldo on 01/02/24.
//

import Foundation

protocol AnyDetailPresenter {
    var router: AnyDetailRouter? { get set }
    var interactor: AnyDetailInteractor? { get set }
    var view: AnyDetailView? { get set }
    
    func interactorDidFetchDetailPromos(with detailLink: String)
}

class DetailPresenter: AnyDetailPresenter {
    var router: AnyDetailRouter?
    
    var interactor: AnyDetailInteractor? {
        didSet {
            interactor?.getDetailPromos()
        }
    }
    
    var view: AnyDetailView?
    
    func interactorDidFetchDetailPromos(with detailLink: String) {
        view?.show(with: detailLink)
    }
    
    
}
