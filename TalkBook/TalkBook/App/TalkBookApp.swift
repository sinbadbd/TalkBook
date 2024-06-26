//
//  TalkBookApp.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI
import Cloudinary

@main
struct TalkBookApp: App {

    @ObservedObject var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
