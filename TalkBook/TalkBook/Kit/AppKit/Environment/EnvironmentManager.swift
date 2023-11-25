//
//  EnvironmentManager.swift
//  MovieZoo
//
//  Created by Imran on 2/9/23.
//

import Foundation

public enum TalkBookEnvironment: String { case production, preProduction, staging, develop }

final class EnvironmentManager {
    static let shared: EnvironmentManager = .init()
    var environment: TalkBookEnvironment {
        didSet {
            UserDefaults.standard.setValue(environment.rawValue, forKey: "LiveMovie_APP_Environment")
        }
    }
    
    init() {
        let value = UserDefaults.standard.string(forKey: "LiveMovie_APP_Environment") ?? "production"
        environment = TalkBookEnvironment(rawValue: value) ?? .production
    }
}

extension AppCoreKit {
    public static var restApi: RestApi { RestApi(for: EnvironmentManager.shared.environment) }
}
