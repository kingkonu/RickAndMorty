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

    func configure(with episode: Result) {
        nameLabel.text = episode.name
        numberLabel.text = episode.episode
    }
}
