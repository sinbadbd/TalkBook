//
//  HomeView.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI
import Cloudinary

struct HomeView: View {
    
    @ObservedObject private var homeVM: HomeVM = .init()
    
    @State private var image: UIImage? = nil
    @State private var imageURL: String? = nil
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack {
                    VStack{
                        HeaderView()
                        HeaderCreatePostView()
                    }
                    .padding(.horizontal, 16)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
    }
}
extension HomeView{
//    if let image = image {
//        Image(uiImage: image)
//            .resizable()
//            .scaledToFit()
//            .frame(width: 200, height: 200)
//    } else {
//        Text("No image selected")
//    }
//    
//    Button("Select Image") {
//        
//        // Implement an image picker to select an image from the photo library.
//        // For simplicity, I'll just use a placeholder image here.
//        self.image = UIImage(named: "dsfs copy")
//    }
//    
//    if imageURL != nil {
//        Text("Image URL: \(imageURL!)")
//    }
//    
//    Button("Upload Image") {
//        if let imageData = image?.pngData() {
//            uploadImage(imageData: imageData)
//        }
//    }
}
#Preview {
    HomeView()
}
