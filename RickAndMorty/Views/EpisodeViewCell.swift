//
//  EpisodeViewCell.swift
//  RickAndMorty
//
//  Created by Alexey Kanaev on 5/10/23.
//

import UIKit

final class EpisodeViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    private let networkManager = NetworkManager.shared

    func configure(with episode: Episode) {
        nameLabel.text = episode.name
        numberLabel.text = "Номер эпизода - \(episode.episode)"
        dateLabel.text = episode.airDate
    }
}
