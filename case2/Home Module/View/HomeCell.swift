//
//  HomeCell.swift
//  case2
//
//  Created by aldo on 01/02/24.
//

import UIKit
import Kingfisher

class HomeCell: UICollectionViewCell {
    static let identifier = String(describing: HomeCell.self)
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageThumb: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(title: String, img: String) {
        titleLbl.text = title
        imageThumb.kf.setImage(with: img.asUrl)
    }

}
