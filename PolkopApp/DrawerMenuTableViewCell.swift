//
//  DrawerMenuTableViewCell.swift
//  PolkopApp
//
//  Created by GSK on 06/09/2017.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import UIKit

class DrawerMenuTableViewCell: UITableViewCell {
    
    let itemImage = UIImageView.init()
    
    let itemLabel = UILabel.init()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
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
                    toItem: self,
                    attribute: NSLayoutAttribute.left,
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
