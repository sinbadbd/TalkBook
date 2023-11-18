//
//  ApiHeader.swift
//  TalkBook
//
//  Created by Imran on 18/11/23.
//

import Foundation

typealias Headers = [String: String]

class NetworkHeaders {
    static func createHeaders() -> Headers {
        var headers: Headers = [:]
        let token = Provider.access_token
        
        if !token.isEmpty {
            headers["Authorization"] = "Bearer \(token)"
        }
        return headers
    }
}
