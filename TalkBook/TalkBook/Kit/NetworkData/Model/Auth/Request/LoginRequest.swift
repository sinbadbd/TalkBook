//
//  LoginRequest.swift
//  MovieStream
//
//  Created by Imran on 10/8/23.
//

import Foundation

struct LoginRequest : Model {
    let username : String
    let password : String
    let request_token : String
}

// firstly get request - 1
// then, username & password with request_token verify user
// done, set request_token and get the session_id
