//
//  RequestToken.swift
//  MovieStream
//
//  Created by Imran on 9/8/23.
//

import Foundation
 

struct RequestToken: Model {
    var success: Bool
    var expires_at: String?
    var request_token: String?
}

extension RequestToken{
    
}

// firstly get request - 1
// then, username & password with request_token verify user
// done, set request_token and get the session_id


/*
"success": true,
"expires_at": "2023-08-09 12:19:00 UTC",
"request_token": "2736ce75e4b7232b49e0273b69fad1d7fb61f039"
 */


