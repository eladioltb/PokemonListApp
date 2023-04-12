//
//  PokemonAPI.swift
//  PokemonListApp
//
//  Created by Eladio Loriente on 9/4/23.
//

import Alamofire

final class PokemonApi {
    // Function request GET Pokemon List Data
    func getPokemonList(for params: String, completion: @escaping (Result<[Pokemon], Error>) -> ()) {
        AF.request("https://pokeapi.co/api/v2/pokedex/\(params)").responseDecodable(of: PokemonList.self) { response in
            switch response.result {
                case .success(let pokemonList):
                completion(.success(pokemonList.pokemon_entries))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    // Function request GET Pokemon Data
    func getPokemonData(for id: Int, completion: @escaping (Result<PokemonCardData, Error>) -> ()) {
        AF.request("https://pokeapi.co/api/v2/pokemon/\(Int(id))").responseDecodable(of: PokemonCardData.self) { response in
            switch response.result {
                case .success(let pokemonData):
                    completion(.success(pokemonData))
                case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
