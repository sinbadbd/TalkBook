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
    // Define a variable to store the keyboard height
    @State private var keyboardHeight: CGFloat = 0
    
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
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                    guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                    keyboardHeight = keyboardFrame.height
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                    keyboardHeight = 0
                }
            }
            if isCommentEmable == false {
//                BottomCommentView(isComment: $isCommenting)
                BottomCommentView(isComment: $isCommenting) {
                    detailVM.postComment(postId: detailVM.singlePost?.id, content: isCommenting, tag: "tet", reply: detailVM.singlePost?.id)
                }
                .padding(.bottom, 50)
                
//                VStack {
//                    BottomCommentView(isComment: $isCommenting)
//                        .background(Color.red)
//                        .frame(height: 44)
//                }
//                .toolbar {
//                    ToolbarItem(placement: .keyboard) {
//                        HStack {
//                            TextField("Comment here...", text: $isCommenting)
//                                //.focused($isCommentEmable)
//                            
//                            Button(action: {
//                                // Handle send button action
//                            }) {
//                                Image(systemName: "paperplane.fill")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 24, height: 24)
//                            }
//                        }
//                    }
//                }
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
