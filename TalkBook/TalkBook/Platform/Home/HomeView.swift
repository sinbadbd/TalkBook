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
        NavigationStack{
            List(homeVM.timeLinePosts, id: \.id) { posts in
                VStack(alignment: .leading){
                    Text(posts.desciption ?? "")
                    Text("Like: \(posts.likes?.count ?? 0)")
                }
            }
        }
        
    }
}

#Preview {
    HomeView()
}
