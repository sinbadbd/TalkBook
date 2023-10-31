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
     
    @State private var appState: AppState = .splash

    var body: some Scene {
        WindowGroup {
            ContentView(appState: $appState)
        }
    }
}
