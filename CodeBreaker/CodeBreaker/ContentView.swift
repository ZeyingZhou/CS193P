//
//  ContentView.swift
//  CodeBreaker
//
//  Created by Zeying Zhou on 2025-12-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            pegs(colors: [.red,.green,.blue,.yellow])
            pegs(colors: [.red,.green,.green,.yellow])
            pegs(colors: [.red,.green,.green,.blue, .green])
        }
        .padding()
    }
    
    func pegs(colors: Array<Color>) -> some View {
        HStack {
            ForEach(colors.indices, id: \.self) { index in RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(colors[index])
            }
            MatchMarkers(matches: [.exact, .exact, .exact])
        }
    }
}




#Preview {
    ContentView()
}
