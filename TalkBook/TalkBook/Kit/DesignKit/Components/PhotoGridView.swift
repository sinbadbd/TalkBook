//
//  PhotoGridView.swift
//  TalkBook
//
//  Created by Imran on 1/11/23.
//

import SwiftUI
import Photos

struct PhotoGridView: View {
    
    @State private var photos: [PHAsset] = []
    @State private var permissionDenied = false
    //    @State private var selectedAssets: [PHAsset] = []
    @Binding var selectedAssets: [PHAsset]
    var selectedCompletionPhotos: (([PHAsset]?)->Void)?
    
    init(selectedAssets: Binding<[PHAsset]>) {
        self._selectedAssets = selectedAssets
    }
    
    var body: some View {
        if permissionDenied {
            Text("Permission to access photos is denied.")
            Button("Open Settings") {
                guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
                if UIApplication.shared.canOpenURL(settingsURL) {
                    UIApplication.shared.open(settingsURL)
                }
            }
        } else {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 100, maximum: 200), spacing: 8), count: 3), spacing: 8) {
                ForEach(photos, id: \.localIdentifier) { asset in
                    
                    let isSelected = selectedAssets.contains(asset)
                    
                    Image(uiImage: loadPhoto(asset: asset))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay(
                            isSelected ?
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue).opacity(0.5)) : nil
                        )
                        .border(Color.gray, width: isSelected ? 2 : 0)
                        .onTapGesture {
                            if isSelected {
                                // Deselect the photo
                                selectedAssets.removeAll { $0 == asset }
                                print("selectedAssets-remove:\(selectedAssets)count:\(selectedAssets.count)")
                            } else {
                                // Select the photo
                                selectedAssets.append(asset)
                                print("selectedAssets-add:\(selectedAssets): count:\(selectedAssets.count)")
                            }
                            selectedCompletionPhotos?(selectedAssets)
                        }
                }
            }
            .onAppear {
                PhotoManager.requestPhotoLibraryPermission { granted in
                    if !granted {
                        permissionDenied = true
                    } else {
                        fetchPhotos()
                    }
                }
            }
        }
    }
    
    
    func fetchPhotos() {
        photos = PhotoManager.fetchPhotos()
    }
    
    func loadPhoto(asset: PHAsset) -> UIImage {
        return PhotoManager.loadPhoto(asset: asset) ?? UIImage()
    }
}
