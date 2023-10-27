//
//  FilterModel.swift
//  MovieStream
//
//  Created by Imran on 25/8/23.
//

import Foundation

struct FilterModel{
    var page: Int?
    var include_adult: Bool?
    var include_video: Bool?
    var language: String?
    var startDate: Int?
    var primary_release_year: Int?
    var primary_release_date_gte: Int?
    var primary_release_date_lte: Int?
    var vote_average_gte: Int?
    var vote_average_lte: Int?
    var vote_count_gte: Int?
    var vote_count_lte: Int?
    var region: String?
    var year: String?
}

/*
 //include_adult=false
 //&include_video=false
 //&language=en-US
 //&page=1
 //&primary_release_year=2000
 //&primary_release_date.gte=2000-12-09
 //&primary_release_date.lte=2000-12-09
 //&region=dhaka
 //&sort_by=popularity.asc
 //&vote_average.gte=7
 //&vote_average.lte=5
 //&vote_count.gte=4
 //&vote_count.lte=7
 //&year=2000
 
 
 */
