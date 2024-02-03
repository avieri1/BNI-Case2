//
//  HomeInteractor.swift
//  case2
//
//  Created by aldo on 01/02/24.
//

import Foundation
import Alamofire

protocol AnyHomeInteractor {
    var presenter: AnyHomePresenter? { get set }
    
    func getPromos()
}

class HomeInteractor: AnyHomeInteractor {
   
    var presenter: AnyHomePresenter?
    let baseURL = "http://demo5853970.mockable.io/"
    let token = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjc1OTE0MTUwLCJleHAiOjE2Nzg1MDYxNTB9.TcIgL5CDZYg9o8CUsSjUbbUdsYSaLutOWni88ZBs9S8"
    
    func getPromos() {
        
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        
        AF.request("\(baseURL)promos", method: .get, encoding: JSONEncoding.default, headers: headers) .validate().responseJSON { response in
            
            switch response.result {
            case .success:
                do{
                    let apiResponse = try JSONDecoder().decode(promos.self, from: response.data!)
                    self.presenter?.interactorDidFetchPromos(with: .success(apiResponse))
                }catch{
                    self.presenter?.interactorDidFetchPromos(with: .failure(error))
                    print(error.localizedDescription)
                }
            case .failure:
                self.presenter?.interactorDidFetchPromos(with: .failure(FetchErrorReason.failure))
                print(response)
            }
        }
        
    }
    
}
