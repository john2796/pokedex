//
//  PokemonCell.swift
//  Pokedex
//
//  Created by john benedict miranda on 5/12/24.
//

import SwiftUI
import KingfisherSwiftUI

struct PokemonCell: View {
    let pokemon: Pokemon
    let viewModel: PokemonCellViewModel
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        self.viewModel = PokemonCellViewModel(pokemon: pokemon)
    }
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                Text(self.pokemon.name.capitalized).font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 4)
                    .padding(.leading)
                
                Spacer()
                
                HStack {
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.init(top: 8, leading: 16, bottom: 6, trailing: 16))
                        .overlay(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.25)))
                        .frame(width: 100, height: 24)
                    Image(self.pokemon.imageUrl)
                        .resizable()
                        .scaledToFit() // scaled to its parent to fit
                        .padding([.bottom, .trailing], 4)
                        .frame(width: 68, height: 68)
                    
                }
            }.padding(.top, 4)
            
        }
        .background(Color.green)
        .cornerRadius(12)
        .shadow(color: Color(viewModel.backgroundColor), radius: 6, x: 0, y: 0)
    }
}

