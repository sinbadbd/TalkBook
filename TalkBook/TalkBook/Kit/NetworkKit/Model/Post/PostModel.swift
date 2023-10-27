//
//  PostModel.swift
//  TalkBook
//
//  Created by Imran on 27/10/23.
//

import Foundation

// MARK: - PostModel
struct PostModel: Model {
    var success: Bool?
    var message: String?
    var post: Posts?
}

// MARK: - Post
struct Posts: Model {
    var id, userID, desciption: String?
    var likes: [String]?
    var createdAt, updatedAt: String?
    var v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userID = "userId"
        case desciption, likes, createdAt, updatedAt
        case v = "__v"
    }
}

/*
 {
     "success": true,
     "message": "Post Fetch",
     "post": {
         "_id": "6539248bbc407d3d3a446e2d",
         "userId": "6532aa616c3dc5b313cb2e19",
         "desciption": "test",
         "likes": [],
         "createdAt": "2023-10-25T14:22:03.332Z",
         "updatedAt": "2023-10-25T14:22:03.332Z",
         "__v": 0
     }
 }
 */
