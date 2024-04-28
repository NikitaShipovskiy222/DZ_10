//
//  BannerCollectionViewCell.swift
//  DZ_10
//
//  Created by Nikita Shipovskiy on 28/04/2024.
//

import UIKit

final class BannerCollectionViewCell: UICollectionViewCell, CellProtocol {
    static var resuesId: String = "BannerCollectionViewCell"
    
    lazy var imgView = MakeImageView().makeImageView(w: 370, h: 216, radius: 15)
    
    func setupCell(item: CollectionItem) {
        
        imgView.image = UIImage(named: item.img)
        
        [imgView].forEach{
            addSubview($0)
        }
        imgCostraint()
        
    }
    
    private func imgCostraint() {
        
        NSLayoutConstraint.activate([
            
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: trailingAnchor),
           
        
        ])
    }
    
}


