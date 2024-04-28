//
//  NewsCollectionViewCell.swift
//  DZ_10
//
//  Created by Nikita Shipovskiy on 28/04/2024.
//

import UIKit

final class NewsCollectionViewCell: UICollectionViewCell, CellProtocol {
    static var resuesId: String = "NewsCollectionViewCell"
    
    lazy var imgView = MakeImageView().makeImageView(w: 323, h: 152, radius: 15)
    
    lazy var titleLabel: UILabel = {
        .config(view: $0) { label in
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            label.textColor = .white
            label.numberOfLines = 0
        }
//        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
//        $0.textColor = .white
//        return $0
    }(UILabel(/*frame: CGRect(x: 24, y: 25, width: imgView.frame.width, height: 29)*/))
    
    lazy var textLabel: UILabel = {
        .config(view: $0) { label in
            label.numberOfLines = 0
            label.textColor = .white
        }
    }(UILabel(/*frame: CGRect(x: 24, y: 95, width: imgView.frame.width, height: 34)*/))
    
    
    func setupCell(item: CollectionItem) {
        
        [imgView,titleLabel,textLabel].forEach{
        addSubview($0)
        }
        
        imgView.image = UIImage(named: item.img)
        titleLabel.text = item.titleText
        textLabel.text = item.textMain
        
        makeConstraint()
    }
    
    private func makeConstraint() {
        NSLayoutConstraint.activate([
            
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: trailingAnchor),
        
            titleLabel.topAnchor.constraint(equalTo: imgView.topAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: imgView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 31),
            textLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            textLabel.bottomAnchor.constraint(equalTo: imgView.bottomAnchor, constant: -23)
            
            
        ])
        
    }
    
    
}
