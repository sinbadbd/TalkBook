//
//  APIResponse.swift
//  MovieZoo
//
//  Created by Imran on 12/9/23.
//

import Foundation

struct APIResponse<T> {
    let data: T
    let expectedKeys: [String]
}
