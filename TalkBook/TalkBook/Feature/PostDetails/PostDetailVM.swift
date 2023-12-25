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
    
    
    @Published var comments: CommentsModel? = nil
    @Published var commentList: [Comment] = []
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
    
    
    func postComment(postId: String?, content: String?, tag: String?, reply: String?, completion: @escaping (()->Void)){
        /*
         {
         "postId": "656f4583a88e52be87d16e75",
         "content": "Hello 2",
         "tag": "s",
         "reply": "656f4583a88e52be87d16e75",
         "postUserId": "654a79eba1b8163a84e17e3d"
         }
         */
        let url = String(format: ApiURL.Comment.createComment.getURL())
        let token = Provider.access_token
        
        let params: Parameters = [
            "postId": postId ?? "",
            "content": content ?? "",
            "tag": tag ?? "",
            "reply": reply ?? "",
            "postUserId": Provider.userId
        ]
        print("params-login: \(params)")
        
        var headers: Headers = [:]
        if !token.isEmpty {
            headers["Authorization"] = "Bearer \(token)"
        }
        
        let endPoint = EndPoint(url: url, parameters: params, headers: headers, method: .post)
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
                    completion()
                })
            .store(in: &cancellables)
    }
    
    
    
    
    func getComments(postId: String){
        
        let url = String(format: ApiURL.Comment.getComments.getURL(), postId)
        //_ = Provider.access_token
        
        let headers = NetworkHeaders.createHeaders()
        let endPoint = EndPoint(url: url, headers: headers, method: .get)
        print("endPoint; \(endPoint)")
        
        NetworkKit.shared.request(endPoint)
            .sink(
                receiveCompletion: { completion in
                    NetworkKit.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
                },
                receiveValue: { (response: CommentsModel) in
                    self.isSuccess = response.success
                    print("self.isSuccess: \(self.isSuccess)")
                    self.comments = response// ?? []
                    self.commentList = self.comments?.comments ?? []
                    print("self.get-commentList: \(String(describing: self.commentList))")
                })
            .store(in: &cancellables)
    }
    
    func likeComment(){
        
    }
    
    func unLikeComment(){
        
    }
    
    func deleteComment(for commentId: String){
        let url = String(format: ApiURL.Comment.deleteComment.getURL(), commentId)
        //_ = Provider.access_token
        
        let headers = NetworkHeaders.createHeaders()
        let endPoint = EndPoint(url: url, headers: headers, method: .delete)
        print("endPoint; \(endPoint)")
        
        NetworkKit.shared.request(endPoint)
            .sink(
                receiveCompletion: { completion in
                    NetworkKit.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
                },
                receiveValue: { (response: SuccessModelData) in
                    self.isSuccess = response.success
                    print("self.isSuccess: \(self.isSuccess)")
                   // self.comments = response// ?? []
//                    self.commentList = self.comments?.comments ?? []
//                    print("self.get-commentList: \(String(describing: self.commentList))")
                })
            .store(in: &cancellables)
    }
    
}
