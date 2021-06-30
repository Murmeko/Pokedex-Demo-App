//
//  PokemonDetailsTableViewCell.swift
//  Pokedex Demo App
//
//  Created by Yiğit Erdinç on 22.06.2021.
//

import UIKit

class PokemonDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonDetailCellView: UIView!
    @IBOutlet weak var pokemonDetailCellImageView: UIImageView!
    @IBOutlet weak var pokemonDetailCellTitleLabel: UILabel!
    @IBOutlet weak var pokemonDetailCellHeightLabel: UILabel!
    @IBOutlet weak var pokemonDetailCellWeightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
