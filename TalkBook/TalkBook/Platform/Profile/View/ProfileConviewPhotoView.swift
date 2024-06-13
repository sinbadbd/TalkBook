//
//  ProfileConviewPhotoView.swift
//  TalkBook
//
//  Created by Imran on 5/5/24.
//

import SwiftUI
import SwiftUIKit

struct ProfileConviewPhotoView: View {
    
    var userInfo: UserModel?
    
    var body: some View {
        VStack{
            Image("cover")
                .resizable()
                .aspectRatio(contentMode: .fill)
            //                        .frame(height: 50)
                .overlay(alignment: .bottomTrailing) {
                    Button {
                        
                    } label: {
                        KBButtonType(imageType: .icon, imageViewType: .circle, iconName: "camera.fill", foregroundColor: .black, backgroundColor: .gray4, borderColor: .white, width: 20, height: 20, fontSize: 20)
                            .padding(.trailing, 12)
                            .padding(.bottom, 12)
                    }
                    
                }
                .overlay(alignment: .bottomLeading) {
                    Circle()
                        .stroke(.gray5, lineWidth: 10)
                        .frame(width: 120, height: 120)
                        .padding(.leading, 16)
                        .padding(.bottom, 12)
                        .offset(y: 50)
                        .overlay(alignment: .bottomLeading) {
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                                .padding(.leading, 16)
                                .padding(.bottom, 12)
                                .offset(y: 50)
                                .overlay(alignment:.bottomTrailing) {
                                    KBButtonType(imageType: .icon, imageViewType: .circle, iconName: "camera.fill", foregroundColor: .black, backgroundColor: .gray4, borderColor: .white, width: 10, height: 10, fontSize: 14)
                                        .padding(.trailing, 12)
                                        .padding(.bottom, 12)
                                        .offset(x:20,y: 50)
                                }
                        }
                }
            
            //.frame(height: 150)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            
            
        }
    }
}

#Preview {
   // ProfileConviewPhotoView()
    ProfileView()
}
