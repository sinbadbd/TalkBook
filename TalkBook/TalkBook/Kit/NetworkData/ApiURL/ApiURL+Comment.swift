//
//  ApiURL+Comment.swift
//  TalkBook
//
//  Created by Imran on 5/12/23.
//

import Foundation
extension ApiURL.Comment {
    func getURL() -> String {
        let baseURL = ApiConfig.httpBase
        var endPart = ""
        switch self {
        case .createComment: endPart = "comment/createComment"
        case .getComments: endPart = "comment/getComments/%@"
        case .commentEdit: endPart = "comment/%@"
        case .likeComment: endPart = "comment/%@/like"
        case .unlikeComment: endPart = "comment/%@/unlike"
        case .deleteComment: endPart = "comment/%@"
        }
        return "\(baseURL)\(endPart)"
    }
}

    //comment/6587a306cee381065877a1c2/like
