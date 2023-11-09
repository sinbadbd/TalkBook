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
    @Binding var isPostContent: String
    
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
            
            VStack(alignment: .leading, spacing: 0){
                Text(post.user?.fullname ?? "")
                    .bold()
                    .foregroundColor(.black)
                Text(post.user?.createdAt ?? "set converted time")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            HStack(spacing:16){
                Button {
                    isPresentPost.toggle()
                } label: {
                    VStack{
                        Image(systemName: "ellipsis")
                            .resizable()
                            .bold()
                            .foregroundColor(.gray)
                            .frame(width: 14, height: 2)
                    }.frame(width: 14, height: 14)
                    
                }
                .sheet(isPresented: $isPresentPost) {
                    ScrollView{
                        VStack{
                        
                            TextEditor(text: $isPostContent)
                            Text(post.postContent ?? "")
                            Button {
                                isEditPost.toggle()
                            } label: {
                                HStack{
                                    Image(systemName:"square.and.pencil")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 12, height: 12)
                                    
                                    Text("Edit Post")
                                }
                            }

                        }
                        .padding(.horizontal, 40)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    .presentationDetents([.large, .medium])
                    .onDisappear {
                        print("onDisappear..")
                    }
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

#Preview {
    PostsProfileHeaderView(isPresentPost: .constant(true), isEditPost: .constant(true), isPostContent: .constant(""), post: .init())
}
