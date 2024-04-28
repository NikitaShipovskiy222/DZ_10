//
//  StoryCollectionViewCell.swift
//  DZ_10
//
//  Created by Nikita Shipovskiy on 28/04/2024.
//

import UIKit


final class StoryCollectionViewCell: UICollectionViewCell, CellProtocol {
    static var resuesId: String = "StoryCollectionViewCell"
    
    lazy var imgView = MakeImageView().makeImageView(w: 80, h: 80, radius: 40)
        
    lazy var labelName: UILabel = {
        .config(view: $0) { label in
            label.textColor = .black
            label.textAlignment = .center
        }
    }(UILabel(/*frame: CGRect(x: 0, y: 5, width: frame.width, height: 19)*/))
    
    
    func setupCell(item: CollectionItem) {
        
        [imgView, labelName].forEach{
            addSubview($0)
        }
        
        imgView.image = UIImage(named: item.img)
        labelName.text = item.name
        
        makeConstraint()
        
    }
    
    private func makeConstraint() {
        NSLayoutConstraint.activate([
        
            imgView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            labelName.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 5),
            labelName.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelName.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelName.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
    }
    
    
}
