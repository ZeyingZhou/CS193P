//
//  ContentView.swift
//  CodeBreaker
//
//  Created by Zeying Zhou on 2025-12-16.
//

import SwiftUI

struct CodeBreakerView: View {
    let game = CodeBreaker()
    var body: some View {
        VStack {
            view(for: game.masterCode)
            view(for: game.guess)
//            pegs(colors: game.attempts[0].pegs)
        }
        .padding()
    }
    
    func view(for code: Code) -> some View {
        HStack {
            ForEach(code.pegs.indices, id: \.self) { index in RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(code.pegs[index])
                    .onTapGesture {]
                        game.changeGuessPeg(at:index)
                    }
            }
            MatchMarkers(matches: [.exact, .exact, .exact,.nomatch])
        }
    }
    
    func pegs(colors: Array<Color>) -> some View {
        HStack {
            ForEach(colors.indices, id: \.self) { index in RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(colors[index])
            }
            MatchMarkers(matches: [.exact, .exact, .exact,.nomatch])
        }
    }
}


#Preview {
    return CodeBreakerView()
}


