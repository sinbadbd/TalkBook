//
//  HomeView.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var homeVM: HomeVM = .init()
    var body: some View {
        VStack{
            Text(homeVM.posts?.desciption ?? "")
            Text("\(homeVM.posts?.likes?.count ?? 0)")
        }
        
    }
}

#Preview {
    HomeView()
}
