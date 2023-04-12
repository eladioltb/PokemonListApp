//
//  PokemonListCell.swift
//  PokemonListApp
//
//  Created by Eladio Loriente on 8/4/23.
//

import SwiftUI

struct PokemonListCellView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            AsyncImage(url: pokemon.pokemon_species.imageUrl) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: "number")
                    .resizable()
                    .padding()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 60)
            .background(Color.gray.opacity(0.1))
            .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(pokemon.pokemon_species.name)
                    .textCase(.uppercase)
            }
            Spacer()
        }
    }
}

struct PokemonListCellView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListCellView(pokemon: Pokemon(
            entry_number: 1,
            pokemon_species: PokemonSpecie(
                name: "bulbasur",
                url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"
            )
        ))
    }
}
