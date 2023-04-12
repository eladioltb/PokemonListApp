//
//  PokemonGenerationsListView.swift
//  PokemonListApp
//
//  Created by Eladio Loriente on 12/4/23.
//

import SwiftUI

struct PokemonGenerationsListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("PokemonLogo").resizable().frame(width: 350, height: 150).padding()
                Spacer().padding([.leading, .trailing]).frame(height: 25)
                VStack {
                    NavigationLink (destination: PokemonListApp(generationId: "2")) {
                        HStack {
                            Text("First Generation").frame(maxWidth: 300, maxHeight: 50).padding().background(Color.purple.opacity(0.3)).cornerRadius(5)
                        }
                    }.frame(maxWidth: .infinity).padding()
                    NavigationLink (destination: PokemonListApp(generationId: "3")) {
                        HStack {
                            Text("Second Generation").frame(maxWidth: 300, maxHeight: 50).padding().background(Color.purple.opacity(0.3)).cornerRadius(5)
                        }
                    }.frame(maxWidth: .infinity).padding()
                    NavigationLink (destination: PokemonListApp(generationId: "4")) {
                        HStack {
                            Text("Third Generation").frame(maxWidth: 300, maxHeight: 50).padding().background(Color.purple.opacity(0.3)).cornerRadius(5)
                        }
                    }.frame(maxWidth: .infinity).padding()
                    NavigationLink (destination: PokemonListApp(generationId: "5")) {
                        HStack {
                            Text("Fourth Generation").frame(maxWidth: 300, maxHeight: 50).padding().background(Color.purple.opacity(0.3)).cornerRadius(5)
                        }
                    }.frame(maxWidth: .infinity).padding()
                }
            }
        }
    }
}

struct PokemonGenerationsListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonGenerationsListView()
    }
}
