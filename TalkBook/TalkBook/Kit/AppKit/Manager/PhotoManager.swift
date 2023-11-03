//
//  PhotoManager.swift
//  TalkBook
//
//  Created by Imran on 1/11/23.
//

import UIKit
import Photos

@MainActor
class PhotoManager {
    
    public static var shared = PhotoManager()
    
    private var permissionDenied = false
    private var selectedPhotos: [PHAsset] = []
    private var isUploading: Bool = false
    
    func requestPhotoLibraryPermission(completion: @escaping (Bool) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .authorized:
                completion(true) // Permission granted
            default:
                completion(false) // Permission denied or restricted
            }
        }
    }
    
    func fetchPhotos() -> [PHAsset] {
        var photos: [PHAsset] = []
        
        let fetchOptions = PHFetchOptions()
        let result = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        
        for index in 0..<result.count {
            photos.append(result.object(at: index))
        }
        
        return photos
    }
    
    
    func loadPhoto(asset: PHAsset) -> UIImage? {
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
    
    func convertPHAssetToData(asset: PHAsset, completion: @escaping (Data?) -> Void?) {
        let imageManager = PHImageManager.default()
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = false
        requestOptions.deliveryMode = .opportunistic
        
        // Request the image data for the PHAsset
        imageManager.requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: .default, options: requestOptions) { (image, info) in
            if let image = image {
                if let imageData = image.pngData() { // Convert UIImage to Data
                    completion(imageData)
                    print("xxxxx")
                } else {
                    // Handle the case where imageData couldn't be created from the UIImage
                    completion(nil)
                    print("zzzzz")
                }
            } else {
                // Handle the case where
            }
        }
    }
    
    func uploadSelectedPhotos(selectedPhotos: [PHAsset], onDone: @escaping ([String]) -> Void) {
        let dispatchGroup = DispatchGroup()
        var uploadedImageURLs: [String] = []
        
        for (index, asset) in selectedPhotos.enumerated() {
            dispatchGroup.enter()
            
            PhotoManager.shared.convertPHAssetToData(asset: asset) { data in
                if let data = data {
                    let imageData = Data(data)
                    CloudinaryManager.uploadImage(data: imageData) { result, error in
                        // Log asset and upload progress
                        print("Processing asset \(index + 1)")
                        
                        if let error = error {
                            print("Image \(index + 1) upload failed: \(error.localizedDescription)")
                        } else if let result = result {
                            print("Image \(index + 1) uploaded successfully: \(result)")
                            print("Image uploaded successfully. Result: \(result)")
                            print("Public ID: \(result.publicId ?? "N/A")")
                            print("URL: \(result.url ?? "N/A")")
                            if let imageURL = result.url {
                                uploadedImageURLs.append(imageURL)
                            }
                        }
                        dispatchGroup.leave()
                    }
                } else {
                    // Log asset processing failure
                    print("Image \(index + 1) processing failed")
                    dispatchGroup.leave()
                }
            }
        }
        
        dispatchGroup.notify(queue: .global()) {
            // Notify when all images are uploaded
            onDone(uploadedImageURLs)
        }
    }
    
    
    
}
// Helper function to combine multiple image data into one Data object
extension Data {
    init(images: [Data]) {
        self.init()
        for image in images {
            self.append(image)
        }
    }
}
