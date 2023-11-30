//
//  SheetHeaderTopView.swift
//  TalkBook
//
//  Created by Imran on 1/11/23.
//

import SwiftUI
import KitBase

struct SheetHeaderTopView: View {
    
    enum ButtonType{
        case post
        case camera
        case done
    }
    
    let title: String
    let buttonTitle: String
    let onClose: () -> Void
    let savePost: () -> Void
//    let type: but
    var body: some View {
        HStack{
            
            Button {
                onClose()
            } label: {
                //KBButtonCircleView(iconName: "xmark", foregroundColor: .black
//                                   , backgroundColor: .clear, borderColor: .clear, width: 10, height: 10, fontSize: 20)
                KBButtonType(imageType: .icon, imageViewType: .circle, iconName: "xmark", foregroundColor: .black, backgroundColor: .clear, borderColor: .clear, width: 10, height: 10, fontSize: 20)

            }
            
            Spacer()
            
            Text(title)
                .bold()
            
            Spacer()
            
            Button {
                savePost()
            } label: {
                Text(buttonTitle)
            }
            //.buttonStyle(KitBaseButtonStyle(size: .xs, variant: .solid, backgroundColor: .clear, borderColor: .red, foregroundColor: .black, borderWidth: 1))
            .buttonStyle(
                KitBaseButtonStyleBuilder()
                    .setBackgroundColor(.gray)
                    .setForegroundColor(.black)
                    .setButtonWidth(200)
                    .setButtonHeight(30)
                    .setIcon("square.and.arrow.up")
                    .setImage("ic_edit")
                    .setIconColor(.red)
                    .setIconColor(.red)
                    .setIconWidth(20)
                    .setIconHeight(20)
                    .setShowShadow(false) // Default true
                //.setPaddingAll(paddingAll: 0)
                    .setPaddingVertical(paddingVertical: 0)
                    .setPaddingHorizontal(paddingHorizontal: 0)
                    .build()
            )
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        
        .overlay(content: {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("gray5"))
                .offset(y: 30)
        })
        .background {
            Color("gray3")
        }
    }
}

#Preview {
    SheetHeaderTopView(title: "tewst", buttonTitle: "post") {
        
    } savePost: { 
            
    }

}
