//
//  AppDelegate.swift
//  PolkopApp
//
//  Created by Marcel Mierzejewski on 9/3/17.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import Foundation
import UIKit

class ErrorHandler {
    static func handleError(code: Int) -> String {
        "Handle error with code: \(code) 😡".log()
        switch code {
        case 404: return "No user exist!".localized
        default:
            return "Something went wrong! Please try again.".localized
        }
    }
}

