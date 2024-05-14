//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by john benedict miranda on 5/13/24.
//

import SwiftUI
import KingfisherSwiftUI

struct PokemonDetailView: View {
    // kinda like props you need to pass to pokemonDetailView component
    let pokemon: Pokemon
    let viewModel: PokemonCellViewModel
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        self.viewModel = PokemonCellViewModel(pokemon: pokemon)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(viewModel.backgroundColor), Color.white]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            // split to bottom to white bg
            Color.white.offset(y: 300)
            
            ScrollView{
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .frame(width: 200, height: 200)
                
                VStack  {
                    Text(pokemon.name.capitalized)
                        .font(.largeTitle)
                        .padding(.top, 40)
                    
                    Text(pokemon.type.capitalized)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.init(top: 8, leading: 24, bottom: 8, trailing: 24))
                        .background(Color(viewModel.backgroundColor))
                        .cornerRadius(20)
                    
                    Text(pokemon.description)
                        .padding(.horizontal)
                        .padding(.top, 12)
                    
                    HStack{ Spacer() }
                }
                .background(Color.white)
                .cornerRadius(40)
                .padding(.top, -40)
                .zIndex(-1)
                
                HStack{
                    Text("Stats")
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.leading)
                    
                    Spacer()
                }
                
                BarChartView(pokemon: pokemon)
                    .padding(.trailing)
                
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: SAMPLE_POKEMON)
    }
}
