//
//  Account.swift
//  MovieStream
//
//  Created by Imran on 12/8/23.
//

import Foundation
 


// MARK: - Account
struct Account: Model {
    var avatar: Avatar?
    var id: Int?
    var country, location, name: String?
    var includeAdult: Bool?
    var username: String?

    enum CodingKeys: String, CodingKey {
        case avatar, id
        case country = "iso_639_1"
        case location = "iso_3166_1"
        case name
        case includeAdult = "include_adult"
        case username
    }
}
// MARK: - Avatar
struct Avatar: Model {
    var gravatar: Gravatar?
    var tmdb: Tmdb?
}

// MARK: - Gravatar
struct Gravatar: Model {
    var hash: String?
}

// MARK: - Tmdb
struct Tmdb: Model {
    var avatarPath: String?

    enum CodingKeys: String, CodingKey {
        case avatarPath = "avatar_path"
    }
}

/*{
 "avatar": {
   "gravatar": {
     "hash": "c9e9fc152ee756a900db85757c29815d"
   },
   "tmdb": {
     "avatar_path": "/xy44UvpbTgzs9kWmp4C3fEaCl5h.png"
   }
 },
 "id": 548,
 "iso_639_1": "en",
 "iso_3166_1": "CA",
 "name": "Travis Bell",
 "include_adult": false,
 "username": "travisbell"
}*/
