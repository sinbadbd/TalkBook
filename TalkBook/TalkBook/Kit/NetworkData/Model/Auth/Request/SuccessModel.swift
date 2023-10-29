//
//  SuccessModel.swift
//  MovieZoo
//
//  Created by Imran on 19/9/23.
//

import Foundation
// MARK: - SuccessModel
struct SuccessModel: Model {
    var success: Bool
    var statusMessage: String?
    var statusCode: Int?

    enum CodingKeys: String, CodingKey {
        case success
        case statusMessage = "status_message"
        case statusCode = "status_code"
    }
}
