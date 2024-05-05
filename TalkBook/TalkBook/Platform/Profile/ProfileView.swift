//
//  ProfileView.swift
//  TalkBook
//
//  Created by Imran on 31/10/23.
//

import SwiftUI
import SwiftUIKit

struct ProfileView: View {
    
    let edges = UIWindow.keyWindow?.safeAreaInsets
    
    var body: some View {
        VStack{
            HeaderView_one(backButton: "chevron.backward", title: "The Nav Title", rightImageOne: "pencil", rightImageTwo: "magnifyingglass") {
                
            } onRightOne: {
                
            } onRightTwo: {
                
            }
            .padding(.horizontal, 16)
            
            ScrollView {
                ProfileConviewPhotoView()
            }
        }
        .padding(.top, edges?.top)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ProfileView()
}
