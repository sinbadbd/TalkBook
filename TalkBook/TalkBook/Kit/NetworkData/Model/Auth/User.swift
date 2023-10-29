//
//  User.swift
//  MovieStream
//
//  Created by Imran on 9/8/23.
//

import Foundation

// MARK: - User
struct User: Model {
    var success: Bool
    var message, accessToken: String?
    var user: UserModel?
    var errors: ErrorsObject?

    enum CodingKeys: String, CodingKey {
        case success, message
        case accessToken = "access_token"
        case user, errors
    }
}

// MARK: - UserClass
struct UserModel: Model {
    var avatar: String?
    var role, gender, mobile, address: String?
    var story, website: String?
    var followers, following, saved: [String]?
    var id, fullname, username, email: String?
    var password, createdAt, updatedAt: String?
    var v: Int?

    enum CodingKeys: String, CodingKey {
        case avatar, role, gender, mobile, address, story, website, followers, following, saved
        case id = "_id"
        case fullname, username, email, password, createdAt, updatedAt
        case v = "__v"
    }
}


// MARK: - Errors
struct ErrorsObject: Codable {
    var username, password, firstname, lastname: String?
}

/*
 new api..
 {
     "success": true,
     "message": "Register succcess!",
     "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1M2UzN2JjNjNlMjE0ODNjOTA0MzU3OSIsImlhdCI6MTY5ODU3NjMxNiwiZXhwIjoxNjk4NjYyNzE2fQ.oXQhGMe2CmbeNV9yrHg6h0a-kvNU4Br2EX410MyeWto",
     "user": {
         "avatar": "https://res.cloudinary.com/devatchannel/image/upload/v1602752402/avatar/avatar_cugq40.png",
         "role": "user",
         "gender": "sfsfs",
         "mobile": "",
         "address": "",
         "story": "",
         "website": "",
         "followers": [],
         "following": [],
         "saved": [],
         "_id": "653e37bc63e21483c9043579",
         "fullname": "d",
         "username": "dsfsfdsf",
         "email": "dxxddxx@d.co",
         "password": "",
         "createdAt": "2023-10-29T10:45:16.778Z",
         "updatedAt": "2023-10-29T10:45:16.778Z",
         "__v": 0
     }
 }
 */

/*
old api //
 {
     "success": true,
     "messsage": "Successfully registered",
     "user": {
         "username": "imranmxxdd",
         "password": "$2a$10$hY8NZ8m8JEH8rpGe.cVVGu.gV62gm9evK8lkplD4YaNJ9N4mii9BS",
         "firstname": "IM",
         "lastname": "test",
         "isAdmin": false,
         "followers": [],
         "following": [],
         "_id": "653aa666aa863a9343250b43",
         "createdAt": "2023-10-26T17:48:22.854Z",
         "updatedAt": "2023-10-26T17:48:22.854Z",
         "__v": 0
     },
     
     "errors": {
         "username": "Username is required",
         "password": "Password is required and must be at least 6 characters",
         "firstname": "First name is required",
         "lastname": "Last name is required"
     }
 }
 */
