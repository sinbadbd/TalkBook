//
//  RegistrationView.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI
import KitBase

enum Field: Hashable {
    case usernameField
    case passwordField
    case fullNameField
    case emailField
    case gender
}


struct RegistrationView: View {
    
    
    @ObservedObject private var authVM: AuthVM = .init()
//    @Environment(\.presentationMode) var presentationMode
    
//    @Environment(\.colorScheme) var colorScheme: ColorScheme


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
    
    
    var body: some View {
        
        ZStack{
            Color.white
                .ignoresSafeArea()
            
            Form{
                VStack(spacing: 16){
                    
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
                    .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .solid, backgroundColor: .white, borderColor: .red, foregroundColor: .gray,buttonWidth: UIScreen.main.bounds.width * 0.7 ,borderWidth: 1))
                    Text(authVM.isSuccess == false ? authVM.user?.message ?? "" : "")
                        .foregroundColor(.red)
                }
            }
            
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
                KitBaseFormField(title: "Username", error: authVM.error?.username, isValid: $authVM.isSuccess) {
                    TextField("username", text: $username)
                        .focused($focusedField, equals: .usernameField)
                }
                
                if focusedField == .usernameField && username.isEmpty {
                    Text("Username can't be blank")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
            }
            VStack(alignment: .leading){
                KitBaseFormField(title: "Password", error: authVM.error?.password, isValid: $authVM.isSuccess ) {
                    SecureField("Password", text: $password)
                        .keyboardType(.namePhonePad)
                        .focused($focusedField, equals: .passwordField)
                }
                
                if focusedField == .passwordField && password.isEmpty {
                    Text("Password can't be blank")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
            }
            VStack(alignment: .leading){
                KitBaseFormField(title: "Email", error: authVM.error?.email, isValid: $authVM.isSuccess ) {
                    TextField("Email", text: $email)
                        .focused($focusedField, equals: .emailField)
                }
                if focusedField == .emailField && email.isEmpty {
                    Text("Email can't be blank")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
            }
            VStack(alignment: .leading){
                KitBaseFormField(title: "Full Name", error: authVM.error?.fullname, isValid: $authVM.isSuccess ) {
                    TextField("Full name", text: $fullName)
                        .focused($focusedField, equals: .fullNameField)
                }
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

//extension RegistrationView{
//
//    @ViewBuilder
//    func showPopup() -> some View{
//        ZStack{
//            ModalViewBuilder(isShowPopup: $registraionVM.isSuccess) {
//
//            }
//            .title("Confirm")
//            .summary("Are you want to logout?")
//            .width(80)
//            .height(80)
//            .buttonOneText("No")
//            .buttonTwoText("Yes")
//            .layoutKind(.horizontal)
//            .build()
//        }
//    }
//}
