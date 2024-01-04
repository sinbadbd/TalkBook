//
//  UserPfileVM.swift
//  TalkBook
//
//  Created by Imran on 3/1/24.
//

import Foundation
import Combine
import NetworkKit

class UserPfileVM: ObservableObject{
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var isSuccess: Bool = false
    @Published var user: User?
    @Published var userModel: UserModel?
    
    func getUserData(id: String?){
        
        let url = String(format: ApiURL.User.getUser.getURL(), id ?? "")
        let token = Provider.access_token
        
        var headers: Headers = [:]
        if !token.isEmpty {
            headers["Authorization"] = "Bearer \(token)"
        }
        
        let endPoint = EndPoint(url: url, headers: headers, method: .get)
        print("endPoint; \(endPoint)")
        //isSuccess = true
        
        NetworkKit.shared.request(endPoint)
            .sink(
                receiveCompletion: { completion in
                    NetworkKit.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
                },
                receiveValue: { (response: User) in
                    self.isSuccess = response.success
                    print("self.isSuccess: \(self.isSuccess)")
                    self.user = response
                    self.userModel = self.user?.user
                     print("self.userModel: \(String(describing: self.userModel))")
                })
            .store(in: &cancellables)
    }
    
}
