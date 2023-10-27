//
//  APIError.swift
//  MovieZoo
//
//  Created by Imran on 12/9/23.
//

import Foundation

/// Enum of API Errors
enum APIError: Error {
    /// Encoding issue when trying to send data.
    case encodingError(String?)
    case decodingError(String)
    /// No data recieved from the server.
    case noData
    /// The server response was invalid (unexpected format).
    case invalidResponse
    /// The request was rejected: 400-499
    case badRequest(String?)
    /// Encountered a server error.
    case serverError(String?)
    /// There was an error parsing the data.
    case parseError(String?)
    /// Unknown error.
    case unknown
}

enum SessionError: Error {
    case statusCode(HTTPURLResponse)
}
