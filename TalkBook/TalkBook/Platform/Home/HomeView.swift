//
//  HomeView.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI
import Cloudinary
import Photos

struct HomeView: View {
    
    @ObservedObject private var homeVM: HomeVM = .init()
    
    @State private var image: UIImage? = nil
    @State private var imageURL: String? = nil
    @State private var selectedPhotos: [PHAsset] = []
    @State private var statusText: String = "What's on your mind?"
    init(){
        print("Home View")
        print("Home---: \(selectedPhotos)")
        print("Home.count: \(selectedPhotos.count)")
    }
    var body: some View {
        NavigationStack{
            ZStack{
                VStack {
                    VStack{
                        HeaderView()
                        HeaderCreatePostView(selectedPhotos: selectedPhotos, statusText: $statusText) {
                            homeVM.createPost(statusText: statusText, iamges: selectedPhotos.map({$0}))
                            //uploadImage(imageData: imageData)
                            let data = selectedPhotos
                            print("data: \(data)")
//                            CloudinaryManager.uploadImage(data: Data) { result, error in
//                                if let error = error {
//                                    print(error.localizedDescription)
//                                }else {
//                                    let result = result
//                                }
//                            }
                        }
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
