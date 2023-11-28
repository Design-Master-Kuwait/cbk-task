//
//  Constant.swift
//  CbkTask
//
//  Created by bhikhu on 28/11/23.
//

import Foundation
import Foundation
import UIKit
import KeychainAccess
import Reachability


#if DEBUG
// APPSTORE version
let keychain = Keychain(service: "com.cbktask.keychain.development")

#elseif STAGING
// CbkTest ENTERPRISE version
let keychain = Keychain(service: "com.cbktask.keychain.stage")

#elseif RELEASE
// CbkTest ENTERPRISE DEMO version
let keychain = Keychain(service: "com.cbktask.keychain")

#else
// CbkTest DEVELOPMENT version
let keychain = Keychain(service: "com.cbktask.keychain.development")

#endif


/// General object for the Reachability
let reachability                                = try! Reachability()

/// General object of UserDefaults
let USER_DEFAULTS                               =   UserDefaults.standard

/// General object of Main Bundle
let MAIN_BUNDLE                                 =   Bundle.main
