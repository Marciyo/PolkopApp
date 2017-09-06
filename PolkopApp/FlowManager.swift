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
    private static var timer: Timer?
    static var currentUser: UserModel? {
        didSet{
            if let currentUser = self.currentUser, let apiToken = currentUser.apiToken, let userId = currentUser.userId{
                Configuration.saveAuthorization(authorization: apiToken)
                Configuration.saveUserID(userID: userId.description)
            }
            
            if self.currentUser == nil {
                if self.timer != nil{
                    self.timer?.invalidate()
                    self.timer = nil
                }
            }else{
                if self.timer == nil{
                    self.timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (_) in
                        self.loadUser()
                    }
                }
            }
        }
    }
    
    static var drawerController: MMDrawerController?
    static let tabBarController = UITabBarController()
    
    static func loadInitialView(){
        
        if Configuration.getAuthorization() == nil {
            self.loadLogin()
        }else{
            NotificationCenter.default.addObserver(self, selector: #selector(self.loadUser), name:  NSNotification.Name(rawValue: Constants.Keys.NotificationRefresh), object: nil)
            self.loadMain()
        }
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
        
        if self.currentUser == nil{
            self.loadUser()
        }
        
        let main = UINavigationController.init(rootViewController: MainTableViewController())
        main.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarSystemItem.search, tag: 0)
        let map = UINavigationController.init(rootViewController: MapViewController())
        map.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarSystemItem.bookmarks, tag: 0)
        let add = UINavigationController.init(rootViewController: AddItemViewController())
        add.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarSystemItem.more, tag: 0)
        let profile = UINavigationController.init(rootViewController: ProfileViewController())
        profile.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarSystemItem.contacts, tag: 0)

        
        self.tabBarController.viewControllers = [main, map, add, profile]
        
        self.drawerController = MMDrawerController.init(center: self.tabBarController, leftDrawerViewController: DrawerMenuViewController())
        self.drawerController?.maximumLeftDrawerWidth = 280
        self.drawerController?.closeDrawerGestureModeMask = [.panningCenterView, .tapCenterView, .tapNavigationBar]
        self.drawerController?.openDrawerGestureModeMask = .bezelPanningCenterView
        
        appDelegate.window?.rootViewController = self.drawerController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    @objc static func loadUser(){
        
        Network.GetMe().responseModel(
            successCompletion: { (model: UserModel) in
                self.currentUser = model
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Keys.UserDataLoaded), object: nil)
        },
            errorCompletion: nil
        )
    }
    
    static func reset(){
        let def = UserDefaults.standard
        def.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        def.synchronize()
        
        let keychain = Keychain(service: Constants.Keys.KeychainBundle).synchronizable(true)
        
        do {
            try keychain
                .synchronizable(true)
                .remove(Constants.Keys.KeychainUserIdKey)
        } catch let error {
            print("error: \(error)")
        }
        do {
            try keychain
                .synchronizable(true)
                .remove(Constants.Keys.KeychainAuthorizationKey)
        } catch let error {
            print("error: \(error)")
        }
        
        
        def.set(false, forKey: "enabled_restart")
        def.synchronize()
        
        self.currentUser = nil
        self.loadInitialView()
    }
}
