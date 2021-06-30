//
//  Pokeapi.swift
//  Pokedex Demo App
//
//  Created by Yiğit Erdinç on 22.06.2021.
//

import Moya

public enum Pokeapi {
    case getAllPokemon
    case getPokemonDetails(_ id: Int)
}

extension Pokeapi: TargetType {
    public var baseURL: URL {
        return URL(string: "https://pokeapi.co/api/v2")!
    }
    
    public var path: String {
        switch self {
        case .getAllPokemon:
            return "/pokemon"
        case .getPokemonDetails(let pokemonId):
            return "/pokemon/\(pokemonId)"
            
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
            return .requestParameters(parameters: ["offset" : 0, "limit" : 151], encoding: URLEncoding.default)
        case .getPokemonDetails(_):
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
