//
//  PostsProfileHeaderView.swift
//  TalkBook
//
//  Created by Imran on 8/11/23.
//

import SwiftUI
import Kingfisher

struct PostsProfileHeaderView: View {
    
    //@Binding var
    var post: Posts?
    
    init(post: Posts?) {
        self.post = post
    }
    var body: some View {
        HStack(alignment:.center){
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
            
            VStack(alignment: .leading, spacing: 0){
                Text(post?.user?.fullname ?? "")
                    .bold()
                    .foregroundColor(.black)
                Text(post?.user?.createdAt ?? "set converted time")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            HStack(spacing:16){
                Button {
                    
                } label: {
                    VStack{
                        Image(systemName: "ellipsis")
                            .resizable()
                            .bold()
                            .foregroundColor(.gray)
                            .frame(width: 14, height: 2)
                    }.frame(width: 14, height: 14)
                    
                }
                
                if Provider.userId != post?.user?.id {
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
    PostsProfileHeaderView(post: nil)
}
