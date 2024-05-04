//
//  Auth+Router.swift
//  SwiftUI-Navigation
//
//  Created by Imran on 17/4/24.
//

import Foundation

protocol OnBoardProtocol{
    func goToAuthPage()
}

extension AppCoordinator: OnBoardProtocol{

    func goToAuthPage() {
        navigateTo(.auth(.login))
    }
}


protocol AuthProtocol{
    func goToHomePage()
    func goToRegistrationPage()
    func goPlatfromAsRoot()
}

extension AppCoordinator: AuthProtocol{
    func goPlatfromAsRoot() {
        navigateAsRoot(.platform(.platform))
    }
    
    func goToHomePage() {
        navigateTo(.platform(.platform))
    }
    
    func goToRegistrationPage() {
        navigateTo(.auth(.registration))
    }
    
}
