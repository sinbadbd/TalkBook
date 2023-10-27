//
//  ApiURL+Auth.swift
//  NetworkKit
//
//  Created by Imran on 5/8/23.
//

import Foundation

extension ApiURL.Auth {
    func getURL() -> String {
        let baseURL = ApiConfig.httpBase + "auth"
        var endPart = ""
        switch self {
        case .register: endPart = "/register"
        case .login: endPart = "/login"
        }
        return "\(baseURL)\(endPart)"
    }
}
