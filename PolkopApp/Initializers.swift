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
import GoogleMaps

class Initializers {
    
    static func initializeAll(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey: Any]?){
        
        
        if !UIDevice.isSimulator{
            UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
                if granted {
                    application.registerForRemoteNotifications()
                }
            }
        }
        self.initializeKVNProgress()
        GMSServices.provideAPIKey("AIzaSyAbIkBiUioZ_u7AZBDfeYE0IF2n7dUWKlg")
    
//        FirebaseApp.configure()
        IQKeyboardManager.shared().isEnabled = true
    }
    
    static func initializeKVNProgress(){
        let config = KVNProgressConfiguration.init()
        config.backgroundTintColor = UIColor.main
        config.circleStrokeForegroundColor = UIColor.white
        config.successColor = UIColor.white
        config.statusColor = UIColor.white
        config.errorColor = UIColor.white
        config.statusFont = UIFont.small
        config.isFullScreen = true
        KVNProgress.setConfiguration(config)
    }
}
