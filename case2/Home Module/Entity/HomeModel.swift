//
//  HomeModel.swift
//  case2
//
//  Created by aldo on 01/02/24.
//

import Foundation


struct promos: Decodable {
    var promos: [promo]?
}

struct promo: Codable {
    var id: Int?
    var name: String?
    var images_url: String?
    var detail: String?
}
