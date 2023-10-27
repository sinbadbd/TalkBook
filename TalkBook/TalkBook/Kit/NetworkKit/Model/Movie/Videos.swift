//
//  Videos.swift
//  MovieStream
//
//  Created by Imran on 20/8/23.
//

import Foundation
 
// MARK: - Videos
struct Videos: Model {
    var id: Int?
    var results: [VedioResult]?
}

// MARK: - Result
struct VedioResult: Model {
    var iso639_1, iso3166_1, name, key: String?
    var site: String?
    var size: Int?
    var type: String?
    var official: Bool?
    var publishedAt, id: String?

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name, key, site, size, type, official
        case publishedAt = "published_at"
        case id
    }
}



/*
 {
 "id": 976573,
 "results": [
       {
         "iso_639_1": "en",
         "iso_3166_1": "US",
         "name": "We Love You Lutz",
         "key": "PeWnAFeqMUA",
         "site": "YouTube",
         "size": 1080,
         "type": "Clip",
         "official": true,
         "published_at": "2023-07-10T17:00:13.000Z",
         "id": "64ac3c4fb686b9012f87f9a2"
        },
    ]
 }
 */
