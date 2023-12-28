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
    @State private var keyboardHeight: CGFloat = 0
    @FocusState private var keyboardShown: Bool
    
    var onPostComment: (()-> Void)?
    
    var body: some View {
        VStack{
            HStack{
                TextField("Comment here...", text: $isComment, axis: .vertical)
                    .focused($keyboardShown)
//                    .toolbar {
//                        ToolbarItem(placement: .keyboard) {
//                            HStack{
//                                TextField("Comment here...", text: $isComment)
//                                    .focused($keyboardShown)
//                                if isComment.count > 0 {
//                                    Button {
//                                        
//                                    } label: {
//                                        Image(systemName: "paperplane.fill")
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                            .frame(width: 24, height: 24)
//                                    }
//                                }
//                            }
//                        }
//                    }
//                    .autocapitalization(.none)     // Disables auto-capitalization
//                    .disableAutocorrection(true)   // Disables auto-correction
                    .background(content: {
                        Color.gray
                    })
//                    .frame(height: 44)
                if isComment.count > 0 {
                    Button {
                        onPostComment?()
                        print("--")
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(minHeight: 44, maxHeight: .infinity)
        .frame(maxWidth: .infinity)
//        .modifier(KeyboardAdaptive())
//        .onTapGesture {
//            self.endEditing()
//        }
//        .modifier(KeyboardAdjustingModifier(listener: .init(notificationCenter: .default)))
    }
}

#Preview {
    TextEditorView(isComment: .constant("false"))
}

final class KeyboardResponder: ObservableObject {
    @Published var currentHeight: CGFloat = 0
    
    var keyboardWillShowNotification = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
    var keyboardWillHideNotification = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
    
    init() {
        keyboardWillShowNotification.map { notification in
            CGFloat((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0)
        }
        .assign(to: \.currentHeight, on: self)
        .store(in: &cancellableSet)
        
        keyboardWillHideNotification.map { _ in
            CGFloat(0)
        }
        .assign(to: \.currentHeight, on: self)
        .store(in: &cancellableSet)
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
}
struct KeyboardAdaptive: ViewModifier {
    @ObservedObject private var keyboard = KeyboardResponder()
    
    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboard.currentHeight)
            .animation(.easeOut(duration: 0.16))
    }
}

extension View {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

/*
final class KeyboardListener: ObservableObject {
    @Published var endFrame: CGRect = .zero
    
    init(notificationCenter: NotificationCenter = .default) {
        [
            UIResponder.keyboardWillChangeFrameNotification,
            UIResponder.keyboardWillHideNotification
        ]
            .forEach {
                notificationCenter.addObserver(
                    self,
                    selector: #selector(keyboard(notification:)),
                    name: $0, object: nil)
            }
    }
    
    @objc private func keyboard(notification: Notification) {
        withAnimation(Animation(curve: notification.animationCurve, duration: notification.duration)) {
            endFrame = notification.endFrame
        }
    }
}

fileprivate extension Notification {
    var animationCurve: UIView.AnimationCurve {
        guard let rawValue = (userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int) else {
            return UIView.AnimationCurve.linear
        }
        
        return UIView.AnimationCurve(rawValue: rawValue)!
    }
    
    var duration: TimeInterval {
        userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0
    }
    
    var endFrame: CGRect {
        userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
    }
}
fileprivate extension Animation {
    init(curve: UIView.AnimationCurve, duration: TimeInterval) {
        switch curve {
        case .easeInOut:
            self = .easeInOut(duration: duration)
        case .easeIn:
            self = .easeIn(duration: duration)
        case .easeOut:
            self = .easeOut(duration: duration)
        case .linear:
            self = .linear(duration: duration)
        @unknown default:
            self = .easeInOut(duration: duration)
        }
    }
}
struct KeyboardAdjustingModifier: ViewModifier {
    @State var listener: KeyboardListener
    
    func body(content: Content) -> some View {
        GeometryReader { proxy in
            content.padding(.bottom, self.bottomPadding(in: proxy))
        }
    }
    
    private func bottomPadding(in proxy: GeometryProxy) -> CGFloat {
        if listener.endFrame == .zero {
            return 0
        } else {
            let viewBottomY = proxy.frame(in: .global).maxY
            let keyboardTopY = self.listener.endFrame.minY
            return max(0, viewBottomY - keyboardTopY)
        }
    }
}
*/
