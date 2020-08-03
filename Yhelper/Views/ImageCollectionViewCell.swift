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
        containerView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        
    }
    
    func loadImage(imageURL: String?) {
        //imageView.imageFromUrl(urlString: imageURL)
        guard let urlString = imageURL, let url = URL(string: urlString) else { return }
        imageView.af.setImage(withURL: url)
    }

}
