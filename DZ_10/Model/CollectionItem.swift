//
//  CollectionItem.swift
//  DZ_10
//
//  Created by Nikita Shipovskiy on 28/04/2024.
//

import Foundation


struct CollectionItem: Identifiable {
    var id = UUID().uuidString
    var img: String
    var textMain: String? = nil
    var titleText: String? = nil
    var name: String? = nil
}
