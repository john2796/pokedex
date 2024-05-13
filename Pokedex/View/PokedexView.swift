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
        PokemonCell(pokemon: SAMPLE_POKEMON)
            .frame(width: 220, height: 108)
            .padding(.horizontal)
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}



// to toggle preview =  option + command + enter
