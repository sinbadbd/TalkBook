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
    
    @State private var isUploading = false // Loading indicator state
    
    
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
                        
                        HeaderCreatePostView(selectedPhotos: selectedPhotos, statusText: $statusText) { data in
                                homeVM.createPost(statusText: statusText, images: data)
                            self.statusText = ""
                            //selectedPhotos = []
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
    }

}
#Preview {
    HomeView()
}
