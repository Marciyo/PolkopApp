//
//  BaseTableViewCell.swift
//  Eracoin App
//
//  Created by Marcel Mierzejewski on 21.02.2017.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    let separator = UIView.init()
 
    func addSeparator(widthMultiplier: CGFloat = 1.0, color: UIColor = UIColor.extraLightGray){
        self.separator.translatesAutoresizingMaskIntoConstraints = false
        self.separator.backgroundColor = color
        
        self.addSubview(self.separator)
        
        self.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.separator,
                    attribute: NSLayoutAttribute.width,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.width,
                    multiplier: widthMultiplier,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.separator,
                    attribute: NSLayoutAttribute.centerX,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.separator,
                    attribute: NSLayoutAttribute.bottom,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.separator,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: nil,
                    attribute: NSLayoutAttribute.height,
                    multiplier: 1.0,
                    constant: 1
                )
            ]
        )
    }
    
    
	func addSeparatorAtBottom(widthMultiplier: CGFloat = 1.0, color: UIColor = UIColor.extraLightGray){
        self.separator.translatesAutoresizingMaskIntoConstraints = false
        self.separator.backgroundColor = color
        
        self.addSubview(self.separator)
        
        self.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.separator,
                    attribute: NSLayoutAttribute.width,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.width,
                    multiplier: widthMultiplier,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.separator,
                    attribute: NSLayoutAttribute.centerX,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.separator,
                    attribute: NSLayoutAttribute.bottom,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.separator,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: nil,
                    attribute: NSLayoutAttribute.height,
                    multiplier: 1.0,
                    constant: 1
                )
            ]
        )
    }
}
