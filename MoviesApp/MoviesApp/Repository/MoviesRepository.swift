//
//  MoviesRepository.swift
//  MoviesApp
//
//  Created by Mayank Negi on 28/07/25.
//

import Foundation

class MoviesRepository {

    let service: NetworkRequesting

    init(service: NetworkRequesting) {
        self.service = service
    }

    func getMovies(movie: String) async -> [Movie] {
        let request = URLRequest(url: URL(string: Constants.urls.urlBySearch(search: movie))!)
        var movies: [Movie] = []
        do {
            movies = try await service.perform(request)
        } catch {
            print("Something went wrong: \(error)")
        }
        return movies
    }
}
