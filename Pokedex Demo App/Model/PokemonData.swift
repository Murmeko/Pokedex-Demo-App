//
//  PokemonData.swift
//  Pokedex Demo App
//
//  Created by Yiğit Erdinç on 22.06.2021.
//

import ObjectMapper

class PokemonData: Mappable {

    var results: [Results]?
    var count: Int?
    var next: String?
    var previous: Any?

    required init?(map: Map) {}

    func mapping(map: Map) {
        results <- map["results"]
        count <- map["count"]
        next <- map["next"]
        previous <- map["previous"]
    }
}

class Results: Mappable {

    var name: String?
    var url: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        name <- map["name"]
        url <- map["url"]
    }
}
