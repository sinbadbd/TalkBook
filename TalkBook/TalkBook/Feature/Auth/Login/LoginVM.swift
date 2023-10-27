//
//  LoginVM.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI
import Combine

class LoginVM: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var firstname: String = ""
    @Published var lastname: String = ""
    
    @Published var isSuccess: Bool = false
    
    @Published var user: User?
    @Published var userModel: UserModel?
    @Published var error: ErrorsObject?
    
    func loginApiCall(username: String, password: String) {
        
        let params: Parameters = [
            "username": username,
            "password":  password
        ]
        print("params-login: \(params)")
        let url = ApiURL.Auth.login.getURL()
        let endPoint = EndPoint(url: url, parameters: params, method: .post)
        print("endPoint; \(endPoint)")
        isSuccess = true
        ApiManager.shared.request(endPoint)
            .sink(
                receiveCompletion: { [self] completion in
                    ApiManager.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
                    isSuccess = false
                },
                receiveValue: { [self] (response: User) in
                    isSuccess = response.success
                    
                    self.user = response
                    self.userModel = self.user?.user
                    self.error = response.errors
                    print("user: \(response)")
                    print("userModel: \(self.userModel)")
                    
                })
            .store(in: &cancellables)
    }
}

