//
//  ContentView.swift
//  CodeBreaker
//
//  Created by Zeying Zhou on 2025-12-16.
//

import SwiftUI

struct CodeBreakerView: View {
    @State var game = CodeBreaker(pegChoices: [.brown, .yellow, .orange, .red])
    var body: some View {
        VStack {
            view(for: game.masterCode)
            ScrollView {
                view(for: game.guess)
                ForEach(game.attempts.indices.reversed(), id: \.self) {
                    index in view(for: game.attempts[index])
                }
            }
//            pegs(colors: game.attempts[0].pegs)
        }
        .padding()
    }
    
    var guessButton: some View {
        Button("Guess") {
            withAnimation {
                game.attemptGuess()
            }
        }
        .font(.system(size: 80))
        .minimumScaleFactor(0.1)
    }
    
    var restartButton: some View {
        Button("Restart") {
                game = CodeBreaker(pegChoices: [.brown, .yellow, .orange, .red])
        }
        .font(.system(size: 80))
        .minimumScaleFactor(0.1)
    }
    
    func view(for code: Code) -> some View {
        HStack {
            ForEach(code.pegs.indices, id: \.self) { index in RoundedRectangle(cornerRadius: 10)
                    .overlay {
                        if code.pegs[index] == Code.missing {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.gray)
                        }
                    }
                    .contentShape(Rectangle())
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(code.pegs[index])
                    .onTapGesture {
                        if code.kind == .guess {
                            game.changeGuessPeg(at:index)
                        }
                    }
            }
            MatchMarkers(matches: code.matches, pegsSize: code.pegs.count)
                .overlay {
                    if code.kind == .master {
                        restartButton
                    }
                }
                .overlay {
                    if code.kind == .guess {
                        guessButton
                    }
                }
        }
    }
    
//    func pegs(colors: Array<Color>) -> some View {
//        HStack {
//            ForEach(colors.indices, id: \.self) { index in RoundedRectangle(cornerRadius: 10)
//                    .aspectRatio(1, contentMode: .fit)
//                    .foregroundStyle(colors[index])
//            }
//            MatchMarkers(matches: [.exact, .exact, .exact,.nomatch])
//        }
//    }
}


#Preview {
    CodeBreakerView()
}


