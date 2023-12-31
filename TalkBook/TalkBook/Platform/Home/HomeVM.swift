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
    @Published var posts: NewPosts? = nil
    @Published var allPosts: [Posts] = []
    @Published var authModel: User?
    
    //Like and comments
    @Published var likeCount: Int = 0
    @Published var error: ErrorsObject?
    
    @Published var isSuccess: Bool = false
    
    init(){
        //getPosts()
    }

}

