//
//  CloudinaryUtility.swift
//  TalkBook
//
//  Created by Imran on 31/10/23.
//

import Foundation
import Cloudinary
 
struct CloudinaryManager {
    static func uploadImage(data: Data, completion: @escaping (CLDUploadResult?, Error?) -> Void) {
        let cloudinary = CloudinaryConfig.createCloudinary()
        let uploader = cloudinary.createUploader()
        uploader.upload(data: data, uploadPreset: CloudinaryConfig.uploadPreset, completionHandler: completion)
    }

        static func deleteImage(publicId: String, completion: @escaping (Bool, Error?) -> Void) {
            let cloudinary = CloudinaryConfig.createCloudinary()
            let uploader = cloudinary.createUploader()
           // uploader.destroy(publicId, completionHandler: completion)
        }
}

//struct CloudinaryUtility {
//    static func uploadImage(data: Data, uploadPreset: String, completion: @escaping (CLDUploadResult?, Error?) -> Void) {
//        let cloudinary = CloudinaryConfig.createCloudinary()
//        let uploader = cloudinary.createUploader()
//        uploader.upload(data: data, uploadPreset: uploadPreset, completionHandler: completion)
//    }
//
//    static func deleteImage(publicId: String, completion: @escaping (Bool, Error?) -> Void) {
//        let cloudinary = CloudinaryConfig.createCloudinary()
//        let uploader = cloudinary.createUploader()
//       // uploader.destroy(publicId, completionHandler: completion)
//    }
//}
