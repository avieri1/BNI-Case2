//
//  DetailInteractor.swift
//  case2
//
//  Created by aldo on 01/02/24.
//

import Foundation

protocol AnyDetailInteractor {
    var presenter: AnyDetailPresenter? { get set }
    var detailLink: String? { get set }
    func getDetailPromos()
}

class DetailInteractor: AnyDetailInteractor {
    var presenter: AnyDetailPresenter?
    var detailLink: String?
    
    func getDetailPromos() {
        presenter?.interactorDidFetchDetailPromos(with: detailLink ?? "")
    }
    
    
}
