//
//  PokemonDetailsViewModel.swift
//  Pokedex Demo App
//
//  Created by Yiğit Erdinç on 30.06.2021.
//

import Foundation

class PokemonDetailsViewModel {
    
    var networkManager = NetworkManager()
    var reloadTableView: (()->())?
    var pokemonDetails: PokemonDetailsData?
    var pokemonDetailsTableCellViewModel = PokemonDetailsTableCellViewModel(pokemonImageURL: nil, pokemonName: nil, pokemonHeight: nil, pokemonWeight: nil) {
        didSet {
            self.reloadTableView?()
        }
    }
    
    func getPokemonDetails(_ pokemonId: Int) {
        networkManager.fetchPokemonDetailsData(pokemonId) { data, error in
            self.createCell(details: data!)
            self.reloadTableView?()
        }
    }
    
    func createCell(details: PokemonDetailsData) {
        self.pokemonDetails = details
        self.pokemonDetailsTableCellViewModel = PokemonDetailsTableCellViewModel(pokemonImageURL: URL(string: "https://pokeres.bastionbot.org/images/pokemon/\(details.id!).png")!, pokemonName: details.name!.capitalized, pokemonHeight: "Height: \((details.height!)*10) centimeters.", pokemonWeight: "Weight: \(Float(details.weight!)/10) kilograms.")
    }
    
    func getCellViewModel() -> PokemonDetailsTableCellViewModel {
        return pokemonDetailsTableCellViewModel
    }
}

struct PokemonDetailsTableCellViewModel {
    let pokemonImageURL: URL?
    let pokemonName: String?
    let pokemonHeight: String?
    let pokemonWeight: String?
}
