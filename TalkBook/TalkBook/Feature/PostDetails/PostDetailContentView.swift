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
    @State private var isShowPostFullText = false
    @State private var isShowCommentFullText = false
    @State var getCommentId = ""
    @State private var showActionSheet = false
    
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
            PostDetailHeaderView()
            ScrollView {
                VStack{
                    PostContentAdjustHeightView(postText: post?.postContent, isShowFullText: $isShowPostFullText)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    PostImagesView(image: post?.images ?? [])
                    Divider()
                    PostButtonView(isLikeTapped: $isLikeTapped, isCommentEnable: $isCommentEmable)
                    Divider()
                    
                    VStack {
                        ForEach(detailVM.commentList, id:\.id){ comment in
                            HStack(alignment:.top){
                                
                                KFImage.url(URL(string: comment.user?.avatar ?? ""))
                                    .onSuccess { r in
                                        //print(r)
                                    }
                                    .placeholder { p in
                                        ProgressView(p)
                                    }
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                VStack(alignment: .leading){
                                    Text(comment.user?.username ?? "")
                                        .font(.subheadline)
                                        .bold()
                                    PostContentAdjustHeightView(postText: comment.content, isShowFullText: $isShowCommentFullText)
                                }
                                .onLongPressGesture {
                                    self.showActionSheet = true
                                    self.getCommentId = comment.id ?? ""
                                    
                                }
                                .actionSheet(isPresented: $showActionSheet) {
                                    ActionSheet(
                                        title: Text(""),
                                        buttons: [
                                            .default(Text("Reply")) {
                                                // Handle action 1
                                            },
                                            .default(Text("Edit")) {
                                                // Handle action 1
                                            },
                                            .default(Text("Delete").foregroundColor(.red)) {
                                                // Handle action 2
                                                detailVM.deleteComment(for: getCommentId)
                                            },
                                            .default(Text("Copy")) {
                                                // Handle action 2
                                            },
                                            .cancel()
                                        ]
                                    )
                                }
                                .padding(8)
                                .background {
                                    Color.gray3
                                }
                                .cornerRadius(8)
                            }
                            .frame(maxWidth: .infinity, alignment:.leading)
                        }
                    }
                    .padding(.horizontal, 16)
//                    .frame(maxWidth: .infinity, alignment:.leading)
                }
                .frame(alignment: .leading)
            }

            if isCommentEmable == false {
//                BottomCommentView(isComment: $isCommenting)
                BottomCommentView(isComment: $isCommenting) {
                    detailVM.postComment(postId: detailVM.singlePost?.id, content: isCommenting, tag: "tet", reply: detailVM.singlePost?.id) {
                        detailVM.getComments(postId: id)
                    }
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
        .onAppear {
            detailVM.getSinglePosts(id: id)
            detailVM.getComments(postId: id)
        }
        //        .ignoresSafeArea(.keyboard)
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
        .navigationBarBackButtonHidden()
    }
   
}

#Preview {
    PostDetailContentView(id: "sdf", post: .init())
}
