//
//  PostDetailContentView.swift
//  TalkBook
//
//  Created by Imran on 18/11/23.
//

import SwiftUI

struct PostDetailContentView: View {
    @StateObject var detailVM: PostDetailVM = .init()
    var id: String = String()
    init(id: String){
        self.id = id
    }
    var body: some View {
        VStack{
            Text(detailVM.singlePost?.postContent ?? "")
        }.onAppear {
            detailVM.getSinglePosts(id: id)
        }
    }
}

#Preview {
    PostDetailContentView(id: "sdf")
}
