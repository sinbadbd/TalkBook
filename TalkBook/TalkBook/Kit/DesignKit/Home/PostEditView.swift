//
//  PostEditView.swift
//  TalkBook
//
//  Created by Imran on 9/11/23.
//

import SwiftUI

struct PostEditView: View {
    
    @StateObject private var homeVM: HomeVM = .init()
    
    
    @State private var editedText: String // Create a @State property to store the edited text
    var post: Posts
    
    init(post: Posts) {
        self.post = post
        _editedText = State(initialValue: post.postContent ?? "") // Initialize the @State property
    }
    
    var body: some View {
 
        if Provider.userId == post.user?.id {
            TextEditor(text: $editedText)
                .background(content: {
                    Color.red.opacity(0.5)
                })
                .border(.black)
                .frame(height: 100)
            
            Button {
                homeVM.updatePost(postId: post.id ?? "", statusText: editedText, images: []) {
                    print("updates")
                }
            } label: {
                Text("Update Post")
            }
        }
        
    }
}

#Preview {
    PostEditView(post: .init())
}
