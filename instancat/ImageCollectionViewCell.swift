//
//  ImageCollectionViewCell.swift
//  instancat
//
//  Created by Raul Aliaga Shapiama on 11/21/19.
//  Copyright © 2019 RaulAliaga. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
}
