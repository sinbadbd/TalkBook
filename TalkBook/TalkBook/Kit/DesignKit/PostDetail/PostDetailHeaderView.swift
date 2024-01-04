//
//  PostDetailHeaderView.swift
//  TalkBook
//
//  Created by Imran on 21/11/23.
//

import SwiftUI

struct PostDetailHeaderView: View {
    
    @Environment(\.presentationMode) var dismiss
    
    var profileImage: String?
    var title: String?
    var date: String?
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    dismiss.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 16, height: 16)
                })
                
                HStack{
                    Image(systemName: "pencil.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .aspectRatio(contentMode: .fit)
                    VStack(alignment: .leading){
                        Text("titel titeltiteltitel")
                            .font(.headline)
                            .fontWeight(.bold)
                    
                        HStack{
                            Text("titel")
                                .font(.subheadline)
                                .foregroundColor(.gray7)
                            Text("|")
                            Text("Date 1212")
                                .font(.callout)
                                .foregroundColor(.gray7)
                        }
                    }
                }
                .padding(.leading, 16)
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .frame(width: 30, height: 5)
                        .aspectRatio(contentMode: .fit)
                }

            }
        }
        .padding(.horizontal,16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    //    PostDetailHeaderView()
    PostDetailContentView(id: "1  ", post: .init())
}
