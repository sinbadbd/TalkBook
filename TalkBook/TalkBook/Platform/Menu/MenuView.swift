//
//  MenuView.swift
//  TalkBook
//
//  Created by Imran on 31/10/23.
//

import SwiftUI
import KitBase

struct MenuView: View {
    
    @ObservedObject private var auth: AuthVM = .init()
    @Binding var appState: AppState
    var body: some View {
        Button {
            auth.logout { success in
                if success == true {
                    appState = .login
                    Provider.access_token = ""
                    UserDefaultsManager.shared.isUserLoggedIn = false
                }else {
                    print("Something wrong!")
                }
            }
        } label: {
            Text("logout")
        }
        .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .solid, backgroundColor: .red, foregroundColor: .white))
        
    }
}

#Preview {
    MenuView(appState: .constant(.dashboard))
}
