//
//  RestApi.swift
//  MovieZoo
//
//  Created by Imran on 2/9/23.
//

import Foundation


public struct RestApi {
    public var host: String
    public var version: String
    public var apiKey: String
}

extension RestApi {
    public var baseURL: String { "https://" + host }
    public var httpBaseURL: String { "http://" + host }
    public var httpsBaseURL: String { "https://" + host }
}

extension RestApi {
    init(for environment: Environment) {
        switch environment {
        case .production:       host = "localhost:2000/api/"
        case .preProduction:    host = ""
        case .staging:          host = ""
        case .develop:          host = "localhost:2000/api/"
        }
        version = ""
        apiKey = ""
    }
}

public struct WebURL {
    public static var url = ""
}
