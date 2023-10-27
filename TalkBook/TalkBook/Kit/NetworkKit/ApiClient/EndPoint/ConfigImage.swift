//
//  MovieImageURL.swift
//  MovieStream
//
//  Created by Imran on 12/8/23.
//

import Foundation

struct ConfigImage{
    static var baseURL = "https://image.tmdb.org/t/p/"
    static var backdropImgSize = "w1920_and_h800_multi_faces"
    static var profileURL = "w300_and_h300_face"
    static var posterSize = "w600_and_h900_bestv2"
    static var size_W440_H660 = "w440_and_h660_face"
//    static var vedioURL(url) =  "https://youtube.com/watch?v=\(url)"
}

enum ImagePath: String {
    case large
    case profileFace
    case posterSize
    case size_W440_H660
    
    var rawValue: String{
        switch self {
        case .large: return ConfigImage.baseURL + ConfigImage.backdropImgSize
        case .profileFace: return ConfigImage.baseURL + ConfigImage.profileURL
        case .posterSize: return ConfigImage.baseURL + ConfigImage.posterSize
        case .size_W440_H660: return ConfigImage.baseURL + ConfigImage.size_W440_H660
        }
    }
}



//https://www.themoviedb.org/t/p/w600_and_h900_bestv2/rVX05xRKS5JhEYQFObCi4lAnZT4.jpg
//https://www.themoviedb.org/t/p/w440_and_h660_face/Af4bXE63pVsb2FtbW8uYIyPBadD.jpg

