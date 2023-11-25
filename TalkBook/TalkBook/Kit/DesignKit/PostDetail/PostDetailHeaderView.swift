//
//  PostDetailHeaderView.swift
//  TalkBook
//
//  Created by Imran on 21/11/23.
//

import SwiftUI

struct PostDetailHeaderView: View {
        
    @Environment(\.presentationMode) var dismiss
    
    var body: some View {
        HStack{
            Button(action: {
                dismiss.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 24, height: 24)
            })
        }
    }
}

#Preview {
//    PostDetailHeaderView()
    PostDetailContentView(id: "1  ")
}
