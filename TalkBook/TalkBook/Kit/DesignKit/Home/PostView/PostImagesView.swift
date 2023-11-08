//
//  PostImagesView.swift
//  TalkBook
//
//  Created by Imran on 8/11/23.
//

import SwiftUI
import Kingfisher

struct PostImagesView: View {
    var image: [String]
    var body: some View {
        VStack{
            VStack {
                ForEach(image, id: \.self) { imageURL in
                    KFImage.url(URL(string: imageURL))
                        .onSuccess { r in
                            //print(r)
                        }
                        .placeholder { p in
                            ProgressView(p)
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    PostImagesView(image: [])
}
