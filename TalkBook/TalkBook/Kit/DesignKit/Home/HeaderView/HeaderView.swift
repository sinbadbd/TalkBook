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
                    KBButtonType(imageType: .icon, imageViewType: .circle, iconName: "plus", foregroundColor: .black, backgroundColor: .gray.opacity(0.2), borderColor: .gray.opacity(0.2), width: 40, height: 40, fontSize: 40)
                }
                Button {
                    
                } label: {
                    KBButtonType(imageType: .icon, imageViewType: .rectangle, iconName: "magnifyingglass",  foregroundColor: .black, backgroundColor: .gray.opacity(0.2), borderColor: .gray.opacity(0.2), width: 40, height: 40, fontSize: 40)
                }
                Button {
                    
                } label: {
                    KBButtonType(imageType: .icon, imageViewType: .circle, iconName: "ellipsis.message.fill",  foregroundColor: .black, backgroundColor: .gray.opacity(0.2), borderColor: .gray.opacity(0.2), width: 40, height: 4, fontSize: 40)
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
    HomeView(appState: .constant(.dashboard))
}

#Preview {
    HeaderView()
}

