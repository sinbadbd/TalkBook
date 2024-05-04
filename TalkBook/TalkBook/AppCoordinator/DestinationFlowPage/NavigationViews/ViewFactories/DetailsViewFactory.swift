//
//  DetailsViewFactory.swift
//  SwiftUI-Navigation
//
//  Created by Imran on 25/4/24.
//

import SwiftUI

struct DetailsViewFactory {
    static func viewFactory(_ page: DetailsPage) -> some View {
        switch page {
        case .details(let id, let  post):
            return AnyView(PostDetailContentView(id: id, post: post))
        }
    }
}
