//
//  HomeView.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI
import Cloudinary
import Photos
import Kingfisher

struct HomeView: View {
    
    @StateObject private var homeVM: HomeVM = .init()
    
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
                    ScrollView{
                        VStack{
                            HeaderView()
                            
                            HeaderCreatePostView(selectedPhotos: selectedPhotos, statusText: $statusText) { data in
                                homeVM.createPost(statusText: statusText, images: data)
                                self.statusText = ""
                            }
                            VStack{
                                ForEach(homeVM.allPosts, id: \.id) { posts in
                                    VStack{
                                        Text(posts.content ?? "no posts")
                                        image(image: posts.images ?? [])
//                                            .frame(height: 100)
                                    }
                                }
                            }
                            
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .onAppear(perform: {
                homeVM.getPosts()
            })
            .refreshable {
                homeVM.getPosts()
            }
        }
    }
    
    @ViewBuilder
    func image(image: [String]) -> some View {
        VStack{
            VStack {
                ForEach(image, id: \.self) { imageURL in
                    KFImage.url(URL(string: imageURL))
//                             .placeholder(placeholderImage)
//                             .setProcessor(processor)
                             .loadDiskFileSynchronously()
                             .cacheMemoryOnly()
                             .fade(duration: 0.25)
//                             .lowDataModeSource(.network(lowResolutionURL))
                             .onProgress { receivedSize, totalSize in  }
                             .onSuccess { result in  }
                             .onFailure { error in }
                }
            }
        }
    }
    
}
#Preview {
    HomeView()
}
