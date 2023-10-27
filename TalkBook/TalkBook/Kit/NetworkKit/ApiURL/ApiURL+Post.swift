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
        case .allPost: endPart = "%@"
        case .timeLinePost: endPart = ""
        }
        return "\(baseURL)/\(endPart)"
    }
}
//localhost:8080/api/post/6539248bbc407d3d3a446e2d
