//
//  AppDelegate.swift
//  PolkopApp
//
//  Created by Marcel Mierzejewski on 9/3/17.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//


import UIKit
import MMDrawerController
import KeychainAccess

class FlowManager {
    
    static var currentUser: UserModel?
    
    static var drawerController: MMDrawerController?
    
    static func loadInitialView(){
            self.loadLogin()
    }
    
    static func loadLogin(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                fatalError()
        }
        
        let navigationController = UINavigationController.init(rootViewController: LoginViewController())
        navigationController.isNavigationBarHidden = true
        
        appDelegate.window?.rootViewController = navigationController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    static func loadMain(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                fatalError()
        }
        
        let navigationController = ExtendedNavigationController.init(rootViewController: MainViewController())
        navigationController.isNavigationBarHidden = false
        
        appDelegate.window?.rootViewController = navigationController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    static func loadUser(){
       
    }

}
