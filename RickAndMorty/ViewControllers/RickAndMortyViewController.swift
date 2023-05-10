//
//  RickAndMortyViewController.swift
//  RickAndMorty
//
//  Created by Alexey Kanaev on 5/10/23.
//

import UIKit

final class RickAndMortyViewController: UITableViewController {
    
    private var episode: [Episode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
        fetchEpisodes()
    }
}

//MARK: - UITableViewDataSource
extension RickAndMortyViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episode.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeName", for: indexPath) as! EpisodeViewCell
        let episodes = episode[indexPath.row]
        cell.configure(with: episodes)
        
        return cell
    }
}

// MARK: - Networking
extension RickAndMortyViewController {
    private func fetchEpisodes() {
        guard let url = URL(
            string: "https://rickandmortyapi.com/api/episode/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28"
        ) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                self.episode = try decoder.decode([Episode].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
