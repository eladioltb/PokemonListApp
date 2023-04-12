//
//  ContentView.swift
//  PokemonListApp
//
//  Created by Eladio Loriente on 8/4/23.
//

import SwiftUI

struct PokemonListApp: View {
    
    let generationId: String;
    @State var seachPokemon = ""
    let pokemonData: PokemonCardData = PokemonCardData(
        id: 0,
        name: "",
        base_experience: 0,
        weight: 0,
        height: 0,
        sprites: PokemonSprites(back_default: "", back_shiny: "", front_default: "", front_shiny: ""),
        stats: [PokemonStats(base_stat: 0, effort: 0, stat: PokemonStat(name: ""))],
        types: [PokemonTypes(slot: 0, type: PokemonType(name: ""))])
    @State var pokemonList: [Pokemon] = []
    
    var filteredItems: [Pokemon] {
        pokemonList.filter { seachPokemon.isEmpty ? true : $0.pokemon_species.name.lowercased().contains(seachPokemon.lowercased()) }
    }
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Pokémons").font(.system(size: 36)).bold().frame(maxWidth: .infinity, alignment: .leading).padding()
                HStack {
                    TextField("Search pokemon by name", text: $seachPokemon)
                        .padding()
                }
                List(filteredItems, id: \.pokemon_species.name) { pokemon in
                    NavigationLink(destination: PersonListCardView(pokemon: pokemon, pokemonId: pokemon.pokemon_species.id ?? 1, pokemonData: pokemonData)) {
                         PokemonListCellView(pokemon: pokemon)
                     }
                }.onAppear() {
                    
                    PokemonApi().getPokemonList(for: generationId) { result in
                        switch result {
                            case .success(let pokemonList):
                                self.pokemonList = pokemonList
                            case .failure(let error):
                                print(error)
                        }
                    }
                    
                    
                }
            }.frame(alignment: .top)
        }
    }
}

struct PokemonListApp_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListApp(generationId: "2")
    }
}
