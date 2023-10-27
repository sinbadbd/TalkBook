//
//  MovieSortFilter.swift
//  MovieStream
//
//  Created by Imran on 22/8/23.
//

enum MovieSortFilter: String {
    case popularityAscending = "Popularity Ascending" //"popularity.asc"
    case popularityDescending = "Popularity Descending"//"popularity.desc"
    case voteAverageDescending = "Vote Descending"//"vote_average.desc"
    case voteAverageAscending = "Vote Ascending"//"vote_average.asc"
    case releaseDateDescending = "Release Date Descending"//"primary_release_date.desc"
    case releaseDateAscending = "Release Date Ascending"//"primary_release_date.asc"
    case titleAscending = "Title (A-Z)"//"title.asc"
    case titleDescending = "Title (Z-A)"//"title.desc"

    var description: String {
        switch self {
        case .popularityAscending:
            return "popularity.asc"
        case .popularityDescending:
            return "popularity.desc"
        case .voteAverageDescending:
            return "vote_average.desc"
        case .voteAverageAscending:
            return "vote_average.asc"
        case .releaseDateDescending:
            return "primary_release_date.desc"
        case .releaseDateAscending:
            return "primary_release_date.asc"
        case .titleAscending:
            return "title.asc"
        case .titleDescending:
            return "title.desc"
        }
    }
}



/*
 Popularity Ascending
 Popularity Descending
 Rating Descending
 Rating Ascending
 Release Date Descending
 Release Date Ascending
 Title (A-Z)
 Title (Z-A)
 */
