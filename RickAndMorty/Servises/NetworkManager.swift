//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Alexey Kanaev on 5/12/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {

    static let  shared = NetworkManager()

    private init() {}

    func fetch<T: Decodable>(_ type: T.Type, from url: URL?, with completion: @escaping(Result<T, NetworkError>) -> Void) {
        guard let url = url else {
            completion(.failure(.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }

            do {
                let dataModel = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataModel))
                }
            } catch {
                completion(.failure(.decodingError))
                print(error.localizedDescription)
            }
        }.resume()
    }

}
