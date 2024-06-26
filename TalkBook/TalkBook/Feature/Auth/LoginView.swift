//
//  LoginView.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI
import SwiftUIKit

struct LoginView: View {
    
    @EnvironmentObject private var route: AppCoordinator
    @ObservedObject private var authVM: AuthVM = .init()
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var borderColor:Color? = Color.gray
    
    @State private var isShwoModal = false
    
    @FocusState private var focusedField: Field?
    @State private var isInputActive: Bool = false
    
    var body: some View {
        
        ZStack(alignment: .center){
            Color.white
                .ignoresSafeArea()
            VStack(spacing: 16){
                
                ScrollView {
                    loginView
                        .padding(.top, 120)
                    
                    Button("Login", action: {
                        
                        isShwoModal =  authVM.isSuccess
                        print("isShwoModal: \(isShwoModal)")
                        //registraionVM.isSuccess = false
                        
                        if email.isEmpty{
                            focusedField = .emailField
                        }else if password.isEmpty {
                            focusedField = .passwordField
                        }else {
                            
                            authVM.loginApiCall(email: email, password: password) { user in
                                if user?.success == true {
                                    
                                    print("Login success")
                                    UserDefaultsManager.shared.isUserLoggedIn = true
                                    UserDefaults.standard.set(Provider.access_token, forKey: "token")
                                    UserDefaults.standard.set(Provider.userId, forKey: "userId")
                                    
                                    route.goPlatfromAsRoot()
                                }
                            }
                        }
                        
                    })
                    .buttonStyle(
                        KitBaseButtonStyleBuilder()
                            .setBackgroundColor(.red)
                            .setForegroundColor(.white)
                            .setButtonWidth(UIScreen.main.bounds.width * 0.85)
                            .build()
                    )
                    
                    Text("-------------OR-------------")
                        .font(.caption)
                        .foregroundColor(.white)
                    
                    Button("Signup", action: {
                        route.goToRegistrationPage()
                        print("Signup")
                    })
                    .buttonStyle(
                        KitBaseButtonStyleBuilder()
                            .setBackgroundColor(.clear)
                            .setForegroundColor(.red)
                            .setBorderColor(.gray)
                            .setBorderWidth(1)
                            .setShowShadow(true)
                            .setButtonWidth(UIScreen.main.bounds.width * 0.85)
                            .build()
                    )
                    
                    Text(authVM.isSuccess == false ? authVM.user?.message ?? "" : "")
                        .foregroundColor(.red)
                }
                .padding(.horizontal, 16)
                .frame(alignment: .center)
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
            
            
            if authVM.isSuccess{
                LoadingView(progressColor: .red)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        
    }
    
    private var loginView: some View{
        VStack(alignment: .leading, spacing: 8){
            
            VStack(alignment: .leading){
                KBTextFieldBuilder(content: {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .focused($focusedField, equals: .emailField)
                    // .focused($isInputActive)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    isInputActive = false
                                }
                            }
                        }
                }, isValid: $authVM.isSuccess)
                .errorFont(.body)
                .titleSpacing(12)
                .textColor(.blue)
                .backgroundColor(.white)
                .textFieldHeight(44)
                .borderWidth(0.5)
                .setErrorMessage(authVM.error?.email) /// `API Error`
                .build()
                
                
                if focusedField == .emailField && email.isEmpty {
                    Text("Email can't be blank")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
            }
            VStack(alignment: .leading){
                
                KBTextFieldBuilder(content: {
                    SecureField("Password", text: $password)
                        .keyboardType(.default)
                        .focused($focusedField, equals: .passwordField)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                //                                Spacer()
                                //                                Button("Done") {
                                //                                    isInputActive = false
                                //                                }
                            }
                        }
                }, isValid: $authVM.isSuccess)
                .errorFont(.body)
                .titleSpacing(12)
                .textColor(.blue)
                .backgroundColor(.white)
                .textFieldHeight(44)
                .borderWidth(0.5)
                .setErrorMessage(authVM.error?.password) /// `API Error`
                .build()
                
                
                
                if focusedField == .passwordField && password.isEmpty {
                    Text("Password can't be blank")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
