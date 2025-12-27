//
//  ContentView.swift
//  CodeBreaker
//
//  Created by Zeying Zhou on 2025-12-16.
//

import SwiftUI

extension Color {
    // Failable initializer - returns nil if the color name is not recognized
    init?(name: String) {
        switch name.lowercased() {
        // Primary colors
        case "red":
            self = .red
        case "blue":
            self = .blue
        case "green":
            self = .green
        case "yellow":
            self = .yellow
        case "orange":
            self = .orange
        case "purple":
            self = .purple
        case "pink":
            self = .pink
            
        // Grayscale
        case "white":
            self = .white
        case "black":
            self = .black
        case "gray", "grey":
            self = .gray
        case "clear":
            self = .clear
            
        // System colors
        case "primary":
            self = .primary
        case "secondary":
            self = .secondary
            
        // Additional colors
        case "cyan":
            self = .cyan
        case "mint":
            self = .mint
        case "indigo":
            self = .indigo
        case "teal":
            self = .teal
        case "brown":
            self = .brown
            
        default:
            return nil // Returns nil for unrecognized color names
        }
    }
    
    // Computed property to get the name back from a Color
    var name: String? {
        switch self {
        case .red: return "red"
        case .blue: return "blue"
        case .green: return "green"
        case .yellow: return "yellow"
        case .orange: return "orange"
        case .purple: return "purple"
        case .pink: return "pink"
        case .white: return "white"
        case .black: return "black"
        case .gray: return "gray"
        case .clear: return "clear"
        case .primary: return "primary"
        case .secondary: return "secondary"
        case .cyan: return "cyan"
        case .mint: return "mint"
        case .indigo: return "indigo"
        case .teal: return "teal"
        case .brown: return "brown"
        default: return nil
        }
    }
}

struct CodeBreakerView: View {
    @State private var game = CodeBreaker()
    
    // Check if peg is a color string or emoji
    func isColorPeg(_ peg: String) -> Bool {
        return Color(name: peg) != nil
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
                
                Circle()
                    .overlay {
                        if peg == Code.missingPeg {
                            Circle()
                                .strokeBorder(Color.gray)
                        }
                    }
                    .foregroundStyle(Color(name: peg) ?? .white)
                    .overlay {
                        if Color(name: peg) == nil {
                            // Not a color name, so display as text (emoji)
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
            Rectangle().foregroundStyle(.clear).aspectRatio(1,contentMode: .fit).overlay {
                if let matches = code.matches {
                    MatchMarkers(matches: matches)
                } else if code.kind == .master {
                    restartButton
                } else {
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


