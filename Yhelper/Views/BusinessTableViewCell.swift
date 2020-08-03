//
//  BusinessTableViewCell.swift
//  Yhelper
//
//  Created by Kaleb Riley on 8/2/20.
//  Copyright © 2020 tyko9. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell  {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var isClosedLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var callButton: UIButton!
    
    var business: BusinessViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(business: BusinessViewModel) {
        self.business = business
        nameLabel.text = business.name
        addressLabel.text = business.address
        categoriesLabel.text = business.displayCategories
        isClosedLabel.textColor = business.isClosed ? UIColor.red : UIColor.green
        isClosedLabel.text = business.isClosedDisplay
        distanceLabel.text = business.displayDistance
        callButton.layer.cornerRadius = 5
    }
    
}

extension BusinessTableViewCell: UICollectionViewDataSource {
    
    // NOTE: Theres an API limit on fetching single businesses so I will load the default business image instead of the photos associated with the business.
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        cell.loadImage(imageURL: business.displayImageURL)
        return cell
    }
    
    
}


