//
//  PostLikeCommentCounterView.swift
//  TalkBook
//
//  Created by Imran on 8/11/23.
//

import SwiftUI

struct PostLikeCommentCounterView: View {
    
    @Binding var likeCount: Int
    
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "hand.thumbsup.circle.fill")
                    .font(.caption)
                    .foregroundColor(.red)
                Button {
                    
                } label: {
                    Text("\(likeCount)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }

            }
            Spacer()
            HStack{
                Text("122")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("Comments")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
//        .padding(.vertical, 12)
    }
}

#Preview {
    PostLikeCommentCounterView(likeCount: .constant(100))
}
