//
//  LoginView.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI
import KitBase

struct LoginView: View {
    
    @ObservedObject private var authVM: AuthVM = .init()
    
    @State private var email: String = ""
    @State private var password: String = ""

    @State private var borderColor:Color? = Color.gray
    
    @State private var isShwoModal = false
    @State private var route: Bool = false
    @Binding var appState: AppState
    
    @FocusState private var focusedField: Field?

    var body: some View {
        NavigationStack{
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack(spacing: 16){
                    loginView
                    
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
                                    appState = .dashboard
                                }
                            }
                        }
                        
                    })
                    .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .outline, backgroundColor: .clear, borderColor: .gray, foregroundColor: .black, buttonWidth: UIScreen.main.bounds.width * 0.8, borderWidth: 1))
                    
                    
                    Text("-------------OR-------------")
                        .font(.caption)
                        .foregroundColor(.white)
                    
                    Button("Signup", action: {
                        self.route = true
                        print("Signup")
                    })
                    .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .solid, backgroundColor: .red, borderColor: .clear, foregroundColor: .white, buttonWidth: UIScreen.main.bounds.width * 0.8, borderWidth: 1))
                    
                    Text(authVM.isSuccess == false ? authVM.user?.message ?? "" : "")
                        .foregroundColor(.red)
                }
                .padding(.horizontal, 16)
                
                if authVM.isSuccess{
                    LoadingView(progressColor: .red)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .navigationDestination(isPresented: $route, destination: {
                RegistrationView()
            })
        }
    }
    
    private var loginView: some View{
        VStack(alignment: .leading, spacing: 8){
            
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
        }
    }
}

#Preview {
    LoginView(appState: .constant(.login))
}
