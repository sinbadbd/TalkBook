//
//  PostModel.swift
//  TalkBook
//
//  Created by Imran on 27/10/23.
//

import Foundation

// MARK: - Post
struct PostModel: Model {
    var code: Int?
    var success: Bool
    var message: String?
    var newPost: Posts?
}

// MARK: - NewPost
struct Posts: Codable {
    var images: [String]?
    var likes, comments: [String]?
    var id, content, createdAt, updatedAt: String?
    var v: Int?

    enum CodingKeys: String, CodingKey {
        case images, likes, comments
        case id = "_id"
        case content, createdAt, updatedAt
        case v = "__v"
    }
}
/*
 {
 {
     "code": 201,
     "success": true,
     "message": "Created post successfully",
     "newPost": {
         "images": [
             "a",
             "d"
         ],
         "likes": [],
         "comments": [],
         "_id": "6542749401fadb5116af624d",
         "content": "tst",
         "createdAt": "2023-11-01T15:53:56.542Z",
         "updatedAt": "2023-11-01T15:53:56.542Z",
         "__v": 0
     }
 }
 }
 */
