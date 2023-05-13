//
//  Episode.swift
//  RickAndMorty
//
//  Created by Alexey Kanaev on 5/10/23.
//


struct Episode: Decodable {
    let name: String
    let episode: String
    let airDate: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case episode = "episode"
        case airDate = "air_date"
    }
}

