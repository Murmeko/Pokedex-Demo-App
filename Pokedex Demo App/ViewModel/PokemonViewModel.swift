//
//  PokemonViewModel.swift
//  Pokedex Demo App
//
//  Created by Yiğit Erdinç on 22.06.2021.
//

import Kingfisher

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
    
    
    var numberOfCells: Int {
            return pokemonCollectionCellViewModels.count
    }
        
    func getCellViewModel( at indexPath: IndexPath ) -> PokemonCollectionCellViewModel {
            return pokemonCollectionCellViewModels[indexPath.row]
    }
    
    func createCell(results: [Results]) {
        self.pokemonResults = results
        var pokemonCollectionCellViewModel = [PokemonCollectionCellViewModel]()
        var pokemonId = 1
        for result in pokemonResults {
            pokemonCollectionCellViewModel.append(PokemonCollectionCellViewModel(pokemonName: result.name!, pokemonImageURL: URL(string: "https://pokeres.bastionbot.org/images/pokemon/\(pokemonId).png")!))
            pokemonId += 1
        }
        pokemonCollectionCellViewModels = pokemonCollectionCellViewModel
    }
}

struct PokemonCollectionCellViewModel {
    let pokemonName: String
    let pokemonImageURL: URL
}
