//
//  HomeVM.swift
//  TalkBook
//
//  Created by Imran on 27/10/23.
//

import SwiftUI
import Combine

class HomeVM: ObservableObject{
    
    var cancellables = Set<AnyCancellable>()
    @Published var postsModel: PostModel? = nil
    @Published var posts: Posts? = nil
    @Published var timeLinePosts: [Posts] = []
    
    init(){
       // getPost(id: "653aa416df3317d5d487860d")
        getTimeLinePost(id: "65340015c61ec1c2d8a06d92")
    }
}

extension HomeVM{
    
    func getPost( id: String) {
        let url = String(format: ApiURL.Post.allPost.getURL(), id)
        let urlComponents = URLComponents(string: url)
        let endPoint = EndPoint(url: (urlComponents?.string)!, method: .get)
        
        ApiManager.shared.request(endPoint)
            .sink(
                receiveCompletion: { completion in
                    ApiManager.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
                },
                receiveValue: { (response: PostModel) in
                    self.postsModel = response
                    self.posts = self.postsModel?.post
                    print("self.posts: \(String(describing: self.posts))")
                })
            .store(in: &cancellables)
    }
    
    func getTimeLinePost( id: String) {
        let url = String(format: ApiURL.Post.timeLinePost.getURL(), id)
        let urlComponents = URLComponents(string: url)
        let endPoint = EndPoint(url: (urlComponents?.string)!, method: .get)
        
        ApiManager.shared.request(endPoint)
            .sink(
                receiveCompletion: { completion in
                    ApiManager.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
                },
                receiveValue: { (response: PostModel) in
                    self.postsModel = response
                    self.timeLinePosts = self.postsModel?.timeLinePosts ?? []
                    print("self.posts: \(String(describing: response))")
                })
            .store(in: &cancellables)
    }
}
