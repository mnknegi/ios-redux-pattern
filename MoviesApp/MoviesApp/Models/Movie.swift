//
//  Movie.swift
//  MoviesApp
//
//  Created by Mayank Negi on 28/07/25.
//

import Foundation

struct MovieResponse: Decodable {
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Decodable {
    let title: String
    let imdbID: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case poster = "Poster"
        case imdbID
    }
}
