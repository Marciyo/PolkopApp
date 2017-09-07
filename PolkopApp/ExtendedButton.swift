//
//  ExtendedButton.swift
//  Eracoin App
//
//  Created by Maciej Matuszewski on 10.02.2017.
//  Copyright © 2017 Maciej Matuszewski. All rights reserved.
//

import UIKit

class ExtendedButton: UIButton {

    var onClick: (()->Void)
    
    init(title: String, function: @escaping (()->Void)) {
        self.onClick = function
        super.init(frame: CGRect.zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        self.setTitle(title, for: UIControlState.normal)
        self.setTitleColor(UIColor.black, for: UIControlState.normal)
        self.titleLabel?.font = UIFont.button
        self.layer.cornerRadius = 6
        
        NSLayoutConstraint.activate(
            [
                self.heightAnchor.constraint(equalToConstant: 44),
                self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.8)
            ]
        )
        
        self.addTarget(self, action: #selector(self.onClickFunction), for: UIControlEvents.touchUpInside)
        
        let arrowView = UIImageView.init(image: #imageLiteral(resourceName: "arrow-icon-28"))
        arrowView.contentMode = .scaleAspectFit
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(arrowView)
        
        
        self.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: arrowView,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.titleLabel,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 4
                ),
                NSLayoutConstraint.init(
                    item: arrowView,
                    attribute: NSLayoutAttribute.width,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: nil,
                    attribute: NSLayoutAttribute.width,
                    multiplier: 1.0,
                    constant: 16
                ),
                NSLayoutConstraint.init(
                    item: arrowView,
                    attribute: NSLayoutAttribute.centerY,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.titleLabel,
                    attribute: NSLayoutAttribute.centerY,
                    multiplier: 1.0,
                    constant: 0
                ),
            ]
        )
        
    }
    
    func onClickFunction(){
        self.onClick()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
