//
//  OnboardingScreen.swift
//  TalkBook
//
//  Created by Imran on 28/10/23.
//

import SwiftUI
import KitBase

struct OnboardingScreen: View {
    @Binding var appState: AppState
    var body: some View {
        VStack{
            
            Button {
                withAnimation {
            
                        UserDefaultsManager.shared.isFirstLaunch = true
                        appState = .login
                    
                }
            } label: {
                Image(systemName: "arrow.right.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)
                    .foregroundColor(.red)
            }
            .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .solid, backgroundColor: .red, borderColor: .clear, foregroundColor: .white, buttonWidth: UIScreen.main.bounds.width * 0.8, borderWidth: 1))

        }
    }
}

#Preview {
    OnboardingScreen(appState: .constant(.onboarding))
}
