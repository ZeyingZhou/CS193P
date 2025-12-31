//
//  ContentView.swift
//  CodeWordBreaker
//
//  Created by Zeying Zhou on 2025-12-27.
//

import SwiftUI

struct CodeWordBreakerView: View {
    //MARK: Data In
    @Environment(\.words) var words
    @State private var game = CodeWordBreaker()
    @State private var selection: Int = 0
    @State private var checker = UITextChecker()
    var body: some View {
        VStack {
            view(for: game.masterCode)
            ScrollView {
                view(for: game.guess)
                ForEach(game.attempts.indices.reversed(), id: \.self) {
                    index in view(for: game.attempts[index])
                }
            }
            KeyBoard { character in
                game.setChar(char: character, at: selection)
                selection = (selection + 1) % game.wordCount
            } restartButton: {
                restartButton
            }
        }
        .padding()
        .onChange(of: words.count, initial: true) {
            if game.attempts.count == 0 {
                if words.count == 0 {
                    game.masterCode.word = "AWAIT"
                } else {
                    game.masterCode.word = words.random(length: game.wordCount) ?? "ERROR"
                }
            }
        }
    }
    
    var guessButton: some View {
        Button("Guess") {
            withAnimation {
                game.attemptGuess()
                selection = 0
            }
        }
        .font(.system(size: 80))
        .minimumScaleFactor(0.1)
    }
    
    var restartButton: some View {
        Button(action:{
            withAnimation {
                game = CodeWordBreaker()
                if words.count == 0 {
                    game.masterCode.word = "AWAIT"
                } else {
                    game.masterCode.word = words.random(length: game.wordCount) ?? "ERROR"
                }
                selection = 0
            }
        }) {
            Image(systemName: "arrow.clockwise")
        }
        .font(.system(size: 24, weight: .semibold, design: .rounded))
        .foregroundStyle(.primary)
        .frame(width: 35, height: 50)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.systemGray5))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color(.systemGray4), lineWidth: 1)
        )
        .buttonStyle(.plain)
    }
    
    func view(for word: CodeWord) -> some View {
        HStack {
            WordView(codeWord: word,selection: $selection)
        }
    }
}

extension Color {
    static func gray(_ brightness: CGFloat) -> Color {
        return Color(hue: 148/360, saturation: 0, brightness: brightness)
    }
 }

#Preview {
    CodeWordBreakerView()
}
