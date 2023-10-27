//
//  Movie.swift
//  MovieStream
//
//  Created by Imran on 5/8/23.
//

import Foundation
 

public struct Movie: Model {
    var dates: Dates?
    var page: Int?
    var total_pages: Int?
    var total_results: Int?
    var results: [Results]?
    
    // Add a function to determine if more pages are available
   func hasMorePages() -> Bool {
       guard let currentPage = page, let totalPages = total_pages else {
           return false
       }
       return currentPage < totalPages
   }
}
extension Movie{
   
}

struct Dates: Model{
    
    var maximum: String?
    var minimum: String?
    
}
// MARK: - Results
struct Results: Model {
    var adult: Bool?
    var backdropPath: String?
    var belongsToCollection: BelongsToCollection?
    var budget: Int?
    var genres: [Genre]?
    var homepage: String?
    var id: Int?
    var imdbID, originalLanguage, originalTitle, overview: String?
    var popularity: Double?
    var posterPath: String?
    var productionCompanies: [ProductionCompany]?
    var productionCountries: [ProductionCountry]?
    var releaseDate: String?
    var revenue, runtime: Int?
    var spokenLanguages: [SpokenLanguage]?
    var status, tagline, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
    var character: String?
    var credit_id: String?
    var order: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue, runtime
        case spokenLanguages = "spoken_languages"
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case character, credit_id
        case order
    }
}

// MARK: - BelongsToCollection
struct BelongsToCollection: Model {
    var id: Int?
    var name, posterPath, backdropPath: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

// MARK: - Genre
struct Genre: Model {
    var id: Int?
    var name: String?
}

// MARK: - ProductionCompany
struct ProductionCompany: Model {
    var id: Int?
    var logoPath, name, originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    var iso3166_1, name: String?

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    var englishName, iso639_1, name: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}
//
//struct Results: Model {
//    var id: Int?
//    var original_title: String?
//    var overview: String?
//    var popularity: String?
//    var backdrop_path: String?
//    var adult: Bool?
//    var original_language: String?
//    var release_date: String?
//    var title: String?
//    var poster_path: String?
//    var video: String?
//    var vote_average: Double?
//    var vote_count: Int?
//    var homepage: String?
//    var budget: Int?
//    var imdb_id: String?
//    var runtime: Int?
//    var revenue: Int?
//    var status: String?
//    var tagline: String?
//    var genres: [Genres]?
//    var productionCompanies: [ProductionCompanies]?
//    var productionCountries: [ProductionCountries]?
//    var spokenLanguages: [SpokenLanguages]?
//"character": "Forrest Gump",
// "credit_id": "52fe420ec3a36847f800074f",
// "order": 0
//}
//
//
//struct Genres: Model{
//    var id: Int?
//    var name: String?
//
//}
//
//struct ProductionCompanies: Model{
//    var id: Int?
//    var name: String?
//    var logo_path: String?
//    var origin_country: String?
//
//}
//struct ProductionCountries: Model{
//    var iso: String?
//    var name: String?
//}
//struct SpokenLanguages: Model{
//    var iso: String?
//    var name: String?
//    var english_name: String?
//}


/*
 {
     "dates": {
         "maximum": "2023-08-10",
         "minimum": "2023-06-23"
     },
     "page": 1,
     "results": [
         {
             "adult": false,
             "backdrop_path": "/nHf61UzkfFno5X1ofIhugCPus2R.jpg",
             "genre_ids": [
                 35,
                 12,
                 14
             ],
             "id": 346698,
             "original_language": "en",
             "original_title": "Barbie",
             "overview": "Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.",
             "popularity": 3075.774,
             "poster_path": "/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg",
             "release_date": "2023-07-19",
             "title": "Barbie",
             "video": false,
             "vote_average": 7.5,
             "vote_count": 2275
         },
     ],
     "total_pages": 73,
     "total_results": 1458
 }
 */

/*
 {
   "adult": false,
   "backdrop_path": "/3DW3xHM7FgdE8XzpODbEfvlR9qR.jpg",
   "belongs_to_collection": null,
   "budget": 0,
   "genres": [
     {
       "id": 18,
       "name": "Drama"
     },
     {
       "id": 10749,
       "name": "Romance"
     }
   ],
   "homepage": "",
   "id": 899,
   "imdb_id": "tt0009968",
   "original_language": "en",
   "original_title": "Broken Blossoms",
   "overview": "The love story of an abused English girl and a Chinese Buddhist in a time when London was a brutal and harsh place to live.",
   "popularity": 7.897,
   "poster_path": "/l9rHRp7Yb2PVy5Qd5wUR9coXZoy.jpg",
   "production_companies": [
     {
       "id": 4759,
       "logo_path": null,
       "name": "D.W. Griffith Productions",
       "origin_country": "US"
     },
     {
       "id": 60,
       "logo_path": "/1SEj4nyG3JPBSKBbFhtdcHRaIF9.png",
       "name": "United Artists",
       "origin_country": "US"
     }
   ],
   "production_countries": [
     {
       "iso_3166_1": "US",
       "name": "United States of America"
     }
   ],
   "release_date": "1919-05-13",
   "revenue": 2400000,
   "runtime": 89,
   "spoken_languages": [
     {
       "english_name": "No Language",
       "iso_639_1": "xx",
       "name": "No Language"
     }
   ],
   "status": "Released",
   "tagline": "A Tale of Forbidden Love",
   "title": "Broken Blossoms",
   "video": false,
   "vote_average": 6.892,
   "vote_count": 195
 }
 */
