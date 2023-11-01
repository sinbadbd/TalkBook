//
//  HeaderCreatePostView.swift
//  TalkBook
//
//  Created by Imran on 31/10/23.
//

import SwiftUI
import KitBase
import Photos

@MainActor
struct HeaderCreatePostView: View {
    @State private var textEditorHeight: CGFloat = 106
    @State private var showPostModal = false
    @State private var showPhotoModal = false
//    @State private var statusText = "A "
    @State private var selectedPhotos: [PHAsset] = []
    @Binding var statusText: String
    
    var onPost: (()->Void)?
    
    init(selectedPhotos: [PHAsset], statusText: Binding<String>, onPost: (()->Void)?) {
        self.selectedPhotos = selectedPhotos
        self._statusText = statusText
        self.onPost = onPost
    }
    var body: some View {
        
        HStack{
            Image("dsfs copy")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Button {
                showPostModal = true
            } label: {
                Text("What's on your mind?")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .fullScreenCover(isPresented: $showPostModal) {
                VStack{
                    SheetHeaderTopView(title: "Create Post") {
                        showPostModal = false
                    } savePost: {
                        showPostModal = false
                        onPost?()
                    }
                    ScrollView {
                        Text("selectedPhotos:\(selectedPhotos.count)")
                        TextEditor(text: $statusText)
                            .frame(minHeight: 106)
            //                .border(Color.gray, width: 1)
            //                .cornerRadius(8)
                            .onAppear {
                                UITextView.appearance().backgroundColor = .clear
                            }
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .stroke(Color.gray.opacity(0.5))
            //                        .fill(Color.lightEnd)
                            })
                            .onPreferenceChange(TextViewHeightPreferenceKey.self) { height in
                                DispatchQueue.main.async {
                                    self.updateTextEditorHeight(height)
                                }
                            }
                        // TextEditor(text: $statusText)
                        LazyVGrid(columns: [
                            GridItem(.flexible(minimum: 100, maximum: 200), spacing: 8),
                            GridItem(.flexible(minimum: 100, maximum: 200), spacing: 8),
                            // Add more GridItems for additional columns if needed
                        ], spacing: 8) {
                          
                            ForEach(selectedPhotos, id: \.localIdentifier) { asset in
                         
                               // Text("image: \(asset.localIdentifier)")
                                
                                if let selectedPhoto = PhotoManager.loadPhoto(asset: asset) {
                                    Image(uiImage: selectedPhoto)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .background {
                                            Color.red
                                        }
                                }
                            }
                        }
                        
                    }
                    .onAppear {
                        print("selectedPhotos: \(selectedPhotos)")
                        print("selectedPhotos.count: \(selectedPhotos.count)")
                    }
                }
                .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
            }
            
            Button {
                showPhotoModal = true
            } label: {
                KBButtonCircleView(iconName: "photo.on.rectangle.angled", foregroundColor: .red, backgroundColor: .clear, borderColor: .clear, width: 24, height: 24, fontSize: 24)
            }
            .fullScreenCover(isPresented: $showPhotoModal) {
                VStack{
                    SheetHeaderTopView(title: "Camera roll") {
                        showPhotoModal = false
                    } savePost: {
                        showPhotoModal = false
                        // Add a slight delay before showing the "Create Post" view
                           DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                               showPostModal = true
                           }

                        print("selectedPhotos: \(selectedPhotos)")
                        print("selectedPhotos.count: \(selectedPhotos.count)")
                    }
                    ScrollView {
                        PhotoGridView(selectedAssets: $selectedPhotos)
                        //print($selectedPhotos)
                    }
                }
                .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
            }
        }
    }
    
    private func updateTextEditorHeight(_ height: CGFloat) {
        let minHeight: CGFloat = 106
        let maxHeight: CGFloat = 500
        let clampedHeight = min(max(height, minHeight), maxHeight)
        if clampedHeight != textEditorHeight {
            textEditorHeight = clampedHeight
        }
    }
}

//#Preview {
//    HeaderCreatePostView()
//}

#Preview {
    HomeView()
}
struct TextViewHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}
