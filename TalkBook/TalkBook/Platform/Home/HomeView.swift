//
//  HomeView.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI
import Cloudinary

struct HomeView: View {
    
    @ObservedObject private var homeVM: HomeVM = .init()
    
    @State private var image: UIImage? = nil
    @State private var imageURL: String? = nil
    
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            } else {
                Text("No image selected")
            }
            
            Button("Select Image") {
                
                // Implement an image picker to select an image from the photo library.
                // For simplicity, I'll just use a placeholder image here.
                self.image = UIImage(named: "dsfs copy")
            }
            
            if imageURL != nil {
                Text("Image URL: \(imageURL!)")
            }
            
            Button("Upload Image") {
                if let imageData = image?.pngData() {
                    uploadImage(imageData: imageData)
                }
            }
        }
        
    }
    
    func uploadImage(imageData: Data) {
         
        CloudinaryUtility.uploadImage(data: imageData) {  result, error in
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
            } else if let result = result {
                print("result-:\(result)")
                print("Public ID: \(result.publicId ?? "N/A")")
                print("URL: \(result.url ?? "N/A")")
                self.imageURL = result.url
            }
        }
        
    }
}
#Preview {
    HomeView()
}

/*
 
 const cloudinary = require('cloudinary');
 
 cloudinary.v2.config({
 cloud_name: 'devsloop',
 api_key: '476142822697917',
 api_secret: 'ijoossGqF3TRT9SHdBxMxhHuTpk',
 secure: true,
 });
 */
