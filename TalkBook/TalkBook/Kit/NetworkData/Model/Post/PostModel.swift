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
    var newPost: NewPosts? // For create new post
    var posts: [Posts]? // For get all post []
}

// MARK: - NewPost
struct NewPosts: Model {
    var images: [String]?
    var likes, comments: [String]?
    var id, postContent, createdAt, updatedAt: String?
    var v: Int?

    enum CodingKeys: String, CodingKey {
        case images, likes, comments
        case id = "_id"
        case postContent, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - Post
struct Posts: Model {
    var images: [String]?
    var likes: [UserModel]?
    var liked: Bool?
    var comments: [String]?
    var id, postContent, createdAt, updatedAt: String?
    var v: Int?
    var user: UserModel?
    
    enum CodingKeys: String, CodingKey {
        case images, likes, liked, comments
        case id = "_id"
        case postContent, createdAt, updatedAt
        case v = "__v"
        case user
    }
}




/*
 {
     "success": true,
     "message": "Success!",
     "result": 2,
     "posts": [
         {
             "images": [],
             "comments": [],
             "_id": "654f51445452e4b6c9982c7a",
             "postContent": "like test",
             "user": {
                 "avatar": "https://res.cloudinary.com/devatchannel/image/upload/v1602752402/avatar/avatar_cugq40.png",
                 "followers": [],
                 "_id": "654a79eba1b8163a84e17e3d",
                 "fullname": "The mad Gamer",
                 "username": "gamerbd"
             },
             "likes": [
                 {
                     "liked": true,
                     "_id": "654f514a5452e4b6c9982c7d",
                     "user": "654e4c2a8296406e71916991"
                 }
             ],
             "createdAt": "2023-11-11T10:02:44.779Z",
             "updatedAt": "2023-11-11T10:02:50.950Z",
             "__v": 0
         },
         {
             "images": [],
             "comments": [],
             "_id": "654f50c0898225b2031f43bb",
             "postContent": "like test",
             "user": {
                 "avatar": "https://res.cloudinary.com/devatchannel/image/upload/v1602752402/avatar/avatar_cugq40.png",
                 "followers": [],
                 "_id": "654a79eba1b8163a84e17e3d",
                 "fullname": "The mad Gamer",
                 "username": "gamerbd"
             },
             "likes": [
                 {
                     "liked": true,
                     "_id": "654f50cb898225b2031f43be",
                     "user": "654e4c2a8296406e71916991"
                 }
             ],
             "createdAt": "2023-11-11T10:00:32.562Z",
             "updatedAt": "2023-11-11T10:00:43.280Z",
             "__v": 0
         }
     ]
 }
 */

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
