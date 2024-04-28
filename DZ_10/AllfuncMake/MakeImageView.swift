//
//  MakeImageView.swift
//  DZ_10
//
//  Created by Nikita Shipovskiy on 28/04/2024.
//

import UIKit

final class MakeImageView {
    func makeImageView(w: CGFloat, h: CGFloat, radius: CGFloat) -> UIImageView {
        {
            .config(view: $0) { img in
                img.widthAnchor.constraint(equalToConstant: w).isActive = true
                img.heightAnchor.constraint(equalToConstant: h).isActive = true
                img.contentMode = .scaleAspectFill
                img.layer.cornerRadius = radius
                img.clipsToBounds = true
            }
        }(UIImageView())
    }
}

