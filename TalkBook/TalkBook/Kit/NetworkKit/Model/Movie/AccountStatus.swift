//
//  AccountStatus.swift
//  MovieStream
//
//  Created by Imran on 20/8/23.
//

 

struct AccountStatus: Model{
    var id: Int?
    var favorite: Bool?
    var rated: Bool? ///
    var watchlist: Bool?
    //var rated: Rated?
}
struct Rated: Model{
    var value: Int?
}

/*
 {
   "id": 550,
   "favorite": false,
   "rated": false,
   "watchlist": false
 }
 */
/*
 "rated" : {
   "value" : 10
 }
 */
/*
 Request: [GET] [null] https://api.themoviedb.org/3/movie/569094/account_states?api_key=de05a59a85ef1e7797de8d4a6d343d0e&session_id=fd6507b5d8b0e89d41c11c0be8b784223b1f68fe

 Headers: nil

 Parameters: nil

 Response: {
   "favorite" : true,
   "status_code" : 200,
   "responseHeader" : {
     "x-cache" : "Miss from cloudfront",
     "x-memc-age" : "0",
     "Cache-Control" : "public, max-age=0",
     "Via" : "1.1 0cd88f29d8c6e29a267867c45efda9a8.cloudfront.net (CloudFront)",
     "Vary" : "Accept-Encoding, Origin",
     "x-memc-expires" : "0",
     "x-memc" : "MISS",
     "x-amz-cf-pop" : "SIN52-C2",
     "Content-Encoding" : "br",
     "Date" : "Sun, 20 Aug 2023 14:40:10 GMT",
     "Etag" : "W\/\"d894bfac668f408d8cb1f7a736b6dff1\"",
     "x-memc-key" : "249dff806c33034a3c78d9c913d42e4a",
     "Content-Type" : "application\/json;charset=utf-8",
     "x-amz-cf-id" : "pMa1PQscOiXXWoYnJZXd7tdyKx8zNKCCRPjWIRygs7Dq4tZCbkKf7w==",
     "Server" : "openresty",
     "Alt-Svc" : "h3=\":443\"; ma=86400"
   },
   "id" : 569094,
   "watchlist" : true,
   "rated" : {
     "value" : 10
   }
 }

 ************************API CALLING END************************⤴
 
 */
