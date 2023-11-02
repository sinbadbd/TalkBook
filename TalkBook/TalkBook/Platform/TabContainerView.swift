//
//  TabContainerView.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI

struct TabContainerView: View {
    
    @Binding var appState: AppState
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house").foregroundColor(.red)
                }
            FriendsView()
                .tabItem {
                    Label("Friends", systemImage: "person.2").foregroundColor(.red)
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle").foregroundColor(.red)
                }
            NotificationsView()
                .tabItem {
                    Label("Notifications", systemImage: "bell").foregroundColor(.red)
                }
            MenuView(appState: $appState)
                .tabItem {
                    Label("Menu", systemImage: "gear").foregroundColor(.red)
                }
        }
    }
}

#Preview {
    TabContainerView(appState: .constant(.dashboard))
}
