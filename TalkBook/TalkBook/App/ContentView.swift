//
//  ContentView.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .frame(width: 350, height: 6500)
        .padding()
    }
}

#Preview {
    ContentView()
}
