//
//  RegistrationView.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI
import KitBase

struct RegistrationView: View {
    
    @ObservedObject private var registraionVM: RegistrationVM = .init()
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var borderColor:Color? = Color.gray
    
    @State private var isShwoModal = false
    
    init(){
        print(registraionVM.isSuccess)
    }
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack(spacing: 16){
                loginView
                
                Button("Registraion", action: {
                    isShwoModal =  registraionVM.isSuccess
                    print("isShwoModal: \(isShwoModal)")
                    //registraionVM.isSuccess = false
                    registraionVM.loginValidateWithLogin(username: username, password: password, firstname: firstname, lastname: lastname)
                })
                .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .outline, backgroundColor: .clear, borderColor: .gray, foregroundColor: .white, buttonWidth: UIScreen.main.bounds.width * 0.8, borderWidth: 1))
                                
                Text(registraionVM.isSuccess == false ? registraionVM.user?.message ?? "" : "")
                    .foregroundColor(.red)
            }
            .padding(.horizontal, 16)
            
            if registraionVM.isSuccess{
                LoadingView(progressColor: .red)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
//            if registraionVM.isSuccess {
//                showPopup()
//            }
            
        }
    }
    
    private var loginView: some View{
        VStack(alignment: .leading, spacing: 8){
            
            KitBaseFormField(title: "Username", error: registraionVM.error?.username, isValid: $registraionVM.isSuccess) {
                TextField("username", text: $username)
            }
            KitBaseFormField(title: "Password", error: registraionVM.error?.password, isValid: $registraionVM.isSuccess ) {
                SecureField("Password", text: $password)
                    .keyboardType(.namePhonePad)
            }
            KitBaseFormField(title: "First Name", error: registraionVM.error?.firstname, isValid: $registraionVM.isSuccess ) {
                TextField("First name", text: $firstname)
            }
            
            KitBaseFormField(title: "Last name", error: registraionVM.error?.lastname, isValid: $registraionVM.isSuccess) {
                TextField("Last name", text: $lastname)
            }
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
