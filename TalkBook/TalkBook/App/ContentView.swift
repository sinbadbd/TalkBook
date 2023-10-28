//
//  ContentView.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var appState: AppState
    var body: some View {
    
        viewForState(appState)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if UserDefaultsManager.shared.isUserLoggedIn {
                        appState = .dashboard
                    } else if !UserDefaultsManager.shared.isFirstLaunch {
                        appState = .onboarding
                    } else {
                        appState = .login
                    }
                }
            }
    }
}
extension ContentView{
    private func viewForState(_ state: AppState) -> some View {
        switch state {
        case .splash:
            return AnyView(SplashScreen())
        case .onboarding:
            return AnyView(OnboardingScreen(appState: $appState))
        case .login:
            return AnyView(LoginView(appState: $appState))
        case .dashboard:
            return AnyView(TabContainerView(appState:  $appState))
        }
    }
}
#Preview {
    ContentView(appState: .constant(.dashboard))
}
