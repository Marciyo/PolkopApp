//
//  ProfileViewController.swift
//  PolkopApp
//
//  Created by GSK on 06/09/2017.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import UIKit
import KVNProgress


class ProfileViewController: UIViewController {
    
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
    
    let tableView = UITableView.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.navigationItem.title = "Edit profile".localized
        
        let backButton = UIButton.init()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(#imageLiteral(resourceName: "icons8-Delete-50"), for: UIControlState.normal)
        backButton.imageView?.contentMode = .center
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

        self.emailField.setNextResponder(nextField: self.usernameField.textField)
        self.view.addSubview(self.emailField)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.emailField,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: 100
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
            ]MARCEl JEST SLABY W FIFE I LUBI CHLOPCOW
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
                )
            ]
        )
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.register(BasicTableViewCell.self, forCellReuseIdentifier: "basic")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.tableView,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.passwordField,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 8
                ),
                NSLayoutConstraint.init(
                    item: self.tableView,
                    attribute: NSLayoutAttribute.centerX,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.tableView,
                    attribute: NSLayoutAttribute.bottom,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.tableView,
                    attribute: NSLayoutAttribute.width,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.width,
                    multiplier: 1.0,
                    constant: 0
                )
            ]
        )
    }


}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        //        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "basic", for: indexPath) as! BasicTableViewCell
        //        let model = self.data[indexPath.row]
        
        cell.itemImage.image = #imageLiteral(resourceName: "DuraStar_LocalDelivery_M_2x_750x520")
        cell.itemLabel.text = "Trunk number \(indexPath.item) to rent"
        cell.descriptionLabel.text = "Poznań, Rataje, 📍2.4km"
        
        if indexPath.item > 3{
            cell.premiumImage.removeFromSuperview()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
