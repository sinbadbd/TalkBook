//
//  ContentView.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI

struct ContentView: View {
 
    @ObservedObject var coordinator = AppCoordinator()
 
    @State private var isOnboardComplete: Bool
    @State private var showSplashScreen: Bool = true
    
    init() {
        isOnboardComplete = UserDefaultsManager.shared.isFirstLaunch
    }
    var body: some View {
        
        NavigationStack(path:  $coordinator.path) {
            if showSplashScreen {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            showSplashScreen = false
                        }
                    }
            } else if isOnboardComplete {
                CommonNavigationView {
                    if UserDefaultsManager.shared.isUserLoggedIn {
                        Platform()
                    } else {
                        LoginView()
                    }
                }
                    
            } else {
                OnboardingScreen(onContinue: onContinue)
            }
            
        }
        .environmentObject(coordinator)
        .onAppear {
            print("destination: \(coordinator.path)")
        }
        .onOpenURL { url in
            coordinator.handleDeepLink(url: url)
        }
    }
    
    private func onContinue() {
        UserDefaultsManager.shared.isFirstLaunch = true
        isOnboardComplete = true
        //coordinator.loadPlatfromAsRoot(onSuccess: nil)
    }
}
 
#Preview {
    ContentView()
}

struct CommonNavigationView<Content: View>: View {
    var content: Content
    @EnvironmentObject var coordinator: AppCoordinator
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .navigationDestination(for: DestinationFlowPage.self) { destination in
                NavigateViewFactory.viewForDestination(destination)
            }
            .sheet(item: $coordinator.sheetPage) { page in
                NavigateViewFactory.viewForDestination(page)
            }
    }
}
