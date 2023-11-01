//
//  CloudinaryConfig.swift
//  TalkBook
//
//  Created by Imran on 31/10/23.
//

import Foundation
import Cloudinary

struct CloudinaryConfig {
    static private let cloudName = "devsloop"
    static private let apiKey = "476142822697917"
    static private let apiSecret = "ijoossGqF3TRT9SHdBxMxhHuTpk"
    static let uploadPreset = "ml_default"
    
    static func createCloudinary() -> CLDCloudinary {
        let config = CLDConfiguration(cloudName: cloudName, apiKey: apiKey, apiSecret: apiSecret)
        print("config:\(config)")
        return CLDCloudinary(configuration: config)
    }
}
