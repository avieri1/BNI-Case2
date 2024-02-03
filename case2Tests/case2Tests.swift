//
//  case2Tests.swift
//  case2Tests
//
//  Created by aldo on 01/02/24.
//

import XCTest
@testable import case2

final class case2Tests: XCTestCase {

    func testPromoGet() {
        let promo = promos(promos: [promo(id: 1,name: "BNI Mobile Banking",images_url: "https://www.bni.co.id/Portals/1/BNI/Beranda/Images/Beranda-MobileBanking-01-M-Banking1.png",detail: "https://www.bni.co.id/id-id/individu/simulasi/bni-deposito")])
        
        XCTAssertEqual(promo.promos?[0].name, "BNI Mobile Banking")
        XCTAssertEqual(promo.promos?[0].images_url, "https://www.bni.co.id/Portals/1/BNI/Beranda/Images/Beranda-MobileBanking-01-M-Banking1.png")
        
    }

}
