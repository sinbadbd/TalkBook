//
//  PostsProfileHeaderView.swift
//  TalkBook
//
//  Created by Imran on 8/11/23.
//

import SwiftUI
import Kingfisher

struct PostsProfileHeaderView: View {
    
    @Binding var isPresentPost: Bool
    @Binding var isEditPost: Bool
    //    @Binding var isPostContent: String
    @Binding var isPostContent: String
    @State var text = ""
    
    var post: Posts
    
    init(isPresentPost:
         Binding<Bool>,
         isEditPost: Binding<Bool>,
         isPostContent: Binding<String>,
         post: Posts) {
        self._isPresentPost = isPresentPost
        self._isEditPost = isEditPost
        self._isPostContent = isPostContent
        self.post = post
    }
    
    var body: some View {
        HStack(alignment:.center){
            
            NavigationLink {
                UserProfileView(id: post.user?.id ?? "")
            } label: {
                KFImage.url(URL(string: post.user?.avatar ?? ""))
                    .resizable()
                    .placeholder({ ProgressView() })
                //.setProcessor(processor)
                    .loadDiskFileSynchronously()
                    .cacheMemoryOnly()
                    .fade(duration: 0.25)
                //.lowDataModeSource(.network(image as! Resource))
                    .onProgress { receivedSize, totalSize in  }
                    .onSuccess { result in  }
                    .onFailure { error in }
                    .frame(width: 40, height: 40)
            }
            
            NavigationLink {
                UserProfileView(id: post.user?.id ?? "")
            } label: {
                
                VStack(alignment: .leading, spacing: 0){
                    Text(post.user?.fullname ?? "")
                        .bold()
                        .foregroundColor(.black)
                    Text(post.user?.createdAt ?? "set converted time")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
             
            
            Spacer()
            
            HStack(spacing:16){
                
                NavigationLink {
                    PostEditView(post: post)
                } label: {
                    VStack{
                        Image(systemName: "ellipsis")
                            .resizable()
                            .bold()
                            .foregroundColor(.gray)
                            .frame(width: 14, height: 2)
                    }.frame(width: 14, height: 14)
                }
                
                if Provider.userId != post.user?.id {
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .bold()
                            .foregroundColor(.gray)
                            .frame(width: 14, height: 14)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

//#Preview {
//    PostsProfileHeaderView(isPresentPost: .constant(true), isEditPost: .constant(true), isPostContent: .constant(""), post: .init())
//}
