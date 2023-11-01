//
//  PhotoManager.swift
//  TalkBook
//
//  Created by Imran on 1/11/23.
//

import UIKit
import Photos

struct PhotoManager {
    static private var permissionDenied = false
    
    static func requestPhotoLibraryPermission(completion: @escaping (Bool) -> Void) {
           PHPhotoLibrary.requestAuthorization { status in
               switch status {
               case .authorized:
                   completion(true) // Permission granted
               default:
                   completion(false) // Permission denied or restricted
               }
           }
       }
    
    static func fetchPhotos() -> [PHAsset] {
        var photos: [PHAsset] = []

        let fetchOptions = PHFetchOptions()
        let result = PHAsset.fetchAssets(with: .image, options: fetchOptions)

        for index in 0..<result.count {
            photos.append(result.object(at: index))
        }

        return photos
    }

    
   static func loadPhoto(asset: PHAsset) -> UIImage? {
       var image: UIImage?
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = .opportunistic
        
        PHImageManager.default().requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFill, options: requestOptions) { (result, info) in
            if let resultImage = result {
                image = resultImage
            }
        }
        
        return image
    }
}
