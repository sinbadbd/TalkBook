//
//  CommentModel.swift
//  TalkBook
//
//  Created by Imran on 24/12/23.
//

import Foundation

// MARK: - CommentsModel
struct CommentsModel: Model {
    let success: Bool
    let message: String?
    let comments: [Comment]?
}

// MARK: - Comment
struct Comment: Model {
    let likes: [String]
    let id, content, tag, reply: String?
    let postUserID, postID, createdAt, updatedAt: String?
    let user: UserModel?
    enum CodingKeys: String, CodingKey {
        case likes
        case id = "_id"
        case content, tag, reply
        case postUserID = "postUserId"
        case postID = "postId"
        case createdAt, updatedAt
        case user
    }
}



/*
 {
     "success": true,
     "message": "Comments retrieved successfully.",
     "comments": [
         {
            "likes": [],
             "_id": "658710082c0f4218ddaaf7ed",
             "content": "Imran here",
             "tag": "tet",
             "reply": "65870762c5cb958102ef8d3c",
             "postUserId": "654464b208a9671957c1672d",
             "postId": "65870762c5cb958102ef8d3c",
             "createdAt": "2023-12-23T16:51:20.313Z",
             "updatedAt": "2023-12-23T16:51:20.313Z",
             "__v": 0,
             "user": {
             "avatar": "https://res.cloudinary.com/devatchannel/image/upload/v1602752402/avatar/avatar_cugq40.png",
             "_id": "654464b208a9671957c1672d",
             "fullname": "Imran",
             "username": "imufun"
         }
    ]
 }
 */
