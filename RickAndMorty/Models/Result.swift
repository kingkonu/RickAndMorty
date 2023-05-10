//
//  Result.swift
//  RickAndMorty
//
//  Created by Alexey Kanaev on 5/10/23.
//

import Foundation

struct Result: Decodable {
    let name: String
    let episode: String
}


struct Morty: Decodable {
    let results: Result
}
