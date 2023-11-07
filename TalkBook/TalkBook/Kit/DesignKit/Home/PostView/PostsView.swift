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
    
    var post: Posts?
    
    init(post: Posts? = nil) {
        self.post = post
    }
    
    var body: some View {
        VStack{
            Text(post?.postContent ?? "not working")
            
            imageView(image: post?.images ?? [])
//                .resizable()
//                .aspectRatio(contentMode: .fill)
            Divider()
                .padding([.top], 15)
            HStack{
                Button(action: {
                    self.isLikeTapped.toggle()
                }, label: {
                    HStack{
                        Image(systemName: isLikeTapped ? "hand.thumbsup.fill" : "hand.thumbsup")
                        Text("Like")
                    }
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "ellipsis.message")
                    Text("Comments")
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "square.and.arrow.up")
                    Text("Share")
                })
            }
                .padding(.horizontal, 16)
            Divider()
                .padding([.bottom], 15)
        }
    }
    
    
    @ViewBuilder
    func imageView(image: [String]) -> some View {
        VStack{
            VStack {
                ForEach(image, id: \.self) { imageURL in
                    KFImage.url(URL(string: imageURL))
//                             .placeholder(placeholderImage)
//                             .setProcessor(processor)
                             .loadDiskFileSynchronously()
                             .cacheMemoryOnly()
                             .fade(duration: 0.25)
//                             .lowDataModeSource(.network(lowResolutionURL))
                             .onProgress { receivedSize, totalSize in  }
                             .onSuccess { result in  }
                             .onFailure { error in }
                }
            }
        }
    }
}

#Preview {
    PostsView()
}
