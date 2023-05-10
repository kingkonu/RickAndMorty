//
//  RickAndMortyViewController.swift
//  RickAndMorty
//
//  Created by Alexey Kanaev on 5/10/23.
//

import UIKit

final class RickAndMortyViewController: UITableViewController {
    
    private var result: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchEpisodes()
    }
}

//MARK: - UITableViewDataSource
extension RickAndMortyViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episode", for: indexPath) as! EpisodeViewCell
        let episodes = result[indexPath.row]
        cell.configure(with: episodes)
        
        return cell
    }
}

// MARK: - Networking
extension RickAndMortyViewController {
    private func fetchEpisodes() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode/10,11,12,13,14,28") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                self.result = try decoder.decode([Result].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
