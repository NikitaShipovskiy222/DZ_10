//
//  File.swift
//  DZ_10
//
//  Created by Nikita Shipovskiy on 28/04/2024.
//

import UIKit


protocol CellProtocol: AnyObject {
    static var resuesId: String {get}
    var imgView: UIImageView {get set}
    func setupCell(item: CollectionItem)
}
