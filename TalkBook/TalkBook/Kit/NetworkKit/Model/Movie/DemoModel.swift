//
//  DemoModel.swift
//  MovieZoo
//
//  Created by Imran on 5/9/23.
//

import Foundation

struct PopularList: Identifiable, Hashable {
    var id = UUID().uuidString
    let title: String
    let image: String
    let location: String
    let rating: String
    let price: Int
    let unit: String
    let isFav: Bool
    let isBookmark: Bool
}

let popularList:[PopularList] = [
    PopularList(title: "Gawthorne's Hut - BEST UNIQUE STAY", image: "pexels-1", location: "Mudgee, New South Wales, Australia", rating: "5", price: 534, unit: "Night", isFav: false, isBookmark: false),
    PopularList(title: "Gawthorne's Hut - BEST UNIQUE STAY", image: "pexels-2", location: "Mudgee, New South Wales, Australia.", rating: "4.5", price: 534, unit: "2 Night", isFav: false, isBookmark: false),
    PopularList(title: "Gawthorne's Hut - BEST UNIQUE STAY", image: "pexels-3", location: "Mudgee, New South Wales, Australia.", rating: "4.1", price: 534, unit: "2 Night", isFav: false, isBookmark: false),
    PopularList(title: "Gawthorne's Hut - BEST UNIQUE STAY", image: "pexels-4", location: "Mudgee, New South Wales, Australia", rating: "5", price: 534, unit: "2 Night", isFav: false, isBookmark: false),
    PopularList(title: "Gawthorne's Hut - BEST UNIQUE STAY", image: "pexels-5", location: "Mudgee, New South Wales, Australia", rating: "1.3", price: 534, unit: "2 Night", isFav: false, isBookmark: false),
    PopularList(title: "Gawthorne's Hut - BEST UNIQUE STAY", image: "pexels-6", location: "Mudgee, New South Wales, Australia", rating: "2.6", price: 534, unit: "2 Night", isFav: false, isBookmark: false),
    PopularList(title: "Gawthorne's Hut - BEST UNIQUE STAY", image: "pexels-7", location: "Mudgee, New South Wales, Australia", rating: "3.9", price: 534, unit: "2 Night", isFav: false, isBookmark: false),
    PopularList(title: "Gawthorne's Hut - BEST UNIQUE STAY", image: "pexels-8", location: "Mudgee, New South Wales, Australia", rating: "3", price: 534, unit: "2 Night", isFav: false, isBookmark: false),
]

let popularList2:[PopularList] = [
    PopularList(title: "Gawthorne's Hut - BEST UNIQUE STAY", image: "1", location: "Mudgee, New South Wales, Australia", rating: "5", price: 534, unit: "Night", isFav: false, isBookmark: false),
    PopularList(title: "Gawthorne's Hut - BEST UNIQUE STAY", image: "2", location: "Mudgee, New South Wales, Australia.", rating: "4.5", price: 534, unit: "2 Night", isFav: false, isBookmark: false),
    PopularList(title: "Gawthorne's Hut - BEST UNIQUE STAY", image: "3", location: "Mudgee, New South Wales, Australia.", rating: "4.1", price: 534, unit: "2 Night", isFav: false, isBookmark: false),
    PopularList(title: "Gawthorne's Hut - BEST UNIQUE STAY", image: "5", location: "Mudgee, New South Wales, Australia", rating: "1.3", price: 534, unit: "2 Night", isFav: false, isBookmark: false),
    PopularList(title: "Gawthorne's Hut - BEST UNIQUE STAY", image: "6", location: "Mudgee, New South Wales, Australia", rating: "2.6", price: 534, unit: "2 Night", isFav: false, isBookmark: false),
    PopularList(title: "Gawthorne's Hut - BEST UNIQUE STAY", image: "7", location: "Mudgee, New South Wales, Australia", rating: "3.9", price: 534, unit: "2 Night", isFav: false, isBookmark: false),
    PopularList(title: "Gawthorne's Hut - BEST UNIQUE STAY", image: "8", location: "Mudgee, New South Wales, Australia", rating: "3", price: 534, unit: "2 Night", isFav: false, isBookmark: false),
]
