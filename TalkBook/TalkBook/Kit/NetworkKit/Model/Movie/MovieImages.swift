//
//  Images.swift
//  MovieStream
//
//  Created by Imran on 20/8/23.
//

import Foundation
 

// MARK: - MovieImages
struct MovieImages: Model {
    var backdrops: [Backdrop]?
    var id: Int?
    var logos, posters: [Backdrop]?
}

// MARK: - Backdrop
struct Backdrop: Model {
    var aspectRatio: Double?
    var height: Int?
    var iso639_1: String?
    var filePath: String?
    var voteAverage: Double?
    var voteCount, width: Int?

    enum CodingKeys: String, CodingKey {
        case aspectRatio = "aspect_ratio"
        case height
        case iso639_1 = "iso_639_1"
        case filePath = "file_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case width
    }
}



/*{
 "backdrops": [
   {
     "aspect_ratio": 1.778,
     "height": 1080,
     "iso_639_1": null,
     "file_path": "/5zTwAcnI3zCJ0mucPPnoBtkSWEV.jpg",
     "vote_average": 5.456,
     "vote_count": 7,
     "width": 1920
   },
 ]
 
 */
