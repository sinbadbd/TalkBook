//
//  ProfileInfoView.swift
//  TalkBook
//
//  Created by Imran on 5/5/24.
//

import SwiftUI

struct ProfileInfoView: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 0){
            Text("The Advanture of Sinbad")
                .font(.title2)
                .bold()
            HStack(spacing:4){
                Text("400")
                    .font(.title3)
                    .bold()
                
                Text("Friend")
                    .font(.subheadline)
                    .foregroundColor(.gray6)
            }
            Text("for(age=0;age<life.length;knowledge++)")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
//    ProfileInfoView()
    ProfileView()
}
