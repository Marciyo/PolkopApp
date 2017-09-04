
//
//  AppDelegate.swift
//  PolkopApp
//
//  Created by Marcel Mierzejewski on 9/3/17.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import KeychainAccess
import UIKit

class Configuration {
    
    static func saveUserID(userID: String) {
        let keychain = Keychain(service: Constants.Keys.KeychainBundle)
        do {
            try keychain
                .synchronizable(true)
                .set(userID, key: Constants.Keys.KeychainUserIdKey)
            
        } catch let error {
            "\(self) - error: \(error)".log()
            return
        }
    }
    
    static func saveAuthorization(authorization: String) {
        let keychain = Keychain(service: Constants.Keys.KeychainBundle)
        do {
            try keychain
                .synchronizable(true)
                .set("Bearer \(authorization)", key: Constants.Keys.KeychainAuthorizationKey)
            
        } catch let error {
            "\(self) - error: \(error)".log()
            return
        }
    }
    
    static func getUserID() -> String? {
        return Keychain(service: Constants.Keys.KeychainBundle)[Constants.Keys.KeychainUserIdKey]
    }
    
    static func getAuthorization() -> String? {
        return Keychain(service: Constants.Keys.KeychainBundle)[Constants.Keys.KeychainAuthorizationKey]
    }
}
