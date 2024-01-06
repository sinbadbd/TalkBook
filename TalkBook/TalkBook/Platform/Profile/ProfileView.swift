//
//  ProfileView.swift
//  TalkBook
//
//  Created by Imran on 31/10/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        UserProfileView(id: Provider.userId, isNavBarShow: true)
    }
}

#Preview {
    ProfileView()
}
