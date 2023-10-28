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
        }
    }
}

#Preview {
    TabContainerView(appState: .constant(.dashboard))
}
