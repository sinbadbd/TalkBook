//
//  AuthVM.swift
//  TalkBook
//
//  Created by Imran on 2/11/23.
//

import Foundation
import SwiftUI
import Combine
import NetworkKit

class AuthVM: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isSuccess: Bool = false
    
    @Published var user: User?
    @Published var userModel: UserModel?
    @Published var error: ErrorsObject?
    
    // MARK: - REGISTER
    func registrationApiCall(username: String, password: String, fullname: String, email: String, gender: String, completion: @escaping ()->Void) {
        
        let params: Parameters = [
            "fullname":  fullname,
            "username": username,
            "email":  email,
            "password":  password,
            "gender":  gender,
        ]
        print("params-login: \(params)")
        let url = ApiURL.Auth.register.getURL()
        let endPoint = EndPoint(url: url, parameters: params, method: .post)
        print("endPoint; \(endPoint)")
        isSuccess = true
        NetworkKit.shared.request(endPoint)
            .sink(receiveCompletion: { [self] completion in
                isSuccess = false
                NetworkKit.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
            },
                  receiveValue: { [self] (response: User) in
                isSuccess = response.success
                
                self.user = response
                self.userModel = self.user?.user
                self.error = response.errors
                print("user: \(response)")
                print("userModel: \(self.userModel)")
                
                completion()
                
            })
            .store(in: &cancellables)
    }
    
    // MARK: - LOGIN
    func loginApiCall(email: String, password: String, completion: @escaping ((User?)-> Void)) {
        
        let params: Parameters = [
            "email": email,
            "password":  password
        ]
        print("params-login: \(params)")
        let url = ApiURL.Auth.login.getURL()
        let endPoint = EndPoint(url: url, parameters: params, method: .post)
        print("endPoint; \(endPoint)")
        isSuccess = true
        NetworkKit.shared.request(endPoint)
            .sink(
                receiveCompletion: { [self] completion in
                    NetworkKit.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
                    isSuccess = false
                },
                receiveValue: { [self] (response: User) in
                    isSuccess = response.success
                    
                    self.user = response
                    self.userModel = self.user?.user
                    self.error = response.errors
                    print("user: \(response)")
                    print("userModel: \(self.userModel)")
                    
                    completion(response)
                    
                })
            .store(in: &cancellables)
    }
    
    func logout(comletion: ((Bool) -> Void)?){
        let url = ApiURL.Auth.logout.getURL()
        let endPoint = EndPoint(url: url, parameters: nil, method: .post)
        print("endPoint; \(endPoint)")
        isSuccess = true
        NetworkKit.shared.request(endPoint)
            .sink(
                receiveCompletion: { [self] completion in
                    NetworkKit.shared.handleCompletion(url: URL(string: endPoint.url)!, completion: completion)
                    isSuccess = false
                },
                receiveValue: { [self] (response: User) in
                    isSuccess = response.success
                    comletion?(response.success)
                    self.user = response
                    self.userModel = self.user?.user
                    self.error = response.errors
                    
                })
            .store(in: &cancellables)
    }
}

