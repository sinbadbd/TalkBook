//
//  Provider.swift
//  MovieZoo
//
//  Created by Imran on 19/9/23.
//

import Foundation

struct Provider {
    static var access_token: String {
        get {
            return UserDefaults.standard.string(forKey: "token") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "token")
        }
    }
    static var userId: String{
        get{
           return UserDefaults.standard.string(forKey: "userId") ?? ""
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "userId")
        }
    }
}
