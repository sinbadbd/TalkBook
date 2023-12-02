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
    @State var isCommenting: String = ""
    @State var isCommentEmable: Bool = false
  
    
    var id: String = String()
    var post: Posts?
    
    init(id: String, post:  Posts?){
        self.id = id
        self.post = post
    }
    
    var body: some View {
        VStack{
            ScrollView {
                PostDetailHeaderView()
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
            .padding(.top, 40)
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
            if isCommentEmable == false {
                VStack{
                //BottomCommentView(isComment: $isCommenting)
            }
                .background(content: {
                    Color.red
                })
                .frame(height: 44)
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        HStack{
                            //                        TextField("Comment here...", text: $isComment)
                            //                            .focused($keyboardShown)
                            //                        if isComment.count > 0 {
                            Button {
                                
                            } label: {
                                Image(systemName: "paperplane.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                            }
                        }
                        //                    }
                    }
                }
        }
           // BottomCommentView(isComment: $isCommenting)

//                .edgesIgnoringSafeArea(.bottom)
        }
//        .ignoresSafeArea(.keyboard)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PostDetailContentView(id: "sdf", post: .init())
}
