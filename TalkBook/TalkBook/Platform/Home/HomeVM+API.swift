//
//  HomeVM+API.swift
//  TalkBook
//
//  Created by Imran on 8/11/23.
//

import Foundation
import NetworkKit

extension HomeVM{
    
    func createPost(statusText: String, images: [String]?, completion: @escaping (()->Void)){
        
        let params: Parameters = [
            "postContent": statusText,
            "images":  images ?? [],
            "userId": Provider.userId
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
                    completion()
                })
            .store(in: &cancellables)
    }
    
    func getPosts(){
        
        let url = String(format: ApiURL.Post.getPosts.getURL())
        let token = Provider.access_token
        
        var headers: Headers = [:]
        if !token.isEmpty {
            headers["Authorization"] = "Bearer \(token)"
        }
        
        let endPoint = EndPoint(url: url, headers: headers, method: .get)
        print("endPoint; \(endPoint)")
        //isSuccess = true
        
        NetworkKit.shared.request(endPoint)
            .sink(
                receiveCompletion: { completion in
                    NetworkKit.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
                },
                receiveValue: { (response: PostModel) in
                    self.postsModel = response
                    self.allPosts = self.postsModel?.posts ?? []
                    print("self.get-posts: \(String(describing: self.allPosts))")
                })
            .store(in: &cancellables)
    }
    
    func updatePost(postId: String, statusText: String, images: [String]?, completion: @escaping (()->Void)){
        
        let url = String(format: ApiURL.Post.updatePost.getURL(), postId)
        let token = Provider.access_token
 
        let params: Parameters = [
            "postContent": statusText,
            "images":  images ?? [],
        ]
        print("params-login: \(params)")
        
        var headers: Headers = [:]
        if !token.isEmpty {
            headers["Authorization"] = "Bearer \(token)"
        }
        
        let endPoint = EndPoint(url: url, parameters: params, headers: headers, method: .put)
        print("endPoint; \(endPoint)")
        //isSuccess = true
        //isSuccess = true
        
        NetworkKit.shared.request(endPoint)
            .sink(
                receiveCompletion: { completion in
                    NetworkKit.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
                },
                receiveValue: { (response: PostModel) in
                    self.postsModel = response
                    self.allPosts = self.postsModel?.posts ?? []
                    print("self.get-posts: \(String(describing: self.allPosts))")
                    completion()

                })
            .store(in: &cancellables)
    }
    
    func likePost(postId: String, completion: @escaping (()->Void)){
        
        let url = String(format: ApiURL.Post.likePost.getURL(), postId)
        let token = Provider.access_token
 
        let params: Parameters = [
            "userId": Provider.userId
        ]
        print("params-login: \(params)")
        
        var headers: Headers = [:]
        if !token.isEmpty {
            headers["Authorization"] = "Bearer \(token)"
        }
        
        let endPoint = EndPoint(url: url, parameters: params, headers: headers, method: .put)
        print("endPoint; \(endPoint)")
        //isSuccess = true
        //isSuccess = true
        
        NetworkKit.shared.request(endPoint)
            .sink(
                receiveCompletion: { completion in
                    NetworkKit.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
                },
                receiveValue: { (response: PostModel) in
//                    self.postsModel = response
//                    self.allPosts = self.postsModel?.posts ?? []
//                    print("self.get-posts: \(String(describing: self.allPosts))")
                    completion()

                })
            .store(in: &cancellables)
    }
    
    func unLikePost(postId: String, completion: @escaping (()->Void)){
        
        let url = String(format: ApiURL.Post.unLike.getURL(), postId)
        let token = Provider.access_token

        let params: Parameters = [
           "userId": Provider.userId
        ]
        print("params-login: \(params)")

        var headers: Headers = [:]
        if !token.isEmpty {
           headers["Authorization"] = "Bearer \(token)"
        }

        let endPoint = EndPoint(url: url, parameters: params, headers: headers, method: .put)
        print("endPoint; \(endPoint)")
        
        NetworkKit.shared.request(endPoint)
            .sink(
                receiveCompletion: { completion in
                    NetworkKit.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
                },
                receiveValue: { (response: PostModel) in
                    completion()
                 
                })
            .store(in: &cancellables)
    }
    
    func toggleLikePost(postId: String, completion: @escaping (()->Void)){
        
        let url = String(format: ApiURL.Post.toggleLikePost.getURL(), postId)
        let token = Provider.access_token

        let params: Parameters = [
           "userId": Provider.userId
        ]
        print("params-login: \(params)")

        var headers: Headers = [:]
        if !token.isEmpty {
           headers["Authorization"] = "Bearer \(token)"
        }

        let endPoint = EndPoint(url: url, parameters: params, headers: headers, method: .put)
        print("endPoint; \(endPoint)")
        
        NetworkKit.shared.request(endPoint)
            .sink(
                receiveCompletion: { completion in
                    NetworkKit.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
                },
                receiveValue: { (response: PostModel) in
                    completion()
                 
                })
            .store(in: &cancellables)
    }
    
}
