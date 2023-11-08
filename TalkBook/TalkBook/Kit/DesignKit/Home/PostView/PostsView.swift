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
    var post: Posts?
    
    init(post: Posts? = nil) {
        self.post = post
    }
    
    var body: some View {
        VStack(alignment: .leading){
            
            PostsProfileHeaderView(post: post)
                .padding(.horizontal, 12)
            
            Text(post?.postContent ?? "not working")
                .padding(.horizontal, 12)
            
            PostImagesView(image: post?.images ?? [])
            
            PostLikeCommentCounterView(likeCount: $likeCoint)
                .padding(.horizontal, 12)
                .offset(y: 14)
            
            Divider().padding([.top], 8)
            PostButtonView(isLikeTapped: $isLikeTapped)
               
//            Divider().padding([.bottom], 8)
        }
        .padding([.top, .bottom], 12)
        .background {
            Color.white
        }
        .frame(maxWidth: .infinity)
    }
}



#Preview {
    PostsView()
}
