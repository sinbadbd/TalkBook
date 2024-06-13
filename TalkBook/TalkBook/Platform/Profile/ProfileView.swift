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
    var userInfo: UserModel?
    @ObservedObject var userMVM: UserProfileVM = .init()
    
    
    var body: some View {
        VStack{
            HeaderView_one(backButton: "chevron.backward", title: userInfo?.username, rightImageOne: "pencil", rightImageTwo: "magnifyingglass") {
                
            } onRightOne: {
                
            } onRightTwo: {
                
            }
            .padding(.horizontal, 16)
            
            ScrollView {
                VStack{
                    ProfileConviewPhotoView(userInfo: userInfo)
                    ProfileInfoView(userInfo: userInfo)
                        .padding(.top, 40)
                        .padding(.horizontal, 16)
                }
            }
        }
        .onAppear(perform: {
            userMVM.getUserData(id: userInfo?.id)
        })
        .padding(.top, edges?.top)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ProfileView()
}
