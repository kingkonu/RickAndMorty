//
//  RickAndMortyViewController.swift
//  RickAndMorty
//
//  Created by Alexey Kanaev on 5/10/23.
//

import UIKit

final class RickAndMortyViewController: UITableViewController {
    
    private var episode: [Episode] = []
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
        fetchEpisode()
    }

    
    private func fetchEpisode () {
        guard let url = URL(
            string: "https://rickandmortyapi.com/api/episode/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28"
        ) else { return }

        networkManager.fetchEpisodes(from: url) { result in
            switch result {
            case .success(let episode):
                self.episode = episode
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

//MARK: - UITableViewDataSource
extension RickAndMortyViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episode.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeName", for: indexPath) as! EpisodeViewCell
        let episodes = episode[indexPath.row]
        cell.configure(with: episodes)
        
        return cell
    }
}


