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
    let edges = UIWindow.keyWindow?.safeAreaInsets
    @StateObject private var homeVM: HomeVM = .init()
    
    @State private var image: UIImage? = nil
    @State private var imageURL: String? = nil
    @State private var selectedPhotos: [PHAsset] = []
    @State private var statusText: String = "What's on your mind?"
    
    @State private var isUploading = false // Loading indicator state
    
    @StateObject private var authVM: AuthVM = .init()
        
    var body: some View {
 
        VStack {
            HeaderView()
            ScrollView{
                VStack{
                    VStack{
               
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
                    Text("\(Provider.userId)")
                    VStack{
                        ForEach(homeVM.allPosts, id: \.id) { posts in
                            VStack{
                                PostsView(postContent: posts.postContent ?? "-", post: posts) {
                                    homeVM.toggleLikePost(postId: posts.id ?? "") {
                                        homeVM.getPosts()
                                    }
                                }
                            }
                        }
                    }
                    
                }
            }
            
        }
        .padding(.top, edges?.top)
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        //            }
        //            .ignoresSafeArea()
        .onAppear(perform: {
            DispatchQueue.main.async {
                
                homeVM.getPosts()
                //                    if homeVM.isSuccess == true {
                //                        homeVM.getPosts()
                //                    } else {
                //                      //  appState = .login
                ////                        Provider.access_token = ""
                ////                        Provider.userId = ""
                ////                        print("Provider.access_token: \(Provider.access_token)")
                ////                        print("Provider.userId: \(Provider.userId)")
                ////                        UserDefaultsManager.shared.isUserLoggedIn = false
                //                    }
                
            }
        })
        .refreshable {
            homeVM.getPosts()
            //            }
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
