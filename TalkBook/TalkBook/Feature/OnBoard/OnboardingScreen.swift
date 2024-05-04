//
//  OnboardingScreen.swift
//  TalkBook
//
//  Created by Imran on 28/10/23.
//

import SwiftUI
import SwiftUIKit

struct OnboardingScreen: View {
    let onContinue: () -> Void
    var body: some View {
        VStack{
            
            Button {
                withAnimation {
                   // UserDefaultsManager.shared.isFirstLaunch = true
                    onContinue()
                    
                }
            } label: {
                Image(systemName: "arrow.right.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)
                    .foregroundColor(.red)
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
           // .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .solid, backgroundColor: .red, borderColor: .clear, foregroundColor: .white, buttonWidth: UIScreen.main.bounds.width * 0.8, borderWidth: 1))

        }
    }
}

#Preview {
    OnboardingScreen {
        
    }
}
