//
//  String+Extension.swift
//  case2
//
//  Created by aldo on 01/02/24.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
