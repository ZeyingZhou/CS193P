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
            WordView(codeWord: game.masterCode)
            ScrollView {
                if !game.isOver {
                    WordView(codeWord: game.guess, selection: $selection)
                }
                ForEach(game.attempts.indices.reversed(), id: \.self) {
                    index in WordView(codeWord: game.attempts[index],selection: $selection,matches:game.attempts[index].matches)
                }
            }
            KeyBoard(
                onChoose: {
                    character in
                    game.setChar(char: character, at: selection)
                    selection = (selection + 1) % game.wordCount
                }, onBackspace: {
                    var indexToMove: Int
                    if(game.guess.chars[selection] == .missing) {
                        indexToMove = max(selection-1, .zero)
                        game.guess.chars[indexToMove] = .missing
                    }
                    else {
                        indexToMove = selection
                        game.guess.chars[selection] = .missing
                    }
                    selection = indexToMove
                }, onRestart: {
                    game.restart()
                    game.masterCode.word = words.random(length: game.wordCount) ?? "ERROR"
                    print(game.masterCode.word)
                }, onReturn: {
                    game.attemptGuess()
                    selection = 0
                })
        }
        .padding()
        .onChange(of: words.count, initial: true) {
            if game.attempts.count == 0 {
                if words.count == 0 {
                    game.masterCode.word = "AWAIT"
                } else {
                    game.masterCode.word = words.random(length: game.wordCount) ?? "ERROR"
                    print(game.masterCode.word)
                }
            }
        }
    }
    
    
    
    
//    func view(for word: CodeWord) -> some View {
//        HStack {
//            WordView(codeWord: word,selection: $selection)
//        }
//    }
}

extension Color {
    static func gray(_ brightness: CGFloat) -> Color {
        return Color(hue: 148/360, saturation: 0, brightness: brightness)
    }
 }

#Preview {
    CodeWordBreakerView()
}
