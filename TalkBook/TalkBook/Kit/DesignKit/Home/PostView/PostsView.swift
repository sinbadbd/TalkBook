//
//  PostsView.swift
//  TalkBook
//
//  Created by Imran on 5/11/23.
//

import SwiftUI
import Kingfisher

struct PostsView: View {
    
    @State private var isLikeTapped: Bool = false
    @State private var likeCoint = 210 // this count come from api []
    
    @State var isPresentPost: Bool = false
    @State var isEditPost: Bool = false
    @State var postContent: String = "--"
    var onSuccess: (() -> Void)?
    @State private var showFullText = false
    
    var post: Posts?

    init(postContent: String, post: Posts? = nil, onSuccess: (() -> Void)?) {
        self.postContent = postContent
        self.post = post
        self.onSuccess = onSuccess
        
        //_isLikeTapped = State(initialValue: post?.liked ?? false)
        print("postContent: \(postContent)")
    }
    
    var body: some View {
        VStack(alignment: .leading){
            
            PostsProfileHeaderView(isPresentPost: $isPresentPost, isEditPost: $isEditPost, isPostContent: $postContent, post: post ?? .init())
                .padding(.horizontal, 12)
            
            if let postContent = post?.postContent, postContent.count > 250 {
                let displayedContent = showFullText ? postContent : String(postContent.prefix(250) + "...")
                
                Text(displayedContent)
                    .font(.footnote)
                    .foregroundColor(.gray8)
                    .padding(.horizontal, 12)
                
                Button {
                    withAnimation {
                        showFullText.toggle()
                    }
                } label: {
                    Text(showFullText ? "See less" : "See more")
                        .font(.caption2)
                        .bold()
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 12)
                
            } else {
                Text(post?.postContent ?? "not working")
                    .padding(.horizontal, 12)
            }

            
            PostImagesView(image: post?.images ?? [])
            
            PostLikeCommentCounterView(post: post)
                .padding(.horizontal, 12)
                .offset(y: 14)
            
            Divider().padding([.top], 8)
           
//            PostButtonView(isLikeTapped: $isLikeTapped, isCommentEnable: .constant(<#T##value: Bool##Bool#>), post: post) {
//                onSuccess?()
//            }
            PostButtonView(isLikeTapped: $isLikeTapped, isCommentEnable: .constant(true), post: post) {
                onSuccess?()
            }
               
//            Divider().padding([.bottom], 8)
        }
        .padding([.top, .bottom], 12)
        .background {
            Color.white
        }
        .frame(maxWidth: .infinity)
    }
}


//
//#Preview {
//   // PostsView(isLikeTapped: , isPresentPost: <#Bool#>, isEditPost: <#Bool#>, postContent: <#String#>)
//}
