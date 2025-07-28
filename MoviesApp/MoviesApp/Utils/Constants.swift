//
//  Constants.swift
//  MoviesApp
//
//  Created by Mayank Negi on 28/07/25.
//

import Foundation

struct Constants {

    struct APIKey {
        static let omdbKey = "927811d9"
    }

    struct urls {
        static func urlBySearch(search: String) -> String {
            "http://www.omdbapi.com/?s=\(search)&page=1&apikey=\(APIKey.omdbKey)"
        }

        static func urlForMovieDetailsByOmdbId(imdbId: String) -> String {
            "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(APIKey.omdbKey)"
        }
    }
}
