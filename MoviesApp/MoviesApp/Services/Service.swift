//
//  Service.swift
//  MoviesApp
//
//  Created by Mayank Negi on 28/07/25.
//

import Foundation

enum NetworkError: Error {
    case badResponse
    case badDecoding
}

protocol NetworkRequesting {
    func perform<T: Decodable>(_ request: URLRequest) async throws -> T
}

class Service: NetworkRequesting {
    func perform<T>(_ request: URLRequest) async throws -> T where T : Decodable {
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            throw NetworkError.badResponse
        }

        do {
            let decoder = try JSONDecoder().decode(T.self, from: data)
            return decoder
        } catch {
            throw NetworkError.badDecoding
        }
    }
}
