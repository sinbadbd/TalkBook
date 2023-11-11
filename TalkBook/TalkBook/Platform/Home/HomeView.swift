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
    
    @StateObject private var authVM: AuthVM = .init()
    
    init(){
        print("Home View")
        print("Home---: \(selectedPhotos)")
        print("Home.count: \(selectedPhotos.count)")
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.gray3
                VStack {
                    ScrollView{
                        VStack{
                            VStack{
                                HeaderView()
                                HeaderCreatePostView(selectedPhotos: selectedPhotos, statusText: $statusText) { data in
                                     homeVM.createPost(statusText: statusText, images: data) {
                                        homeVM.getPosts()
                                    }
                                    self.statusText = ""
                                }
                                .offset(y: -20)
                            }
                            .background {
                                Color.white
                            }
                            
                            VStack{
                                ForEach(homeVM.allPosts, id: \.id) { posts in
                                    VStack{
                                        PostsView(postContent: posts.postContent ?? "-", post: posts) {
                                            homeVM.likePost(postId: posts.id ?? "") {
                                                print("success like")
                                                homeVM.getPosts()
                                            }
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .onAppear(perform: {
                DispatchQueue.main.async {
                    homeVM.getPosts()
                }
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
                    // .placeholder(placeholderImage)
                    //  .setProcessor(processor)
                        .loadDiskFileSynchronously()
                        .cacheMemoryOnly()
                        .fade(duration: 0.25)
                    //   .lowDataModeSource(.network(lowResolutionURL))
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
