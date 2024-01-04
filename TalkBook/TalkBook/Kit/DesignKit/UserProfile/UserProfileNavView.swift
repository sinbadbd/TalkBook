//
//  UserProfileNavView.swift
//  TalkBook
//
//  Created by Imran on 3/1/24.
//

import SwiftUI

struct UserProfileNavView: View {

    @Environment(\.presentationMode) var dismiss
//    var profileImage: String?
//    var title: String?
//        
    
    var userModel: UserModel?
    
    var body: some View {
        VStack{
            HStack(alignment:.center){
                
                Button(action: {
                    dismiss.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 16, height: 16)
                })
                Spacer()
                VStack{
                    Text(userModel?.fullname ?? "")
                        .font(.title2)
                        .frame(alignment: .center)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    UserProfileNavView()
}
