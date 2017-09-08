//
//  ReceivePasswordViewController.swift
//  Eracoin App
//
//  Created by Marcel Mierzejewski on 08.02.2017.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import UIKit
import KVNProgress

class ReceivePasswordViewController: LoginBaseViewController {

    let emailField = ExtendedTextField.init(
        placeholder: "E-mail".localized,
        pattern: Constants.Paterns.Email,
        keyboardType: UIKeyboardType.emailAddress,
        autocorrectionType: UITextAutocorrectionType.no,
        autocapitalizationType: UITextAutocapitalizationType.none,
        isSecure: false
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backButton = UIButton.init()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(#imageLiteral(resourceName: "icons8-Delete-50"), for: UIControlState.normal)
        backButton.imageView?.contentMode = .center
        backButton.addTarget(self, action: #selector(self.backButtonAction(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(backButton)
        
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: backButton,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: backButton,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: 20
                ),
                NSLayoutConstraint.init(
                    item: backButton,
                    attribute: NSLayoutAttribute.width,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: nil,
                    attribute: NSLayoutAttribute.width,
                    multiplier: 1.0,
                    constant: 50
                ),
                NSLayoutConstraint.init(
                    item: backButton,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: backButton,
                    attribute: NSLayoutAttribute.width,
                    multiplier: 1.0,
                    constant: 0
                ),
            ]
        )
        
        let titleLabel = UILabel.init()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Forgotten password".localized
        titleLabel.font = UIFont.title
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        self.view.addSubview(titleLabel)
        
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: titleLabel,
                    attribute: NSLayoutAttribute.centerX,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: titleLabel,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.greaterThanOrEqual,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: 150
                ),
                NSLayoutConstraint.init(
                    item: titleLabel,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.lessThanOrEqual,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: 200
                ),
                NSLayoutConstraint.init(
                    item: titleLabel,
                    attribute: NSLayoutAttribute.width,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.width,
                    multiplier: 0.8,
                    constant: 0
                ),
            ]
        )
        
        self.view.addSubview(self.emailField)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.emailField,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.greaterThanOrEqual,
                    toItem: titleLabel,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 30
                ),
                NSLayoutConstraint.init(
                    item: self.emailField,
                    attribute: NSLayoutAttribute.centerX,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 0
                ),
            ]
        )
        
        let resetPasswordButton = ExtendedButton.init(
        title: "RESET PASSWORD".localized) {
            self.resetPassword()
        }
        
        self.view.addSubview(resetPasswordButton)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: resetPasswordButton,
                    attribute: NSLayoutAttribute.centerY,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.centerY,
                    multiplier: 1.2,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: resetPasswordButton,
                    attribute: NSLayoutAttribute.centerX,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.emailField,
                    attribute: NSLayoutAttribute.bottom,
                    relatedBy: NSLayoutRelation.greaterThanOrEqual,
                    toItem: resetPasswordButton,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: -50
                ),
            ]
        )
    }

    func backButtonAction(sender: UIButton){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func resetPassword(){
        var valid = true
        if !self.emailField.isValid(emptyAllowed: false){
            self.emailField.setAs(valid: false)
            valid = false
        }
        
        if !valid {
            return
        }
        
        KVNProgress.show()
        guard
            let email = self.emailField.textField.text
        else {
            return
        }
        
        Network.ResetPassword(email: email).request(successCompletion: { (_) in
            KVNProgress.showSuccess()
            self.navigationController?.popViewController(animated: true)
        }) { (errorMessage) in
            KVNProgress.showError(withStatus: errorMessage)
        }
    }

}
