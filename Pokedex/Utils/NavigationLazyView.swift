//
//  NavigationLazyView.swift
//  Pokedex
//
//  Created by john benedict miranda on 5/13/24.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
