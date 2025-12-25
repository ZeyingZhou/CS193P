//
//  ContentView.swift
//  CodeBreaker
//
//  Created by Zeying Zhou on 2025-12-16.
//

import SwiftUI



struct CodeBreakerView: View {
    @State var game = CodeBreaker()
    
    // Color mapping function
    func colorForPeg(_ peg: String) -> Color {
        switch peg {
        case "red": return .red
        case "blue": return .blue
        case "green": return .green
        case "yellow": return .yellow
        case "clear": return .clear
        default: return .white
        }
    }
    
    // Check if peg is a color string or emoji
    func isColorPeg(_ peg: String) -> Bool {
        return ["red", "blue", "green", "yellow", "clear"].contains(peg)
    }
    
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
            withAnimation {
                game = CodeBreaker()
            }
        }
        .font(.system(size: 80))
        .minimumScaleFactor(0.1)
    }
    
    func view(for code: Code) -> some View {
        HStack {
            ForEach(code.pegs.indices, id: \.self) { index in
                let peg = code.pegs[index]
                let isColor = isColorPeg(peg)
                
                Circle()
                    .overlay {
                        if peg == Code.missing {
                            Circle()
                                .strokeBorder(Color.gray)
                        }
                    }
                    .foregroundStyle(isColor ? colorForPeg(peg) : .white)
                    .overlay {
                        if !isColor {
                            Text(peg)
                                .font(.system(size: 120))
                                .minimumScaleFactor(9/120)
                        }
                    }
                    .contentShape(Rectangle())
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture {
                        if code.kind == .guess {
                            game.changeGuessPeg(at: index)
                        }
                    }
            }
            MatchMarkers(matches: code.matches)
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


