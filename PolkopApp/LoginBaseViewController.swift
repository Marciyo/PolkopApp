//
//  LoginBaseViewController.swift
//  Eracoin App
//
//  Created by Marcel Mierzejewski on 13.02.2017.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import UIKit

class LoginBaseViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureLayout()
    }
    
    func configureLayout(){
        let background = UIImageView.init(image: #imageLiteral(resourceName: "Backrgound"))
        background.translatesAutoresizingMaskIntoConstraints = false
        background.contentMode = .scaleAspectFill
        self.view.addSubview(background)
        
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: background,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: background,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: background,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: background,
                    attribute: NSLayoutAttribute.bottom,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 0
                )
            ]
        )
    }
}
