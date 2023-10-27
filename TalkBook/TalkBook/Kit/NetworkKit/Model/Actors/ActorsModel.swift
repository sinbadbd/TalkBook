//
//  ActorsModel.swift
//  MovieStream
//
//  Created by Imran on 26/8/23.
//

import Foundation
 
// MARK: - ActorsModel
struct ActorsModel: Model {
    var adult: Bool?
    var alsoKnownAs: [String]?
    var biography, birthday: String?
    var deathday: String?
    var gender: Int?
    var homepage: String?
    var id: Int?
    var imdbID, knownForDepartment, name, placeOfBirth: String?
    var popularity: Double?
    var profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case alsoKnownAs = "also_known_as"
        case biography, birthday, deathday, gender, homepage, id
        case imdbID = "imdb_id"
        case knownForDepartment = "known_for_department"
        case name
        case placeOfBirth = "place_of_birth"
        case popularity
        case profilePath = "profile_path"
    }
    
}

/*
 {
   "adult": false,
   "also_known_as": [
     "Friedrich Rudolf Klein-Rogge"
   ],
   "biography": "From Wikipedia, the free encyclopedia\n\nFriedrich Rudolf Klein-Rogge (24 November 1885 – 29 May 1955) was a German film actor. Klein-Rogge is known for playing sinister figures in films in the 1920s and 1930s as well as being a mainstay in director Fritz Lang's Weimar-era films. He is probably best known in popular culture, particularly to English-speaking audiences, for playing the archetypal mad scientist role of C. A. Rotwang in Lang's Metropolis and as the criminal genius Doctor Mabuse.",
   "birthday": "1885-11-24",
   "deathday": "1955-05-29",
   "gender": 2,
   "homepage": null,
   "id": 77,
   "imdb_id": "nm0459030",
   "known_for_department": "Acting",
   "name": "Rudolf Klein-Rogge",
   "place_of_birth": "Cologne, Germany",
   "popularity": 2.731,
   "profile_path": "/fbP75fGfXFQlkf3Q5oHbJ4wjG1g.jpg"
 }
 */
