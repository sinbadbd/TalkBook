//
//  RegistrationView.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI
import SwiftUIKit

enum Field: Hashable {
    case usernameField
    case passwordField
    case fullNameField
    case emailField
    case gender
}


struct RegistrationView: View {
    
    
    @ObservedObject private var authVM: AuthVM = .init()
 
    @EnvironmentObject private var route: AppCoordinator
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var gender: String = ""
    @State private var borderColor:Color? = Color.gray
    
    @State private var isShwoModal = false
    @State private var selected = 1
    @FocusState private var focusedField: Field?
    
    
    enum Gender: String, CaseIterable, Identifiable {
        case Male, Female, Other
        var id: Self { self }
    }
    
    @State private var selectedFlavor: Gender = .Male
    
    let edges = UIWindow.keyWindow?.safeAreaInsets
    
    var body: some View {
        
        ZStack{
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 16){
                CustomBackView(coordinator: _route, title: "Sign Up")
                Form{
                    registrationView
                    
                    Button("Signup", action: {
                        if username.isEmpty {
                            focusedField = .usernameField
                        } else if password.isEmpty {
                            focusedField = .passwordField
                        } else if email.isEmpty {
                            focusedField = .emailField
                        } else if fullName.isEmpty {
                            focusedField = .fullNameField
                        }else {
                            authVM.registrationApiCall(
                                username: username,
                                password: password,
                                fullname:fullName,
                                email: email,
                                gender: selectedFlavor.rawValue) {
                                    // clearFields()
                                    //presentationMode.wrappedValue.dismiss()
                                }
                        }
                    })
                    
                    .buttonStyle(
                        KitBaseButtonStyleBuilder()
                            .setBackgroundColor(.red)
                            .setForegroundColor(.white)
                            .setButtonHeight(40)
                            .setPaddingVertical(paddingVertical: 0)
                            .setPaddingHorizontal(paddingHorizontal: 0)
                            .setButtonWidth(UIScreen.main.bounds.width * 0.85)
                            .build()
                    )
                    
                    Text(authVM.isSuccess == false ? authVM.user?.message ?? "" : "")
                        .foregroundColor(.red)
                }
            }
            .padding(.top, edges?.top)
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
            .background {  Color.clear }
            .scrollContentBackground(.hidden)
            .background {  Color.clear }
            // .padding(.horizontal, 16)
            
            if authVM.isSuccess{
                LoadingView(progressColor: .red)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
    
    private var registrationView: some View{
        VStack(alignment: .leading, spacing: 8){
            VStack(alignment: .leading){
                //                KitBaseFormField(title: "Username", error: authVM.error?.username, isValid: $authVM.isSuccess) {
                //                    TextField("username", text: $username)
                //                        .focused($focusedField, equals: .usernameField)
                //                }
                
                KBTextFieldBuilder(content: {
                    TextField("Username", text: $username)
                        .keyboardType(.numberPad)
                        .focused($focusedField, equals: .usernameField)
                    // .focused($isInputActive)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                //                                Button("Done") {
                                //                                    //  isInputActive = false
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
                .setErrorMessage(authVM.error?.username) /// `API Error`
                .build()
                
                if focusedField == .usernameField && username.isEmpty {
                    Text("Username can't be blank")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
            }
            VStack(alignment: .leading){
                //                KitBaseFormField(title: "Password", error: authVM.error?.password, isValid: $authVM.isSuccess ) {
                //                    SecureField("Password", text: $password)
                //                        .keyboardType(.namePhonePad)
                //                        .focused($focusedField, equals: .passwordField)
                //                }
                KBTextFieldBuilder(content: {
                    SecureField("Password", text: $password)
                        .keyboardType(.default)
                        .focused($focusedField, equals: .passwordField)
                    // .focused($isInputActive)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                //                                Button("Done") {
                                //                                    //  isInputActive = false
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
            VStack(alignment: .leading){
                //                KitBaseFormField(title: "Email", error: authVM.error?.email, isValid: $authVM.isSuccess ) {
                //                    TextField("Email", text: $email)
                //                        .focused($focusedField, equals: .emailField)
                //                }
                KBTextFieldBuilder(content: {
                    TextField("Email", text: $email)
                        .keyboardType(.numberPad)
                        .focused($focusedField, equals: .emailField)
                    // .focused($isInputActive)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                //                                Button("Done") {
                                //                                    //  isInputActive = false
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
                .setErrorMessage(authVM.error?.email) /// `API Error`
                .build()
                
                if focusedField == .emailField && email.isEmpty {
                    Text("Email can't be blank")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
            }
            VStack(alignment: .leading){
                // KitBaseFormField(title: "Full Name", error: authVM.error?.fullname, isValid: $authVM.isSuccess ) {
                //                    TextField("Full name", text: $fullName)
                //                        .focused($focusedField, equals: .fullNameField)
                //                }
                KBTextFieldBuilder(content: {
                    TextField("Full Name", text: $fullName)
                        .keyboardType(.default)
                        .focused($focusedField, equals: .fullNameField)
                    // .focused($isInputActive)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                //                                Button("Done") {
                                //                                    //  isInputActive = false
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
                .setErrorMessage(authVM.error?.fullname) /// `API Error`
                .build()
                if focusedField == .fullNameField && fullName.isEmpty {
                    Text("Full Name can't be blank")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
            }
            
            Picker("Genger", selection: $selectedFlavor) {
                Text("Male").tag(Gender.Male)
                Text("Female").tag(Gender.Female)
                Text("Other").tag(Gender.Other)
            }
            .foregroundColor(.gray)
            .pickerStyle(.menu)
            .frame(height: 40)
        }
    }
    
    private func clearFields() {
        username = ""
        password = ""
        fullName = ""
        email = ""
        focusedField = nil
    }
}

#Preview {
    RegistrationView()
}

