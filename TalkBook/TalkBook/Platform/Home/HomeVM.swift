//
//  HomeVM.swift
//  TalkBook
//
//  Created by Imran on 27/10/23.
//

import SwiftUI
import Combine
import NetworkKit
import Photos

class HomeVM: ObservableObject{
    
    var cancellables = Set<AnyCancellable>()
    @Published var postsModel: PostModel? = nil
    @Published var posts: Posts? = nil
    @Published var timeLinePosts: [Posts] = []
    @Published var authModel: User?
    init(){
       // getPost(id: "653aa416df3317d5d487860d")
       // getTimeLinePost(id: "65340015c61ec1c2d8a06d92")
    }
}

extension HomeVM{

    
    func createPost(statusText: String, images: [String]?){

        let params: Parameters = [
            "content": statusText,
            "images":  images ?? []
        ]
        print("params-login: \(params)")
        let url = String(format: ApiURL.Post.createPost.getURL())
        let token = Provider.access_token

        var headers: Headers = [:]
        if !token.isEmpty {
            headers["Authorization"] = "Bearer \(token)"
        }
            
        let endPoint = EndPoint(url: url, parameters: params, headers: headers, method: .post)
        print("endPoint; \(endPoint)")
        //isSuccess = true
         
        NetworkKit.shared.request(endPoint)
            .sink(
                receiveCompletion: { completion in
                    NetworkKit.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
                },
                receiveValue: { (response: PostModel) in
                    self.postsModel = response
                    self.posts = self.postsModel?.newPost
                    print("self.posts: \(String(describing: self.posts))")
                })
            .store(in: &cancellables)
    }
}
