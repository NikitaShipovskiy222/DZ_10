//
//  MessengeCollectionViewCell.swift
//  DZ_10
//
//  Created by Nikita Shipovskiy on 28/04/2024.
//

import UIKit

final class MessengeCollectionViewCell: UICollectionViewCell, CellProtocol {
    static var resuesId: String = "MessengeCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        clipsToBounds = true
        layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imgView = MakeImageView().makeImageView(w: 60, h: 60, radius: 20)
    
    lazy var textLabel: UILabel = {
        .config(view: $0) { label in
            label.textColor = .black
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        }
    }(UILabel(/*frame: CGRect(x: 0, y: 0, width: frame.width, height: 34)*/))
    
    func setupCell(item: CollectionItem) {
        
        [imgView, textLabel].forEach{
            addSubview($0)
        }
        
        imgView.image = UIImage(named: item.img)
        textLabel.text = item.textMain
        
        makeConstraint()
        
    }
    
    private func makeConstraint() {
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: topAnchor, constant: 13),
           // imgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            
            textLabel.topAnchor.constraint(equalTo: imgView.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 12),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
        
    }
    
    
}
