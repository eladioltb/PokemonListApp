//
//  Person.swift
//  PokemonListApp
//
//  Created by Eladio Loriente on 8/4/23.
//

import Foundation

struct PokemonList: Decodable {
    let pokemon_entries: [Pokemon]
}

struct Pokemon: Decodable {
    let entry_number: Int
    let pokemon_species: PokemonSpecie
}

struct PokemonSpecie: Decodable {
    let name: String
    let url: String
    var id: Int? {
        return Int(url.split(separator: "/").last?.description ?? "1")
    }
    var imageUrl: URL? {
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id ?? 1).png")
    }
}

struct PokemonCardData: Decodable {
    let id: Int
    let name: String
    let base_experience: Double
    let weight: Int
    let height: Int
    let sprites: PokemonSprites
    let stats: [PokemonStats]
    let types: [PokemonTypes]
}

struct PokemonSprites: Decodable {
    let back_default: String
    let back_shiny: String
    let front_default: String
    let front_shiny: String
}

struct PokemonStats: Decodable {
    let base_stat: Int
    let effort: Int
    let stat: PokemonStat
}

struct PokemonStat: Decodable {
    let name: String
}

struct PokemonTypes: Decodable {
    let slot: Int
    let type: PokemonType
}

struct PokemonType: Decodable {
    let name: String
}

