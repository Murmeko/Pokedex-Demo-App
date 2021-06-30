//
//  PokemonCollectionViewCell.swift
//  Pokedex Demo App
//
//  Created by Yiğit Erdinç on 22.06.2021.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pokemonCellView: UIView!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
