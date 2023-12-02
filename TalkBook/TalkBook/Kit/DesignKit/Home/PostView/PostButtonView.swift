//
//  PostButtonView.swift
//  TalkBook
//
//  Created by Imran on 8/11/23.
//

import SwiftUI

struct PostButtonView: View {
    
    @Binding var isLikeTapped: Bool
    @Binding var isCommentEnable: Bool
    
    var post: Posts?
    var onSuccess: (() -> Void)?
    
    init(isLikeTapped: Binding<Bool>, isCommentEnable: Binding<Bool>, post: Posts? = nil, onSuccess: ( () -> Void)? = nil) {
        self._isLikeTapped = isLikeTapped
        self._isCommentEnable = isCommentEnable
        self.post = post
        self.onSuccess = onSuccess
    }
    
    var body: some View {
        
        HStack{
            Button(action: {
                self.isLikeTapped.toggle()
                onSuccess?()
                print("post button view pressed")
            }, label: {
                HStack{
                    Image(systemName: isLikeTapped  ? "hand.thumbsup.fill" : "hand.thumbsup")
                        .foregroundColor(isLikeTapped ? .red : .gray)
                    Text("Like")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
            })
            Spacer()
            
            if isCommentEnable == true{
                NavigationLink {
                    PostDetailContentView(id: post?.id ?? "", post: post)
                } label: {
                    Image(systemName: "ellipsis.message")
                        .foregroundColor(.gray)
                    Text("Comments")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
            }else {
                Button {
                    isCommentEnable = false
                } label: {
                    HStack{
                        Image(systemName: "ellipsis.message")
                            .foregroundColor(.gray)
                        Text("Comments")
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                }
                
            }
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(.gray)
                Text("Share")
                    .font(.callout)
                    .foregroundColor(.gray)
            })
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    PostButtonView(isLikeTapped: .constant(true), isCommentEnable: .constant(false))
}
