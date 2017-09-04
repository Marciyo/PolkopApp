//
//  ViewController.swift
//  PolkopApp
//
//  Created by Marcel Mierzejewski on 9/3/17.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    enum LeftButtonType {
        case menu
        case back
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.setupLeftButton(type: .menu)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        "Init: \(self)".log()
    }
    
    deinit {
        "Deinit: \(self)".log()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillChangeFrame(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    //MARK:- Keyboard
    
    func keyboardWillChangeFrame(_ notification: Notification) {}
    
    func menuButtonAction(){
        if let drawerController = FlowManager.drawerController{
            drawerController.toggle(.left, animated: true, completion: { (_) in })
        }
    }
    
    func backButtonAction(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func setupLeftButton(type: LeftButtonType){
        switch type {
        case .menu:
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(
                image: #imageLiteral(resourceName: "Menu Icon"),
                style: UIBarButtonItemStyle.plain,
                target: self,
                action: #selector(self.menuButtonAction)
            )
            break
            
        case .back:
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(
                image: #imageLiteral(resourceName: "arrow_back_Icon"),
                style: UIBarButtonItemStyle.plain,
                target: self,
                action: #selector(self.backButtonAction)
            )
            break
        }
    }
}

