//
//  PostDetailVM.swift
//  TalkBook
//
//  Created by Imran on 18/11/23.
//

import SwiftUI
import NetworkKit
import Combine

class PostDetailVM: ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    @Published var postsModel: PostModel? = nil
    @Published var posts: NewPosts? = nil
    @Published var allPosts: [Posts] = []
    @Published var singlePost: Posts? = nil
    @Published var authModel: User?
    
    //Like and comments
    @Published var likeCount: Int = 0
    @Published var error: ErrorsObject?
    
    @Published var isSuccess: Bool = false
    
    
    
    
    func getSinglePosts(id: String){
        
        let url = String(format: ApiURL.Post.getSinglePost.getURL(), id)
        let token = Provider.access_token
        
        let headers = NetworkHeaders.createHeaders()
        let endPoint = EndPoint(url: url, headers: headers, method: .get)
        print("endPoint; \(endPoint)")
        
        NetworkKit.shared.request(endPoint)
            .sink(
                receiveCompletion: { completion in
                    NetworkKit.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
                },
                receiveValue: { (response: PostModel) in
                    self.isSuccess = response.success
                    print("self.isSuccess: \(self.isSuccess)")
                    self.singlePost = response.post
                    print("self.get-posts: \(String(describing: self.allPosts))")
                })
            .store(in: &cancellables)
    }
    
    
}
