//
//  AddItemViewController.swift
//  PolkopApp
//
//  Created by GSK on 06/09/2017.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import UIKit
import SnapKit

class AddItemViewController: UIViewController {
    
    let nameField = ExtendedTextField.init(
        placeholder: "Item name".localized,
        pattern: Constants.Paterns.Anything,
        keyboardType: UIKeyboardType.default,
        autocorrectionType: UITextAutocorrectionType.default,
        autocapitalizationType: UITextAutocapitalizationType.sentences,
        isSecure: false
    )
    
    let keywordsField = ExtendedTextField.init(
        placeholder: "Keywords".localized,
        pattern: Constants.Paterns.Anything,
        keyboardType: UIKeyboardType.default,
        autocorrectionType: UITextAutocorrectionType.default,
        autocapitalizationType: UITextAutocapitalizationType.sentences,
        isSecure: false
    )
    
    let placeField = ExtendedTextField.init(
        placeholder: "Search place near...".localized,
        pattern: Constants.Paterns.Anything,
        keyboardType: UIKeyboardType.default,
        autocorrectionType: UITextAutocorrectionType.default,
        autocapitalizationType: UITextAutocapitalizationType.sentences,
        isSecure: false
    )
    
    let priceSlider = UISlider.init()
    let proximitySlider = UISlider.init()
    
    let sliderMaxValue: Float = 20
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Search for item".localized

        self.view.backgroundColor = UIColor.white
        
        self.layoutTextFields()
        
        self.createUISliders()
        
        self.createButtons()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func layoutTextFields(){
        self.view.addSubview(self.nameField)
        self.nameField.snp.makeConstraints { (item) in
            item.centerX.equalToSuperview()
            item.top.equalToSuperview().offset(120)
        }
        
        self.view.addSubview(self.keywordsField)
        self.keywordsField.snp.makeConstraints { (item) in
            item.centerX.equalToSuperview()
            item.top.equalTo(self.nameField.snp.bottom).offset(20)
        }
        
        self.view.addSubview(self.placeField)
        self.placeField.snp.makeConstraints { (item) in
            item.centerX.equalToSuperview()
            item.top.equalTo(self.keywordsField.snp.bottom).offset(20)
        }
    }
    
    func createUISliders(){
        self.view.addSubview(self.priceSlider)
        self.priceSlider.snp.makeConstraints { (item) in
            item.width.equalToSuperview().multipliedBy(0.8)
            item.centerX.equalToSuperview()
            item.top.equalTo(self.placeField.snp.bottom).offset(120)
        }
        
        self.priceSlider.maximumValue = self.sliderMaxValue
        self.priceSlider.minimumValue = 1
        self.priceSlider.isContinuous = true
        
        let widthLabel = UILabel.init()
        widthLabel.text = "Price:"
        widthLabel.font = UIFont.normal

        self.view.addSubview(widthLabel)
        
        widthLabel.snp.makeConstraints { (item) in
            item.left.equalTo(self.priceSlider.snp.left).offset(0)
            item.top.equalTo(self.priceSlider.snp.bottom).offset(10)
        }
        
        
        self.view.addSubview(self.proximitySlider)
        self.proximitySlider.snp.makeConstraints { (item) in
            item.width.equalToSuperview().multipliedBy(0.8)
            item.centerX.equalToSuperview()
            item.bottom.equalTo(self.priceSlider).offset(-80)
        }
        
        self.proximitySlider.maximumValue = self.sliderMaxValue
        self.proximitySlider.minimumValue = 1
        self.proximitySlider.isContinuous = true
        
        let lenghtLabel = UILabel.init()
        lenghtLabel.text = "Maximum distance:"
        lenghtLabel.font = UIFont.normal

        self.view.addSubview(lenghtLabel)
        lenghtLabel.snp.makeConstraints { (item) in
            item.left.equalTo(self.proximitySlider.snp.left).offset(0)
            item.top.equalTo(self.proximitySlider.snp.bottom).offset(10)
        }

    }
    
    func createButtons(){
        let searchButton = ExtendedButton.init(
        title: "SEARCH NOW".localized) {
            let alertController = UIAlertController(title: "Searching", message: "not really...", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "OK",
                                         style: .default,
                                         handler: nil) //You can use a block here to handle a press on this button
            
            alertController.addAction(actionOk)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        searchButton.backgroundColor = UIColor.lightGray
        self.view.addSubview(searchButton)
        searchButton.snp.makeConstraints { (item) in
            item.centerX.equalToSuperview()
            item.bottom.equalToSuperview().offset(-80)
        }
    }
}
