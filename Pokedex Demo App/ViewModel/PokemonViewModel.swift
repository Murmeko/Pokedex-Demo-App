//
//  PokemonViewModel.swift
//  Pokedex Demo App
//
//  Created by Yiğit Erdinç on 22.06.2021.
//

import Foundation

class PokemonViewModel {
    
    var networkManager = NetworkManager()
    var reloadTableView: (()->())?
    var pokemonResults: [Results] = []
    var pokemonCollectionCellViewModels: [PokemonCollectionCellViewModel] = [PokemonCollectionCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }
    
    func getPokemon() {
        networkManager.fetchAllPokemonData { data, error in
            self.createCell(results: (data?.results)!)
            self.reloadTableView?()
        }
    }
    
    func createCell(results: [Results]) {
        var pokemonId = 1
        self.pokemonResults = results
        for result in pokemonResults {
            self.pokemonCollectionCellViewModels.append(PokemonCollectionCellViewModel(pokemonName: result.name!.capitalized, pokemonImageURL: URL(string: "https://pokeres.bastionbot.org/images/pokemon/\(pokemonId).png")!))
            pokemonId += 1
        }
    }
    
    var numberOfCells: Int {
            return pokemonCollectionCellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> PokemonCollectionCellViewModel {
        return pokemonCollectionCellViewModels[indexPath.row]
    }
}

struct PokemonCollectionCellViewModel {
    let pokemonName: String
    let pokemonImageURL: URL
}
