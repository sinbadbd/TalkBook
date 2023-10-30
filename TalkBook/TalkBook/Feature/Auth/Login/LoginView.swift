//
//  LoginView.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI
import KitBase

struct LoginView: View {
    
    @ObservedObject private var loginVM: LoginVM = .init()
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var borderColor:Color? = Color.gray
    
    @State private var isShwoModal = false
    @State private var route: Bool = false
    @Binding var appState: AppState
    

    var body: some View {
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack(spacing: 16){
                    loginView
                    
                    Button("Login", action: {
                        isShwoModal =  loginVM.isSuccess
                        print("isShwoModal: \(isShwoModal)")
                        //registraionVM.isSuccess = false
                        loginVM.loginApiCall(username: username, password: password)
                        
                       // UserDefaultsManager.shared.isUserLoggedIn = true
//                        UserDefaults.standard.set(Provider.session_id, forKey: "session_id")
                        //appState = .dashboard
                    })
                    .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .outline, backgroundColor: .clear, borderColor: .gray, foregroundColor: .white, buttonWidth: UIScreen.main.bounds.width * 0.8, borderWidth: 1))
                    
                    
                    Text("-------------OR-------------")
                        .font(.caption)
                        .foregroundColor(.white)
                    
                    Button("Signup", action: {
                        self.route = true
                        print("Signup")
                    })
                    .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .solid, backgroundColor: .red, borderColor: .clear, foregroundColor: .white, buttonWidth: UIScreen.main.bounds.width * 0.8, borderWidth: 1))
                    
                    Text(loginVM.isSuccess == false ? loginVM.user?.message ?? "" : "")
                        .foregroundColor(.red)
                }
                .padding(.horizontal, 16)
                
                if loginVM.isSuccess{
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
            
            KitBaseFormField(title: "Username", error: loginVM.error?.username, isValid: $loginVM.isSuccess) {
                TextField("username", text: $username)
            }
            KitBaseFormField(title: "Password", error: loginVM.error?.password, isValid: $loginVM.isSuccess ) {
                SecureField("Password", text: $password)
                    .keyboardType(.namePhonePad)
            }
        }
    }
}

#Preview {
    LoginView(appState: .constant(.login))
}
