//
//  BarView.swift
//  Pokedex
//
//  Created by john benedict miranda on 5/13/24.
//

import SwiftUI
// component to show single barview
struct BarView: View {
    var value: Int = 100
    var title: String = "HP"
    var color: Color = .blue
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 32)
                .foregroundColor(.gray)
                .frame(width: 100)
            
            HStack {
                Text("\(value)")
                    .frame(width: 40)
                    .padding(.trailing)
                
                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(width: 180, height: 20).animation(.default)
                        .foregroundColor(Color(.systemGray5))
                    
                    Capsule()
                        .frame(width: value > 250 ? CGFloat(200) : CGFloat(value), height: 20).animation(.default)
                        .foregroundColor(color)
                }
                Spacer()
            }.padding(.leading)
        }
    }
}

// show multiple bar view component
struct BarChartView: View {
    let pokemon: Pokemon
    var body: some View {
        VStack {
            BarView(value: pokemon.height, title: "Height", color:.orange)
            BarView(value: pokemon.attack, title: "Attack", color:.red)
            BarView(value: pokemon.defense, title: "Defense", color:.blue)
            BarView(value: pokemon.weight, title: "Weight", color:.purple)
            BarView(value: 100, title: "Total", color:.green)
        }.padding()
    }
}
struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView()
        BarChartView(pokemon: SAMPLE_POKEMON)
    }
}
