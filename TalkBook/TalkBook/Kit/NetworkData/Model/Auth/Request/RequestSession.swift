//
//  RequestSession.swift
//  MovieStream
//
//  Created by Imran on 9/8/23.
//


struct RequestSession: Model {
    var success: Bool
    var session_id: String?
}

extension RequestSession{
    
}

// firstly get request 
// then, username & password with request_token verify user
// done, set request_token and get the session_id

/*
 {
   "success": true,
   "session_id": "79191836ddaa0da3df76a5ffef6f07ad6ab0c641"
 }
 */
