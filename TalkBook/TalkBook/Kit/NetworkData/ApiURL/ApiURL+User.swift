//
//  ApiURL+User.swift
//  TalkBook
//
//  Created by Imran on 3/1/24.
//

import Foundation

extension ApiURL.User {
    func getURL() -> String {
        let baseURL = ApiConfig.httpBase
        var endPart = ""
        switch self {
        case .getUser: endPart = "user/%@"
        }
        return "\(baseURL)\(endPart)"
    }
}
