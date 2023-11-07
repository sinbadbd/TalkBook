//
//  PostsProfileHeaderView.swift
//  TalkBook
//
//  Created by Imran on 8/11/23.
//

import SwiftUI
import Kingfisher

struct PostsProfileHeaderView: View {
    var post: Posts?
    init(post: Posts?) {
        self.post = post
    }
    var body: some View {
        HStack{
            KFImage.url(URL(string: post?.user?.avatar ?? ""))
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
            
            
            VStack(alignment: .leading, spacing: 2){
                Text(post?.user?.fullname ?? "")
                    .bold()
                    .foregroundColor(.black)
                Text(post?.user?.createdAt ?? "set converted time")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Button {
                
            } label: {
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

#Preview {
    PostsProfileHeaderView(post: nil)
}
