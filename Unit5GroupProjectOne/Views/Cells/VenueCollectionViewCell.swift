//
//  VenueCollectionViewCell.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

//Message by Melissa: this will be the collection view cell that will be used in the collections tab! this can also be reused (meaning inherited from) as the collection view cell

class VenueCollectionViewCell: UICollectionViewCell {
    
    lazy var venueCollectionImage: UIImageView = {
        let image = UIImageView()
        
        //default placeholder
        image.image = #imageLiteral(resourceName: "placeholder")
        
        return image
    }()
    lazy var venueName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        backgroundColor = .orange
        setupViews()
    }
    private func setupViews() {
        addSubview(venueCollectionImage)
        addSubview(venueName)
        
        venueName.snp.makeConstraints { (label) in
            label.height.equalTo(self.contentView.snp.height).multipliedBy(0.25)
            label.bottom.leading.trailing.equalTo(self.contentView)
        }
        venueCollectionImage.snp.makeConstraints { (image) in
            image.top.leading.trailing.equalTo(self.contentView)
            image.bottom.equalTo(self.venueName.snp.top)
        }
        
    }
    
    public func configureCell(withCollection collection: [VenueTipModel], andTitle title: String) {
        if !collection.isEmpty {
            let imageData = collection[0].imageData
            guard let image = UIImage(data: imageData) else {
                print("could not retrieve saved venue image")
                return
            }
            self.venueCollectionImage.image = image
        }
        
        self.venueName.text = title
    }
}
