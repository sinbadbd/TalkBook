//
//  HeaderView.swift
//  TalkBook
//
//  Created by Imran on 31/10/23.
//

import SwiftUI
import KitBase

struct HeaderView: View {
    
    var body: some View {
        HStack{
            Text("TalkBook")
                .font(.title)
                .bold()
                .foregroundColor(.red)
            Spacer()
            
            HStack{
                Button {
                    
                } label: {
                    KBButtonCircleView(iconName: "plus", foregroundColor: .black, backgroundColor: .gray.opacity(0.2), borderColor: .gray.opacity(0.2), width: 4, height: 4, fontSize: 20)
                }
                Button {
                    
                } label: {
                    KBButtonCircleView(iconName: "magnifyingglass",  foregroundColor: .black, backgroundColor: .gray.opacity(0.2), borderColor: .gray.opacity(0.2), width: 4, height: 4, fontSize: 20)
                }
                Button {
                    
                } label: {
                    KBButtonCircleView(iconName: "ellipsis.message.fill",  foregroundColor: .black, backgroundColor: .gray.opacity(0.2), borderColor: .gray.opacity(0.2), width: 4, height: 4, fontSize: 20)
                }

            }
        }
        .padding(.horizontal, 16)
        .background {
            Color.white
        }
    }
}

#Preview {
    HomeView()
}

#Preview {
    HeaderView()
}

