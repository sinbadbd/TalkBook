//
//  DestinationFlowPage.swift
//  SwiftUI-Navigation
//
//  Created by Imran on 17/4/24.
//

import Foundation

enum DestinationFlowPage: Hashable, Identifiable {
    
    static func == (lhs: DestinationFlowPage, rhs: DestinationFlowPage) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    var id: String {
        String(describing: self)
    }

    case auth(AuthPage)
    case platform(PlatformTab)
    case detailsPage(DetailsPage)
    case profile(profilePage)
    case about(AboutPage)
    
    func hash(into hasher: inout Hasher) {
        // Hashing logic based on the enum case
        switch self {
        case .auth(_):
            hasher.combine("auth")
        case .platform(_):
            hasher.combine("platform")
        case .detailsPage(_):
            hasher.combine("detailsPage")
        case .profile(_):
            hasher.combine("profile")
        case .about(_):
            hasher.combine("about")
        }
    }
}
