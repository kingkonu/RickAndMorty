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
    
    init(name: String, episode: String, airDate: String) {
        self.name = name
        self.episode = episode
        self.airDate = airDate
    }
    
    init(from episodeData: [String: Any]) {
        name = episodeData["name"] as? String ?? ""
        episode = episodeData["episode"] as? String ?? ""
        airDate = episodeData["air_date"] as? String ?? ""
    }
    
    static func getEpisodes(from value: Any) -> [Episode] {
        guard let episodesData = value as? [[String: Any]] else { return [] }
        return episodesData.map { Episode(from: $0) }
    }
}

