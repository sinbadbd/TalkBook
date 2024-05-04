//
//  MenuView.swift
//  TalkBook
//
//  Created by Imran on 31/10/23.
//

import SwiftUI
import SwiftUIKit

struct MenuView: View {
    
    @ObservedObject private var auth: AuthVM = .init()
    @Binding var appState: AppState
    var body: some View {
        Button {
            auth.logout { success in
                if success == true {
                    appState = .login
                    Provider.access_token = ""
                    Provider.userId = ""
                    print("Provider.access_token: \(Provider.access_token)")
                    print("Provider.userId: \(Provider.userId)")
                    UserDefaultsManager.shared.isUserLoggedIn = false
                }else {
                    print("Something wrong!")
                }
            }
        } label: {
            Text("logout")
        }
        .buttonStyle(
            KitBaseButtonStyleBuilder()
                .setBackgroundColor(.gray)
                .setForegroundColor(.black)
                .setButtonWidth(200)
                .setButtonHeight(30)
                .setIcon("square.and.arrow.up")
                .setImage("ic_edit")
                .setIconColor(.red)
                .setIconColor(.red)
                .setIconWidth(20)
                .setIconHeight(20)
                .setShowShadow(false) // Default true
            //.setPaddingAll(paddingAll: 0)
                .setPaddingVertical(paddingVertical: 0)
                .setPaddingHorizontal(paddingHorizontal: 0)
                .build()
        )
        
    }
}

#Preview {
    MenuView(appState: .constant(.dashboard))
}
