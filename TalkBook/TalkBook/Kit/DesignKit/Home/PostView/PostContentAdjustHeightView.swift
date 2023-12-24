//
//  PostContentAdjustHeightView.swift
//  TalkBook
//
//  Created by Imran on 24/12/23.
//

import SwiftUI

struct PostContentAdjustHeightView: View {
    
    var postText: String?
    var textFont: Font?
    @Binding var isShowFullText: Bool
    
    var body: some View {
        
        VStack{
            if let postContent = postText, postContent.count > 250 {
                let displayedContent = isShowFullText ? postContent : String(postContent.prefix(250) + "...")
                
                VStack{
                    Text(displayedContent)
                        .font(textFont)
//                        .font(.system(size: 14))
//                        .foregroundColor(.gray8)
//                        .padding(.horizontal, 12)
                    
                    Button {
                        withAnimation {
                            isShowFullText.toggle()
                        }
                    } label: {
                        Text(isShowFullText ? "See less" : "See more")
                            .font(.caption2)
                            .bold()
                            .foregroundColor(.gray9)
                    }
                }
                .frame(maxWidth: .infinity,alignment: .leading)
//                .padding(.horizontal, 12)
                
            } else {
                Text(postText ?? "not working")
//                    .padding(.horizontal, 12)
            }
        }

    }
}

#Preview {
    PostContentAdjustHeightView(isShowFullText: .constant(true))
}
