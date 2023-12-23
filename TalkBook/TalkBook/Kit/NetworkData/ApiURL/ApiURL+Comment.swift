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
        case .createComment: endPart = "createComment"
        case .getComments: endPart = "getComments/%@"
        }
        return "\(baseURL)\(endPart)"
    }
}
