//
//  PlaceCollectionViewCell.swift
//  MoyaAndRxSwift
//
//  Created by iDeveloper2 on 24/04/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import UIKit
import Kingfisher

class PlaceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var place: Place? {
        didSet {
            guard let place = place else { return }

            nameLabel.text = place.name
            
            if let url = URL(string: place.imageUrl) {
                print("=====>",url)
                imageView.kf.setImage(with: url)
            } else {
                imageView.image = nil
            }
            descriptionLabel.text = place.category
        }
    }
}
