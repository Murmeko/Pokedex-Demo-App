//
//  NetworkManager.swift
//  Pokedex Demo App
//
//  Created by Yiğit Erdinç on 22.06.2021.
//

import Moya

protocol NetworkManagerDelegate {
    func didGetAllPokemon(data: PokemonData)
    func didFailWithError(data: Error)
}

struct NetworkManager {
    let pokeapiProvider = MoyaProvider<Pokeapi>()
    
    var delegate: NetworkManagerDelegate
    
    func getAllPokemon() {
        pokeapiProvider.request(.getAllPokemon) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                    let moyaResponseJson = try filteredResponse.mapJSON()
                    let allPokemonData = PokemonData(JSON: moyaResponseJson as! [String : Any])
                    self.delegate.didGetAllPokemon(data: allPokemonData!)
                }
                catch let error {
                    print(error)
                }
            case let .failure(error):
                self.delegate.didFailWithError(data: error)
            }
        }
    }
}
