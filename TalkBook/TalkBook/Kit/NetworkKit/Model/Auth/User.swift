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
    var message: String?
    var user: UserModel?
    var errors: ErrorsObject?
}

// MARK: - UserClass
struct UserModel: Model {
    var username, password, firstname, lastname: String?
    var isAdmin: Bool?
    var followers, following: [String]?
    var id, createdAt, updatedAt: String?
    var v: Int?

    enum CodingKeys: String, CodingKey {
        case username, password, firstname, lastname, isAdmin, followers, following
        case id = "_id"
        case createdAt, updatedAt
        case v = "__v"
    }
}


// MARK: - Errors
struct ErrorsObject: Codable {
    var username, password, firstname, lastname: String?
}



/*

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
