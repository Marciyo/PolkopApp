//
//  BasicTableViewCell.swift
//  PolkopApp
//
//  Created by Marcelo on 06/09/2017.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import UIKit

class BasicTableViewCell: GRSwipeTableViewCell {
    
    let itemImage = UIImageView.init()
    let itemLabel = UILabel.init()
    let descriptionLabel = UILabel.init()
    let premiumImage = UIImageView.init()

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        self.itemImage.translatesAutoresizingMaskIntoConstraints = false
        self.itemImage.backgroundColor = UIColor.lightGray
        self.itemImage.layer.cornerRadius = 35
        self.itemImage.contentMode = .scaleAspectFill
        self.itemImage.layer.masksToBounds = true
        
        self.addSubview(self.itemImage)
        
        self.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.itemImage,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 12
                ),
                NSLayoutConstraint.init(
                    item: self.itemImage,
                    attribute: NSLayoutAttribute.centerY,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.centerY,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.itemImage,
                    attribute: NSLayoutAttribute.width,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: nil,
                    attribute: NSLayoutAttribute.width,
                    multiplier: 1.0,
                    constant: 70
                ),
                NSLayoutConstraint.init(
                    item: self.itemImage,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: nil,
                    attribute: NSLayoutAttribute.height,
                    multiplier: 1.0,
                    constant: 70
                ),
            ]
        )
        
        self.itemLabel.translatesAutoresizingMaskIntoConstraints = false
        self.itemLabel.font = UIFont.normalBold
        self.itemLabel.textAlignment = .left
        self.itemLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(self.itemLabel)
        self.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.itemLabel,
                    attribute: NSLayoutAttribute.centerY,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.centerY,
                    multiplier: 1.0,
                    constant: -8
                ),
                NSLayoutConstraint.init(
                    item: self.itemLabel,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.itemImage,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 16
                )
            ]
        )
        
        
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.font = UIFont.small
        self.descriptionLabel.textAlignment = .left
        self.descriptionLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(self.descriptionLabel)
        self.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.descriptionLabel,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.itemLabel,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 4
                ),
                NSLayoutConstraint.init(
                    item: self.descriptionLabel,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.itemLabel,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 0
                )
            ]
        )

        self.premiumImage.translatesAutoresizingMaskIntoConstraints = false
        self.premiumImage.contentMode = .scaleAspectFill
        self.premiumImage.image = #imageLiteral(resourceName: "Star_icon_stylized.svg")
        self.addSubview(self.premiumImage)
        self.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.premiumImage,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: -12
                ),
                NSLayoutConstraint.init(
                    item: self.premiumImage,
                    attribute: NSLayoutAttribute.centerY,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.centerY,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.premiumImage,
                    attribute: NSLayoutAttribute.width,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: nil,
                    attribute: NSLayoutAttribute.width,
                    multiplier: 1.0,
                    constant: 20
                ),
                NSLayoutConstraint.init(
                    item: self.premiumImage,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.premiumImage,
                    attribute: NSLayoutAttribute.width,
                    multiplier: 1.0,
                    constant: 0
                )
            ]
        )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
