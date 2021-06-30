//
//  PokemonDetailsData.swift
//  Pokedex Demo App
//
//  Created by Yiğit Erdinç on 22.06.2021.
//

import ObjectMapper

class PokemonDetailsData: Mappable {
    var height: Int?
    var weight: Int?
    var name: String?
    var id: Int?

    required init?(map: Map) {}

    func mapping(map: Map) {
        height <- map["height"]
        weight <- map["weight"]
        name <- map["name"]
        id <- map["id"]
    }
}
