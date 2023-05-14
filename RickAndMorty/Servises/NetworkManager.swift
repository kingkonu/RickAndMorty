//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Alexey Kanaev on 5/12/23.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    
    static let  shared = NetworkManager()
    
    private init() {}
    
    func fetchEpisodes(from url: URL, completion: @escaping(Result<[Episode], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let episode = Episode.getEpisodes(from: value)
                    completion(.success(episode))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
