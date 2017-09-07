//
//  LoginViewController.swift
//  Eracoin App
//
//  Created by Marcel Mierzejewski on 08.02.2017.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import UIKit
import KVNProgress

class LoginViewController: LoginBaseViewController {

    let emailField = ExtendedTextField.init(
        placeholder: "E-mail".localized,
        pattern: Constants.Paterns.Email,
        keyboardType: UIKeyboardType.emailAddress,
        autocorrectionType: UITextAutocorrectionType.no,
        autocapitalizationType: UITextAutocapitalizationType.none,
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoView = UIImageView.init(image: #imageLiteral(resourceName: "Azerbaijan_Architecture_Construction_logo"))
        
        logoView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(logoView)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: logoView,
                    attribute: NSLayoutAttribute.centerY,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.centerY,
                    multiplier: 0.36,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: logoView,
                    attribute: NSLayoutAttribute.centerX,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 0
                ),
                ]
        )
        
        self.emailField.setNextResponder(nextField: self.passwordField.textField)
        self.emailField.textField.textColor = UIColor.white
        self.view.addSubview(self.emailField)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.emailField,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.greaterThanOrEqual,
                    toItem: logoView,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 46
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
        
        self.passwordField.onEndFunction = {
            self.login()
        }
        self.passwordField.textField.textColor = UIColor.white
        self.view.addSubview(self.passwordField)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.passwordField,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.emailField,
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
        
        let loginButton = ExtendedButton.init(
            title: "LOGIN NOW".localized) { 
                self.login()
        }
        
        self.view.addSubview(loginButton)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: loginButton,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: -200
                ),
                NSLayoutConstraint.init(
                    item: loginButton,
                    attribute: NSLayoutAttribute.centerX,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.passwordField,
                    attribute: NSLayoutAttribute.bottom,
                    relatedBy: NSLayoutRelation.greaterThanOrEqual,
                    toItem: loginButton,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: -126
                ),
            ]
        )
        
        let socialButtonsView = UIView.init()
        socialButtonsView.translatesAutoresizingMaskIntoConstraints = false
        socialButtonsView.backgroundColor = UIColor.white
        socialButtonsView.layer.cornerRadius = 6
        socialButtonsView.clipsToBounds = true
        
        self.view.addSubview(socialButtonsView)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: socialButtonsView,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: loginButton,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 16
                ),
                NSLayoutConstraint.init(
                    item: socialButtonsView,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: loginButton,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: socialButtonsView,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: loginButton,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: socialButtonsView,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: loginButton,
                    attribute: NSLayoutAttribute.height,
                    multiplier: 1.0,
                    constant: 0
                ),
            ]
        )
        
        let facebookButton = UIButton.init()
        facebookButton.backgroundColor = UIColor.facebook
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
//        facebookButton.setImage(#imageLiteral(resourceName: "facebook-icon-preview-1-400x400"), for: UIControlState.normal)
        facebookButton.setTitle("  \("Log in with Facebook".localized)", for: UIControlState.normal)
        facebookButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        facebookButton.titleLabel?.font = UIFont.button
        facebookButton.tag = 1
//        facebookButton.addTarget(self, action: #selector(self.socialButtonAction(sender:)), for: UIControlEvents.touchUpInside)
        socialButtonsView.addSubview(facebookButton)
        
        socialButtonsView.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: facebookButton,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: socialButtonsView,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: facebookButton,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: socialButtonsView,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: facebookButton,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: socialButtonsView,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: facebookButton,
                    attribute: NSLayoutAttribute.bottom,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: socialButtonsView,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 0
                ),
            ]
        )
        
        let registerButton = UIButton.init()
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        registerButton.setTitle("Don't have an account?".localized, for: UIControlState.normal)
        registerButton.titleLabel?.font = UIFont.normal
        registerButton.titleLabel?.adjustsFontSizeToFitWidth = true
        registerButton.addTarget(self, action: #selector(self.registerButtonAction(sender:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(registerButton)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: registerButton,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: socialButtonsView,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 8
                ),
                NSLayoutConstraint.init(
                    item: registerButton,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: loginButton,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: registerButton,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: loginButton,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: -5
                ),
                NSLayoutConstraint.init(
                    item: registerButton,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: loginButton,
                    attribute: NSLayoutAttribute.height,
                    multiplier: 1.0,
                    constant: 0
                ),
            ]
        )
        
        let forgotPasswordButton = UIButton.init()
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        forgotPasswordButton.setTitle("Forgot your password?".localized, for: UIControlState.normal)
        forgotPasswordButton.titleLabel?.font = UIFont.normal
        forgotPasswordButton.titleLabel?.adjustsFontSizeToFitWidth = true
        forgotPasswordButton.addTarget(self, action: #selector(self.forgotPasswordButtonAction(sender:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(forgotPasswordButton)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: forgotPasswordButton,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: socialButtonsView,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 8
                ),
                NSLayoutConstraint.init(
                    item: forgotPasswordButton,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: loginButton,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 5
                ),
                NSLayoutConstraint.init(
                    item: forgotPasswordButton,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: loginButton,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: forgotPasswordButton,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: loginButton,
                    attribute: NSLayoutAttribute.height,
                    multiplier: 1.0,
                    constant: 0
                ),
            ]
        )
    }
    
    func registerButtonAction(sender: UIButton){
        print("Open register screen...")
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    func forgotPasswordButtonAction(sender: UIButton){
        print("Open recive password screen...")
        self.navigationController?.pushViewController(ReceivePasswordViewController(), animated: true)
    }
    
    func login(){
        //for NOW - TO BE CHANGED
        FlowManager.loadMain()
        return
        
        var valid = true
        if !self.emailField.isValid(emptyAllowed: false){
            self.emailField.setAs(valid: false)
            valid = false
        }
        if !self.passwordField.isValid(emptyAllowed: false){
            self.passwordField.setAs(valid: false)
            valid = false
        }
        if !valid {
            return
        }
        print("Login...")
        KVNProgress.show()
        Network.Login(email: self.emailField.textField.text ?? "", password: self.passwordField.textField.text ?? "")
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
    
    
    func loginByFacebook(_ token: String){
        KVNProgress.show()
        Network.LoginFacebook(facebookToken: token)
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
}
