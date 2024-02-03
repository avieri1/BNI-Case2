//
//  DetailRouter.swift
//  case2
//
//  Created by aldo on 01/02/24.
//

import Foundation
import UIKit


protocol AnyDetailRouter {
    
    static func start(with detailLink: String) -> UIViewController
}

class DetailRouter: AnyDetailRouter {
   
    static func start(with detailLink: String) -> UIViewController {
        let viewController = DetailVC()
        
        var presenter: AnyDetailPresenter = DetailPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = DetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DetailInteractor()
        viewController.presenter?.interactor?.detailLink = detailLink
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    
}
