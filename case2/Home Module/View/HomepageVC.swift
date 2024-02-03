//
//  HomepageVC.swift
//  case2
//
//  Created by aldo on 01/02/24.
//

import UIKit


protocol AnyHomeView {
    var presenter: AnyHomePresenter? { get set }
    
    func update(with promo: promos)
    func update(with error: String)
}

class HomepageVC: UIViewController, AnyHomeView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: AnyHomePresenter?
    var promos: promos?
    
    func update(with promo: promos) {
        DispatchQueue.main.async {
            self.promos = promo
            self.collectionView.reloadData()
        }
    }
    
    func update(with error: String) {
        print(error)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: HomeCell.identifier, bundle: nil), forCellWithReuseIdentifier: HomeCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promos?.promos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
        
        if promos!.promos![indexPath.item].images_url!.contains("bit.ly"){
            cell.setup(title: promos?.promos?[indexPath.item].name ?? "", img: "https://drive.usercontent.google.com/download?id=1lSpGlqSHFZ1D-WUsuqGhsk3AQ0DwzJaC&authuser=0")
        }
        else{
            cell.setup(title: promos?.promos?[indexPath.item].name ?? "", img: promos?.promos?[indexPath.item].images_url ?? "")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.viewDidGetDetailLink(with: promos?.promos?[indexPath.item].detail ?? "")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        let itemWidth = collectionView.bounds.width
        let itemHeight = collectionView.bounds.height
        return CGSize(width: Int(itemWidth), height: Int(itemHeight))
    }


}
