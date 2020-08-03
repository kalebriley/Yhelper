//
//  ImageCollectionViewCell.swift
//  Yhelper
//
//  Created by Kaleb Riley on 8/3/20.
//  Copyright © 2020 tyko9. All rights reserved.
//

import UIKit
import AlamofireImage

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.cornerRadius = 8.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = 20.0
    }
    
    func loadImage(imageURL: String?) {
        //imageView.imageFromUrl(urlString: imageURL)
        guard let urlString = imageURL, let url = URL(string: urlString) else { return }
        imageView.af.setImage(withURL: url)
    }

}
