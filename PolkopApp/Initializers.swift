//
//  AppDelegate.swift
//  PolkopApp
//
//  Created by Marcel Mierzejewski on 9/3/17.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//


import UIKit
import UserNotifications
import IQKeyboardManager
import Firebase
import KVNProgress

class Initializers {
    
    static func initializeAll(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey: Any]?){
        
    }
    
    static func initializeIQKeyboardManager(){
        IQKeyboardManager.shared().isEnabled = true
    }
}
