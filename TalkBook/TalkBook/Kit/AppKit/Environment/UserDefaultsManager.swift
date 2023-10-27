//
//  UserDefaultsManager.swift
//  MovieZoo
//
//  Created by Imran on 21/9/23.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let userDefaults = UserDefaults.standard
    
    var isFirstLaunch: Bool {
        get {
            return userDefaults.bool(forKey: "isFirstLaunch")
        }
        set {
            userDefaults.set(newValue, forKey: "isFirstLaunch")
        }
    }
    
    var isUserLoggedIn: Bool {
        get {
            return userDefaults.bool(forKey: "isUserLoggedIn")
        }
        set {
            userDefaults.set(newValue, forKey: "isUserLoggedIn")
        }
    }
}
