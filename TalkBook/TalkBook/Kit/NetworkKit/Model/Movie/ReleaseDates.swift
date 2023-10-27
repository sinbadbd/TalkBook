//
//  ReleaseDates.swift
//  MovieStream
//
//  Created by Imran on 20/8/23.
//


struct ReleaseDates: Model {
    var id: Int?
    var results: [ReleaseResults]?
    
}

struct ReleaseResults: Model {
    var iso_3166_1: String?
    var release_dates: [ReleaseDatesList]?
   
}

struct ReleaseDatesList: Model {
    var certification: String?
    var descriptors: [String]?
    var iso_639_1: String?
    var note: String?
    var release_date: String?
    var type: Int?
    
}

/*
 {
   "id": 976573,
   "results": [
     {
       "iso_3166_1": "UA",
       "release_dates": [
         {
           "certification": "",
           "descriptors": [],
           "iso_639_1": "",
           "note": "",
           "release_date": "2023-06-15T00:00:00.000Z",
           "type": 3
         }
       ]
     }
   ]
 }
 */
