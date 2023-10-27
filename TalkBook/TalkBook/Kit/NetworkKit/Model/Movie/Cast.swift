//
//  Cast.swift
//  MovieStream
//
//  Created by Imran on 19/8/23.
//

import Foundation
 
// MARK: - Cast
struct Cast: Model {
    var id: Int?
    var cast, crew: [CastModel]?
}

// MARK: - CastElement
struct CastModel: Model {
    var adult: Bool?
    var gender, id: Int?
    var knownForDepartment, name, originalName: String?
    var popularity: Double?
    var profilePath: String?
    var castID: Int?
    var character, creditID: String?
    var order: Int?
    var department, job: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
}

/*
 {
   "id": 976573,
   "cast": [
     {
        "adult": false,
        "gender": 1,
        "id": 1087262,
        "known_for_department": "Acting",
        "name": "Leah Lewis",
        "original_name": "Leah Lewis",
        "popularity": 26.025,
        "profile_path": "/liV9OXUeo7T19hhjFlqTELtETnW.jpg",
        "cast_id": 5,
        "character": "Ember Lumen (voice)",
        "credit_id": "631bd27f65e0a200893de33e",
        "order": 0
     }
   ]
 }
 */
