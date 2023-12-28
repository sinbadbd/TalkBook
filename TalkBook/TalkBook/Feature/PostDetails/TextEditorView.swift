//
//  BottomCommentView.swift
//  TalkBook
//
//  Created by Imran on 2/12/23.
//

import SwiftUI
import Combine
 

struct TextEditorView: View {
    @Binding var isComment: String
    var onPostComment: (() -> Void)?
    
    @State private var offsetValue: CGFloat = 0
    
    var body: some View {
//        ScrollView {
            VStack {
                HStack {
                    TextField("Comment here...", text: $isComment)
                        .padding(8)
                        .background(Color.gray2)
                    
                    if isComment.count > 0 {
                        Button(action: {
                            onPostComment?()
                        }) {
                            Image(systemName: "paperplane.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .frame(minHeight: 44)
            .background(Color.red)
            .frame(maxWidth: .infinity)
           // .padding(.bottom, offsetValue)
            .animation(.spring())
//            .onReceive(Publishers.keyboardHeight) {
//                self.offsetValue = $0
//            }
//        }
//        .edgesIgnoringSafeArea(.bottom) // Ensure content extends to the bottom of the screen
    }
}

 

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        Publishers.Merge(
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
                .map { $0.keyboardHeight },
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in CGFloat(0) }
        )
        .eraseToAnyPublisher()
    }
}

private extension Notification {
    var keyboardHeight: CGFloat {
        (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}




//struct TextEditorView: View {
// 
//    @Binding var isComment: String
//    @State private var keyboardHeight: CGFloat = 0
//    @FocusState private var keyboardShown: Bool
//    @State private var offsetValue: CGFloat = 0.0
//    var onPostComment: (()-> Void)?
//    
//    @FocusState private var focusedField: Bool
//    @State private var isInputActive: Bool = false
//    
//    var body: some View {
//        VStack{
//            HStack{
//                TextField("Comment here...", text: $isComment, axis: .vertical)
//                    .focused($focusedField)
////                    .toolbar {
////                        ToolbarItem(placement: .keyboard) {
//////                            Spacer()
////                            Button("Done") {
////                                focusedField = false
////                            }
////                        }
////                    }
//                
//                    .padding(8)
//                    .background(content: {
//                        Color.gray2
//                    })
//                 //   .frame(minHeight: 44)
//
// 
//                if isComment.count > 0 {
//                    Button {
//                        onPostComment?()
//                        print("--")
//                    } label: {
//                        Image(systemName: "paperplane.fill")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 24, height: 24)
//                    }
//                }
//            }
//            .padding(.horizontal, 16)
//        }
//        .frame(minHeight: 44)
//        .background(content: {
//            Color.red
//        })
//        .frame(maxWidth: .infinity)
//        
//        .keyboardSensible($offsetValue, focusedField: $focusedField)
//    }
//}

//#Preview {
//    TextEditorView(isComment: .constant("false"))
//}

extension View {
    func keyboardSensible(_ offsetValue: Binding<CGFloat>, focusedField: FocusState<Bool>.Binding) -> some View {
        return GeometryReader { geometry in
            self
                .padding(.bottom, max(0, offsetValue.wrappedValue))
                .animation(.spring())
                .onAppear {
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
                        
                        let keyWindow = UIApplication.shared.windows.filter(\.isKeyWindow).first
                        let bottomInset = keyWindow?.safeAreaInsets.bottom ?? 0
                        
                        let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? CGRect.zero
                        let height = max(0, value.height - bottomInset)
                        
                        let safeAreaHeight = geometry.safeAreaInsets.bottom
                        offsetValue.wrappedValue = height - safeAreaHeight
                    }
                    
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                        offsetValue.wrappedValue = 0
                    }
                }
                .onChange(of: focusedField.wrappedValue) { newValue in
                    if newValue {
                        offsetValue.wrappedValue = 0
                    }
                }
        }
    }
}





//extension View {
//    func keyboardSensible(_ offsetValue: Binding<CGFloat>, focusedField: FocusState<Bool>.Binding) -> some View {
//        return self
//            .padding(.bottom, max(0, offsetValue.wrappedValue))
//            .animation(.spring())
//            .onAppear {
//                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
//                    let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? CGRect.zero
//                    let height = value.height
//                    offsetValue.wrappedValue = max(0, height - (UIApplication.shared.windows.first { $0.isKeyWindow }?.safeAreaInsets.top ?? 0))
//                }
//                
//                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
//                    offsetValue.wrappedValue = 0
//                }
//            }
//            .onChange(of: focusedField.wrappedValue) { newValue in
//                if newValue {
//                    offsetValue.wrappedValue = 0
//                }
//            }
//    }
//}

//extension View {
//    func keyboardSensible(_ offsetValue: Binding<CGFloat>, focusedField: FocusState<Bool>.Binding) -> some View {
//        return self
//            .padding(.bottom, offsetValue.wrappedValue)
//            .animation(.spring())
//            .onAppear {
//                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
//                    let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? CGRect.zero
//                    let height = value.height
//                    offsetValue.wrappedValue = height
//                }
//                
//                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
//                    offsetValue.wrappedValue = 0
//                }
//            }
//            .onChange(of: focusedField.wrappedValue) { newValue in
//                if newValue {
//                    offsetValue.wrappedValue = 0
//                }
//            }
//    }
//}



//extension View {
//    
//    func keyboardSensible(_ offsetValue: Binding<CGFloat>) -> some View {
//        
//        return self
//            .padding(.bottom, offsetValue.wrappedValue)
//            .animation(.spring())
//            .onAppear {
//                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
//                    
//                    let keyWindow = UIApplication.shared.connectedScenes
//                        .filter({$0.activationState == .foregroundActive})
//                        .map({$0 as? UIWindowScene})
//                        .compactMap({$0})
//                        .first?.windows
//                        .filter({$0.isKeyWindow}).first
//                    
//                    let bottom = keyWindow?.safeAreaInsets.bottom ?? 0
//                    
//                    let value = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
//                    let height = value.height
//                    
////                    offsetValue.wrappedValue = height - bottom
//                    offsetValue.wrappedValue = height - bottom + (UIApplication.shared.windows.first { $0.isKeyWindow }?.safeAreaInsets.top ?? 0) ?? 0
//
//                    
//                }
//                
//                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
//                    offsetValue.wrappedValue = 0
//                }
//            }
//    }
//}
