//
//  PostDetailContentView.swift
//  TalkBook
//
//  Created by Imran on 18/11/23.
//

import SwiftUI
import Kingfisher


struct PostDetailContentView: View {
    
    let edges = UIWindow.keyWindow?.safeAreaInsets
    
    @StateObject var detailVM: PostDetailVM = .init()
    @State var isLikeTapped: Bool = false
    @State var isCommentLikeTapped: Bool = false
    @State var isCommenting: String = ""
    @State var isCommentEmable: Bool = false
    @State var isCommentEditEnable: Bool = false
    @State private var isShowPostFullText = false
    @State private var isShowCommentFullText = false
    @State var getCommentId = ""
    @State private var showActionSheet = false
    
    @State private var editComment: String = "Bangladesh....aaaa"
    @State private var editingCommentId: String?
    
    var id: String = String()
    var post: Posts?
    // Define a variable to store the keyboard height
    @State private var keyboardHeight: CGFloat = 0
    
    init(id: String, post:  Posts?){
        self.id = id
        self.post = post
        //        self._isEditComment = State(initialValue: detailVM.comments?.comments)
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
                                    
                                    // editComment = comment.content ?? "" /// ```Add``
                                    
                                    if  isCommentEditEnable  {
                                        VStack{
                                            // TextEditor(text: $editComment)
                                            //      .frame(height: 40)
                                            TextField("Comment", text: $editComment, prompt: Text("Please input your comment"), axis: .vertical)
                                                .padding()
                                                .background(.green.opacity(0.2))
                                                .cornerRadius(5.0)
                                                .padding()
                                                .frame(maxHeight: .infinity)
                                            HStack{
                                                
                                                Button("Cancel") {
                                                    isCommentEditEnable = false
                                                }
                                                Button("Save") {
                                                    detailVM.editComment(for: comment.id ?? "", content: editComment) {
                                                        print("fetch some data")
                                                        detailVM.getComments(postId: id)
                                                    }
                                                    isCommentEditEnable = false
                                                }
                                            }
                                        }
                                    }else {
                                        PostContentAdjustHeightView(postText: comment.content, isShowFullText: $isShowCommentFullText)
                                        
                                    }
                                    Button(action: {
                                        self.isCommentLikeTapped.toggle()
                                        
                                        detailVM.likeComment(for: comment.id ?? "")
                                        // onSuccess?()
                                        print("post button view pressed")
                                    }, label: {
                                        HStack{
                                            Image(systemName: isCommentLikeTapped  ? "hand.thumbsup.fill" : "hand.thumbsup")
                                                .foregroundColor(isCommentLikeTapped ? .red : .gray)
                                            Text("Like")
                                                .font(.callout)
                                                .foregroundColor(.gray)
                                        }
                                    })
                                    
                                }
                                .onLongPressGesture {
                                    self.showActionSheet = true
                                    self.getCommentId = comment.id ?? ""
                                    self.editingCommentId = comment.id ?? ""
                                    
                                    print("self.getCommentId: \(self.getCommentId)")
                                    print("self.editingCommentId: \(self.editingCommentId)")
                                    
                                }
                                .actionSheet(isPresented: $showActionSheet) {
                                    ActionSheet(
                                        title: Text(""),
                                        buttons: [
                                            .default(Text("Reply")) {
                                                // Handle action 1
                                            },
                                            .default(Text("Edit")) {
                                                
                                                isCommentEditEnable = true //editingCommentId == comment.id
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
                }
                .frame(alignment: .leading)
            }
            if !isCommentEditEnable{ /// `` If comment edit, then hide bottom view``
                if isCommentEmable == false {
                    TextEditorView(isComment: $isCommenting) {
                        detailVM.postComment(postId: detailVM.singlePost?.id, content: isCommenting, tag: "tet", reply: detailVM.singlePost?.id) {
                            detailVM.getComments(postId: id)
                            isCommenting = ""
                        }
                    }
                    .padding(.bottom, 50)
                }
            }
        }
        .onAppear {
            detailVM.getSinglePosts(id: id)
            detailVM.getComments(postId: id)
        }
        //        .ignoresSafeArea(.keyboard)
        .padding(.top, edges?.top)
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
