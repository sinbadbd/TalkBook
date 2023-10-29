//
//  Provider.swift
//  MovieZoo
//
//  Created by Imran on 19/9/23.
//

import Foundation

struct Provider {
    static var session_id: String? {
        get {
            return UserDefaults.standard.string(forKey: "session_id")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "session_id")
        }
    }
}
