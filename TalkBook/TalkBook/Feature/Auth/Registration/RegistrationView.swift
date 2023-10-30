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
    
    @ObservedObject private var registraionVM: RegistrationVM = .init()
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var gender: String = ""
    @State private var borderColor:Color? = Color.gray
    
    @State private var isShwoModal = false
    @State private var selected = 1
    @FocusState private var focusedField: Field?
    
    init(){
        print(registraionVM.isSuccess)
    }
    
    enum Flavor: String, CaseIterable, Identifiable {
        case Male, Female, Other
        var id: Self { self }
    }
    
    @State private var selectedFlavor: Flavor = .Male
    
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
                            registraionVM.registrationApiCall(
                                username: username,
                                password: password,
                                fullname:fullName,
                                email: email,
                                gender: selectedFlavor.rawValue)
                        }
                    })
                    .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .outline, backgroundColor: .clear, borderColor: .red, foregroundColor: .gray,borderWidth: 1))
                    
                    Text(registraionVM.isSuccess == false ? registraionVM.user?.message ?? "" : "")
                        .foregroundColor(.red)
                }
            }
            
            .background {  Color.clear }
            .scrollContentBackground(.hidden)
            .background {  Color.clear }
            // .padding(.horizontal, 16)
            
            if registraionVM.isSuccess{
                LoadingView(progressColor: .red)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            //            if registraionVM.isSuccess {
            //                showPopup()
            //            }
            
        }
    }
    
    private var registrationView: some View{
        VStack(alignment: .leading, spacing: 8){
            KitBaseFormField(title: "Username", error: registraionVM.error?.username, isValid: $registraionVM.isSuccess) {
                TextField("username", text: $username)
                    .focused($focusedField, equals: .usernameField)
            }
            KitBaseFormField(title: "Password", error: registraionVM.error?.password, isValid: $registraionVM.isSuccess ) {
                SecureField("Password", text: $password)
                    .keyboardType(.namePhonePad)
                    .focused($focusedField, equals: .passwordField)
            }
            KitBaseFormField(title: "Email", error: registraionVM.error?.email, isValid: $registraionVM.isSuccess ) {
                TextField("Email", text: $email)
                    .focused($focusedField, equals: .emailField)
            }
            KitBaseFormField(title: "Full Name", error: registraionVM.error?.fullname, isValid: $registraionVM.isSuccess ) {
                TextField("Full name", text: $fullName)
                    .focused($focusedField, equals: .fullNameField)
            }
            
            Picker("Genger", selection: $selectedFlavor) {
                Text("Male").tag(Flavor.Male)
                Text("Female").tag(Flavor.Female)
                Text("Other").tag(Flavor.Other)
            }
            .foregroundColor(.gray)
            .pickerStyle(.menu)
            .frame(height: 40)
        }
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
