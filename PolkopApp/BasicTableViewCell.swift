//
//  BasicTableViewCell.swift
//  PolkopApp
//
//  Created by Marcelo on 06/09/2017.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import UIKit

class BasicTableViewCell: UITableViewCell {
    
    let itemImage = UIImageView.init()
    let itemLabel = UILabel.init()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        self.itemImage.translatesAutoresizingMaskIntoConstraints = false
        self.itemImage.backgroundColor = UIColor.lightGray
        self.itemImage.contentMode = .scaleAspectFit
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
                    constant: 0
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
