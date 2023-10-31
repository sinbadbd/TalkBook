//
//  HeaderCreatePostView.swift
//  TalkBook
//
//  Created by Imran on 31/10/23.
//

import SwiftUI
import KitBase

struct HeaderCreatePostView: View {
    
    @State private var showPostModal = false
    @State private var showPhotoModal = false
    
    var body: some View {
        
        HStack{
            Image("dsfs copy")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Button {
                showPostModal = true
            } label: {
                Text("What's on your mind?")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .fullScreenCover(isPresented: $showPostModal) {
                VStack{
                    SheetHeaderTopView(title: "Create Post") {
                        showPostModal = false
                    } savePost: {
                        showPostModal = false
                    }
                                   
                }
                .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
            }
            
            Button {
                showPhotoModal = true
            } label: {
                KBButtonCircleView(iconName: "photo.on.rectangle.angled", foregroundColor: .red, backgroundColor: .clear, borderColor: .clear, width: 24, height: 24, fontSize: 24)
            }
            .fullScreenCover(isPresented: $showPhotoModal) {
                VStack{
                    SheetHeaderTopView(title: "Camera roll") {
                        showPhotoModal = false
                    } savePost: {
                        showPhotoModal = false
                    }
                    
                }
                .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
            }
        }
    }
}

//#Preview {
//    HeaderCreatePostView()
//}

#Preview {
    HomeView()
}


//

