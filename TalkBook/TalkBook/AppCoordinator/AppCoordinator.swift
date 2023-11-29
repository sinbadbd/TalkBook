//
//  AppCoordinator.swift
//  TalkBook
//
//  Created by Imran on 28/11/23.
//

import SwiftUI

enum Page: String, Identifiable {
    case apple, banana, carrot
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case lemon
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable {
    case olive
    
    var id: String {
        self.rawValue
    }
}

class AppCoordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .apple:
            //AppleView()
            ContentView(appState: .constant(.dashboard))
        case .banana:
            //BananaView()
            //AppleView()
            ContentView(appState: .constant(.dashboard))
        case .carrot:
          //  print("carrot")
            //AppleView()
            ContentView(appState: .constant(.dashboard))
            //CarrotView()
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .lemon:
            NavigationStack {
//                LemonView()
                VStack{
                    
                }
            }
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .olive:
            NavigationStack {
//                OliveView()
//                VStack{
//                    print("carrot")
//                }
                //AppleView()
                ContentView(appState: .constant(.dashboard))
            }
        }
    }
    
}
