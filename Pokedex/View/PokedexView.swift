//
//  PokedexView.swift
//  Pokedex
//
//  Created by john benedict miranda on 5/12/24.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = PokemonViewModel()
    @State var showFilterButtons = false
    @State var filterApplied = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        let dataSource = filterApplied ? viewModel.filteredPokemon :
                        viewModel.pokemon
                        ForEach(dataSource) { pokemon in
                           NavigationLink(
                            destination: NavigationLazyView(PokemonDetailView()),
                            label: {
                                PokemonCell(pokemon: pokemon)
                                    .frame(width:220, height: 108)
                                    .padding(.horizontal)
                            })
                        }
                    }
                }
                .navigationBarTitle("Poke mo! Catch em all")
                .onAppear {
                    viewModel.fetchPokemon()
                }
            }
            
        PokemonCell(pokemon: SAMPLE_POKEMON)
            .frame(width: 220, height: 108)
            .padding(.horizontal)
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}



// to toggle preview =  option + command + enter
