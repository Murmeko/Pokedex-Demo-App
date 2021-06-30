//
//  NetworkManager.swift
//  Pokedex Demo App
//
//  Created by Yiğit Erdinç on 22.06.2021.
//

import Moya

enum NetworkManagerError: Error {
  case failedRequest
  case invalidData
}

struct NetworkManager {
    let pokeapiProvider = MoyaProvider<Pokeapi>()
    
    typealias PokemonDataCompletion = (PokemonData?, NetworkManagerError?) -> ()
    typealias PokemonDetailsDataCompletion = (PokemonDetailsData?, NetworkManagerError?) -> ()
    typealias PokemonImageCompletion = (UIImage?, NetworkManagerError?) -> ()
    
    func fetchAllPokemonData(completion: @escaping PokemonDataCompletion) {
        pokeapiProvider.request(.getAllPokemon) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                    let moyaResponseJson = try filteredResponse.mapJSON()
                    let allPokemonData = PokemonData(JSON: moyaResponseJson as! [String : Any])
                    completion(allPokemonData, nil)
                }
                catch let error {
                    print("Unable to decode PokeAPI response: \(error.localizedDescription)")
                    completion(nil, .invalidData)
                    return
                }
            case let .failure(error):
                print("Failed request from PokeAPI: \(error.localizedDescription)")
                completion(nil, .failedRequest)
                return
            }
        }
    }
    
    func fetchPokemonDetailsData(_ pokemonId: Int, completion: @escaping PokemonDetailsDataCompletion) {
        pokeapiProvider.request(.getPokemonDetails(pokemonId)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                    let moyaResponseJson = try filteredResponse.mapJSON()
                    let pokemonDetailsData = PokemonDetailsData(JSON: moyaResponseJson as! [String : Any])
                    completion(pokemonDetailsData, nil)
                }
                catch let error {
                    print("Unable to decode PokeAPI response: \(error.localizedDescription)")
                    completion(nil, .invalidData)
                    return
                }
            case let .failure(error):
                print("Failed request from PokeAPI: \(error.localizedDescription)")
                completion(nil, .failedRequest)
                return
            }
        }
    }
}
