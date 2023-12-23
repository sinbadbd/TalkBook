//
//  PostLikeCommentCounterView.swift
//  TalkBook
//
//  Created by Imran on 8/11/23.
//

import SwiftUI

struct PostLikeCommentCounterView: View {
    
    var post: Posts?
    
    var body: some View {
        HStack{
            
            if let totalLike = post?.likes, !totalLike.isEmpty {
                Button {
                    print("like button pressed...")
                } label: {
                    HStack{
                        Image(systemName: "hand.thumbsup.circle.fill")
                            .font(.caption)
                            .foregroundColor(.red)
                        Text("\(totalLike.count)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            if let totalLike = post?.likes, !totalLike.isEmpty {
                Spacer()
            }
            
            HStack{
                
                if let comments = post?.comments, !comments.isEmpty {
                    Text("\(comments.count)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("Comments")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    PostLikeCommentCounterView()
}
