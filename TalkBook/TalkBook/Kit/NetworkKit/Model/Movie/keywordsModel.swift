//
//  keywordsModel.swift
//  MovieStream
//
//  Created by Imran on 20/8/23.
//

 

struct keywordsResult: Model{
    var id: Int?
    var keywords: [keywordsModel]?
}

struct keywordsModel: Model {
    var id: Int?
    var name: String?
}


/*
 {
   "id": 976573,
   "keywords": [
     {
       "id": 657,
       "name": "fire"
     },
     {
       "id": 10159,
       "name": "computer animation"
     },
     {
       "id": 179431,
       "name": "duringcreditsstinger"
     },
     {
       "id": 268053,
       "name": "elements"
     },
     {
       "id": 271672,
       "name": "water"
     },
     {
       "id": 282997,
       "name": "city"
     }
   ]
 }
 */
