//
//  ApiURL.swift
//  NetworkKit
//
//  Created by Imran on 5/8/23.
//
 
public struct ApiConfig {
    public static var baseURL: String { AppCoreKit.restApi.baseURL }
    public static var httpBase: String { AppCoreKit.restApi.httpBaseURL }
    public static var httpsBase: String { AppCoreKit.restApi.httpsBaseURL }
    public static var version: String { AppCoreKit.restApi.version }
    public static var apiKey: String { AppCoreKit.restApi.apiKey }
}

struct ApiURL {
    enum Settings {
        case settings
    }
    enum Auth {
        case register, login
    }
 
}
