//
//  UserProfileView.swift
//  TalkBook
//
//  Created by Imran on 3/1/24.
//

import SwiftUI
import Kingfisher

struct UserProfileView: View {
    
    let edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    @ObservedObject var userMVM: UserProfileVM = .init()
    
    var id: String
    
    init(id:String){
        self.id = id
    }
    
    var body: some View {
        
        VStack{
            UserProfileNavView(userModel: userMVM.userModel)
            ScrollView(.vertical) {
                UserProfileCoverPhotoView()
                UserProfileInfoView(userModel: userMVM.userModel)
            }
        }
        .onAppear(perform: {
            userMVM.getUserData(id: id)
        })
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top, edges?.top)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    UserProfileView(id: "")
}

struct UserProfileCoverPhotoView: View{
    
    var body: some View{
        VStack{
            KFImage.url(URL(string: "https://beingcovers.com/media/facebook-cover/Fake-Smile-facebook-covers-3252.jpeg"))
                .resizing(referenceSize: .init(width: UIScreen.main.bounds.width, height: 140), mode: .aspectFill)
                .placeholder({ ProgressView() })
            //.setProcessor(processor)
                .loadDiskFileSynchronously()
                .cacheMemoryOnly()
                .fade(duration: 0.25)
            //.lowDataModeSource(.network(image as! Resource))
                .onProgress { receivedSize, totalSize in  }
                .onSuccess { result in  }
                .onFailure { error in }
            //                        .frame(height: 130)
            //                        .frame(maxWidth: .infinity)
        }
        .overlay(alignment: .bottomLeading) {
            KFImage.url(URL(string: "https://beingcovers.com/media/facebook-cover/Fake-Smile-facebook-covers-3252.jpeg"))
            //                        .resizing(referenceSize: .init(width: 100, height: 100), mode: .aspectFill)
                .resizable()
                .placeholder({ ProgressView() })
            //.setProcessor(processor)
                .loadDiskFileSynchronously()
                .cacheMemoryOnly()
                .fade(duration: 0.25)
            //.lowDataModeSource(.network(image as! Resource))
                .onProgress { receivedSize, totalSize in  }
                .onSuccess { result in  }
                .onFailure { error in }
                .frame(width: 100, height: 100, alignment: .leading)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray7, lineWidth: 4))
                .background {
                    Color.clear
                }
            //                        .frame(alignment: .leading)
            //                        .padding(.leading,)
            
            
                .offset(x: 20, y: 50)
        }
    }
}
struct UserProfileInfoView: View{
    
    var userModel: UserModel?
    
    var body: some View{
        VStack{
            Text(userModel?.fullname ?? "")
            VStack{
                HStack{
                    Text("76.3")
                    Text("Follwers")
                }
                HStack{
                    Text("76.3")
                    Text("Follwing")
                }
            }
        }
    }
}
