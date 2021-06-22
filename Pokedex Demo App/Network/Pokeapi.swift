//
//  Pokeapi.swift
//  Pokedex Demo App
//
//  Created by Yiğit Erdinç on 22.06.2021.
//

import Moya

public enum Pokeapi {
    case getAllPokemon
    case getPokemonDetails(pokemonId: Int)
}

extension Pokeapi: TargetType {
    public var baseURL: URL {
        return URL(string: "https://pokeapi.co/api/v2/pokemon")!
    }
    
    public var path: String {
        switch self {
        case .getAllPokemon:
            return "/pokemon"
        case .getPokemonDetails(pokemonId: let id):
            return "/pokemon/\(id)"
            
        }
    }
    
    public var method: Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getAllPokemon:
            return .requestPlain
        case .getPokemonDetails(pokemonId: let id):
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
