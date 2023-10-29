//
//  TutorialModel.swift
//  MovieStream
//
//  Created by Imran on 8/8/23.
//

import Foundation

public struct TutorialModel {
    public var title: String?
    public var detail: String?
    public var logo: String?
    public var backgroundImage: String?
    
    public init(title: String?, detail: String?, logo: String?, backgroundImage: String? = nil) {
        self.title = title
        self.detail = detail
        self.logo = logo
        self.backgroundImage = backgroundImage
    }
}
