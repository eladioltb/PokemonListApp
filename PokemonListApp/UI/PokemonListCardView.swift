//
//  PersonListCard.swift
//  PokemonListApp
//
//  Created by Eladio Loriente on 8/4/23.
//

import SwiftUI

struct PersonListCardView: View {
    
    let pokemon: Pokemon
    let pokemonId: Int
    @State var pokemonData: PokemonCardData
    var body: some View {
        ScrollView(.vertical) {
            VStack{
                Text("Pokédex #\(Int(pokemonData.id))").font(.title)
                
                Spacer().frame(height: 25)
                
                VStack {
                    Text("Main info").bold().font(.title2)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    Divider()
                    HStack {
                        VStack {
                            Text("Name: ").frame(maxWidth: .infinity, alignment: .leading).bold()
                            Text(pokemonData.name.capitalized).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        }.padding()
                        VStack {
                            Text("Base XP:").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading).bold()
                            ProgressView(value: pokemonData.base_experience, total: 400) {
                                Text("\(Int(pokemonData.base_experience)) / 400").font(.footnote).frame(maxWidth: .infinity, alignment: .leading)
                            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        }.padding()
                    }
                    VStack(alignment: .leading) {
                        Text("Base Stats:").bold().padding([.bottom])
                        HStack {
                            VStack {
                                ForEach(pokemonData.stats.prefix(3), id: \.stat.name) { stats in
                                    Text(String(stats.stat.name.uppercased() + ": " + "\(Int(stats.base_stat))")).frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            VStack {
                                ForEach(pokemonData.stats.suffix(3), id: \.stat.name) { stats in
                                    Text(String(stats.stat.name.uppercased() + ": " + "\(Int(stats.base_stat))")).frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                    }.padding()
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer().frame(height: 25)
                
                VStack {
                    Text("Sprites").bold().font(.title2)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    Divider()
                    Text("Default Sprite").padding([.top])
                    HStack {
                        AsyncImage(url: URL(string: pokemonData.sprites.front_default)) { image in
                            image.resizable()
                        } placeholder: {
                            Image(systemName: "number").resizable().padding([.leading, .trailing])
                        }.frame(width: 135, height: 135)
                        
                        AsyncImage(url: URL(string: pokemonData.sprites.back_default)) { image in
                            image.resizable()
                        } placeholder: {
                            Image(systemName: "number").resizable().padding([.leading, .trailing])
                        }.frame(width: 135, height: 135)
                        
                    }.frame(maxWidth: .infinity)
                    Text("Shiny Sprite").padding([.top])
                    HStack {
                        AsyncImage(url: URL(string: pokemonData.sprites.front_shiny)) { image in
                            image.resizable()
                        } placeholder: {
                            Image(systemName: "number").resizable().padding([.leading, .trailing])
                        }.frame(width: 135, height: 135)
                        
                        AsyncImage(url: URL(string: pokemonData.sprites.back_shiny)) { image in
                            image.resizable()
                        } placeholder: {
                            Image(systemName: "number").resizable().padding([.leading, .trailing])
                        }.frame(width: 135, height: 135)
                        
                    }.frame(maxWidth: .infinity)
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack {
                    Text("Data").bold().font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                    HStack {
                        Text("Weight: " + String(pokemonData.weight))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        Text("Height: " + String(pokemonData.height))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                    }.padding()
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer().frame(height: 25)
                
                VStack {
                    Text("Types").bold().font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                    ForEach(pokemonData.types, id: \.slot) { type in
                        Text(String(type.type.name.capitalized)).padding([.leading, .top])
                    }.frame(maxWidth: .infinity, maxHeight: 150, alignment: .leading)
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            .onAppear() {
                PokemonApi().getPokemonData(for: pokemonId) { result in
                    switch result {
                        case .success(let pokemon):
                        self.pokemonData = pokemon
                        case .failure(let error):
                            print(error)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
        }
    }
}

struct PersonListCard_Previews: PreviewProvider {
    static var previews: some View {
        PersonListCardView(
            pokemon: Pokemon(
                entry_number: 1,
                pokemon_species: PokemonSpecie(
                    name: "bulbasur",
                    url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"
                )
            ),
            pokemonId: 1,
            pokemonData: PokemonCardData(
                id: 0,
                name: "",
                base_experience: 0,
                weight: 0,
                height: 0,
                sprites: PokemonSprites(back_default: "", back_shiny: "", front_default: "", front_shiny: ""),
                stats: [PokemonStats(base_stat: 0, effort: 0, stat: PokemonStat(name: ""))],
                types: [PokemonTypes(slot: 0, type: PokemonType(name: ""))]
            )
        )
    }
}
