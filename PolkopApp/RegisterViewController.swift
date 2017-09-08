//
//  RegisterViewController.swift
//  Eracoin App
//
//  Created by Marcel Mierzejewski on 08.02.2017.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import UIKit
import KVNProgress

class RegisterViewController: LoginBaseViewController {
    
    let emailField = ExtendedTextField.init(
        placeholder: "E-mail".localized,
        pattern: Constants.Paterns.Email,
        keyboardType: UIKeyboardType.emailAddress,
        autocorrectionType: UITextAutocorrectionType.no,
        autocapitalizationType: UITextAutocapitalizationType.none,
        isSecure: false
    )
    
    let usernameField = ExtendedTextField.init(
        placeholder: "Nickname".localized,
        pattern: Constants.Paterns.Name,
        keyboardType: UIKeyboardType.alphabet,
        autocorrectionType: UITextAutocorrectionType.no,
        autocapitalizationType: UITextAutocapitalizationType.words,
        isSecure: false
    )
    
    let passwordField = ExtendedTextField.init(
        placeholder: "Password".localized,
        pattern: Constants.Paterns.Password,
        keyboardType: UIKeyboardType.default,
        autocorrectionType: UITextAutocorrectionType.no,
        autocapitalizationType: UITextAutocapitalizationType.none,
        isSecure: true
    )
    
    let confirmPasswordField = ExtendedTextField.init(
        placeholder: "Confirm Password".localized,
        pattern: Constants.Paterns.Password,
        keyboardType: UIKeyboardType.default,
        autocorrectionType: UITextAutocorrectionType.no,
        autocapitalizationType: UITextAutocapitalizationType.none,
        isSecure: true
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
        titleLabel.text = "Register".localized
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
                    constant: 50
                ),
                NSLayoutConstraint.init(
                    item: titleLabel,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.lessThanOrEqual,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: 76
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
        
        self.emailField.setNextResponder(nextField: self.usernameField.textField)
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
        
        self.usernameField.setNextResponder(nextField: self.passwordField.textField)
        self.view.addSubview(self.usernameField)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.usernameField,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.emailField,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 8
                ),
                NSLayoutConstraint.init(
                    item: self.usernameField,
                    attribute: NSLayoutAttribute.centerX,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 0
                ),
            ]
        )
        
        self.passwordField.setNextResponder(nextField: self.confirmPasswordField.textField)
        self.passwordField.onEndFunction = {[weak self] in
            if self?.confirmPasswordField.textField.text != "" {
                _ = self?.confirmPasswordValid()
            }
        }
        self.view.addSubview(self.passwordField)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.passwordField,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.usernameField,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 8
                ),
                NSLayoutConstraint.init(
                    item: self.passwordField,
                    attribute: NSLayoutAttribute.centerX,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 0
                ),
            ]
        )
        
        self.confirmPasswordField.onEndFunction = {
            self.register()
        }
        
        self.confirmPasswordField.onChangeFunction = { [weak self] in
            _ = self?.confirmPasswordValid()
        }
        
        self.view.addSubview(self.confirmPasswordField)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.confirmPasswordField,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.passwordField,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 8
                ),
                NSLayoutConstraint.init(
                    item: self.confirmPasswordField,
                    attribute: NSLayoutAttribute.centerX,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 0
                ),
            ]
        )
        
        
        let registerButton = ExtendedButton.init(
        title: "SET UP MY ACCOUNT".localized) {
            self.register()
        }
        
        self.view.addSubview(registerButton)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: registerButton,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: -140
                ),
                NSLayoutConstraint.init(
                    item: registerButton,
                    attribute: NSLayoutAttribute.centerX,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: confirmPasswordField,
                    attribute: NSLayoutAttribute.bottom,
                    relatedBy: NSLayoutRelation.greaterThanOrEqual,
                    toItem: registerButton,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: -160
                ),
            ]
        )
        
        let attributtedString = NSMutableAttributedString.init(string: "\("By clicking register I agree to your".localized) ", attributes: [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.normal])
        attributtedString.append(NSAttributedString.init(string: "\("Terms".localized).", attributes: [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.normal, NSUnderlineStyleAttributeName: 1]))
        
        let termsButton = UIButton.init()
        termsButton.translatesAutoresizingMaskIntoConstraints = false
        termsButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        termsButton.setAttributedTitle(attributtedString, for: UIControlState.normal)
        termsButton.titleLabel?.font = UIFont.normal
        termsButton.addTarget(self, action: #selector(self.termsButtonAction(sender:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(termsButton)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: termsButton,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: registerButton,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 8
                ),
                NSLayoutConstraint.init(
                    item: termsButton,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: registerButton,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: termsButton,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: registerButton,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: termsButton,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: registerButton,
                    attribute: NSLayoutAttribute.height,
                    multiplier: 1.0,
                    constant: 0
                ),
            ]
        )
        
    }
    
    func confirmPasswordValid() -> Bool{
        weak var _self = self
        if self.confirmPasswordField.isValid(emptyAllowed: false) {
            if let textConfirmPassword = _self?.confirmPasswordField.textField.text,
                let textPassword = _self?.passwordField.textField.text {
                _self?.confirmPasswordField.setAs(valid: textConfirmPassword == textPassword)
                return textConfirmPassword == textPassword
            }
        }
        return false
    }

    func backButtonAction(sender: UIButton){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func register(){
        var valid = true
        if !self.emailField.isValid(emptyAllowed: false){
            self.emailField.setAs(valid: false)
            valid = false
        }
        if !self.usernameField.isValid(emptyAllowed: false){
            self.usernameField.setAs(valid: false)
            valid = false
        }
        if !self.passwordField.isValid(emptyAllowed: false){
            self.passwordField.setAs(valid: false)
            valid = false
        }
        if !self.confirmPasswordValid(){
            valid = false
        }
        if !valid {
            return
        }
        
        KVNProgress.show()
        Network.Register(email: self.emailField.textField.text ?? "", userName: self.usernameField.textField.text ?? "", password: self.passwordField.textField.text ?? "")
            .responseModel(
                successCompletion: { (model: UserModel) in
                    FlowManager.currentUser = model
                    KVNProgress.dismiss()
                    FlowManager.loadMain()
                    
            }) { (errorMessage) in
                errorMessage.log()
                KVNProgress.showError(withStatus: errorMessage)
        }
    }
    
    func termsButtonAction(sender: UIButton){
        if let url = URL.init(string: Constants.kTermsURL){
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
