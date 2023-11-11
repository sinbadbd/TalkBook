//
//  ApiURL+Post.swift
//  TalkBook
//
//  Created by Imran on 27/10/23.
//

import Foundation

extension ApiURL.Post {
    func getURL() -> String {
        let baseURL = ApiConfig.httpBase + "post"
        var endPart = ""
        switch self {
        case .createPost: endPart = "createPost"
        case .getPosts: endPart = "getPosts"
        case .updatePost: endPart = "%@"
        case .likePost: endPart = "%@/like"
        }
        return "\(baseURL)/\(endPart)"
    }
}
