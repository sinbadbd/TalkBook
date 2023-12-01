//
//  PostDetailContentView.swift
//  TalkBook
//
//  Created by Imran on 18/11/23.
//

import SwiftUI
import Kingfisher

struct PostDetailContentView: View {
    
    @StateObject var detailVM: PostDetailVM = .init()
    @State var isLikeTapped: Bool = false
    @State var isCommentEmable: Bool = false
    
    var id: String = String()
    var post: Posts?
    
    init(id: String, post:  Posts?){
        self.id = id
        self.post = post
    }
    
    var body: some View {
        ScrollView {
            PostDetailHeaderView()
            VStack{
                VStack{
                    Text(detailVM.singlePost?.postContent ?? "")
                        .font(.caption)
                        .foregroundColor(.gray8)
                        .padding(.horizontal, 8)
                        .padding(.bottom, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    PostImagesView(image: post?.images ?? [])
                    Divider()
                    PostButtonView(isLikeTapped: $isLikeTapped, isCommentEnable: $isCommentEmable)
                    Divider()
                }
            }.onAppear {
                detailVM.getSinglePosts(id: id)
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    PostDetailContentView(id: "sdf", post: .init())
}
