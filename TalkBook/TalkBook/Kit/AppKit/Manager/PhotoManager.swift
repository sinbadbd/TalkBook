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
    
    func convertPHAssetToData(asset: PHAsset) async -> Data? {
        let imageManager = PHImageManager.default()
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = false
        requestOptions.deliveryMode = .opportunistic
        requestOptions.isNetworkAccessAllowed = true
        
        return await withCheckedContinuation { continuation in
            imageManager.requestImageData(for: asset, options: requestOptions) { (data, _, _, info) in
                if let isDegraded = info?[PHImageResultIsDegradedKey] as? Bool, isDegraded {
                    continuation.resume(returning: nil)
                } else {
                    continuation.resume(returning: data)
                }
            }
        }
    }

  
    func uploadSelectedPhotos(selectedPhotos: [PHAsset], onDone: @escaping ([String]) -> Void) async {
        var uploadedImageURLs: [String] = []
        
        for (index, asset) in selectedPhotos.enumerated() {
            print("Processing asset \(index + 1)")
            
            if let data = await PhotoManager.shared.convertPHAssetToData(asset: asset) {
                let imageData = Data(data)
                
                let (result, error) = await CloudinaryManager.uploadImage(data: imageData)
                
                if let error = error {
                    print("Image \(index + 1) upload failed: \(error.localizedDescription)")
                } else if let result = result {
                    print("Image \(index + 1) uploaded successfully: \(result)")
                    print("Public ID: \(result.publicId ?? "N/A")")
                    print("URL: \(result.url ?? "N/A")")
                    if let imageURL = result.url {
                        uploadedImageURLs.append(imageURL)
                    }
                }
            } else {
                print("Image \(index + 1) processing failed")
            }
        }
        
        onDone(uploadedImageURLs)  // Call the completion handler
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
