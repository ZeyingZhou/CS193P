//
//  CodeWordBreaker.swift
//  CodeWordBreaker
//
//  Created by Zeying Zhou on 2025-12-27.
//

import Foundation

typealias Char = String
struct CodeWordBreaker {
    var masterCode: CodeWord = CodeWord(kind: .master(isHidden: true), word: "")
    var guess: CodeWord
    var attempts: [CodeWord] = []
    let charChoices: [Char]
    var wordCount: Int
    init() {
        self.wordCount = Int.random(in: 3...6)
        self.charChoices = "QWERTYUIOPASDFGHJKLZXCVBNM".map { String($0)}
        self.guess = CodeWord(kind: .guess, word: String(repeating: " ", count: wordCount))
    }
    
    mutating func attemptGuess() -> Void {
        if guess.chars == Array(repeating: "", count: wordCount) {
            return
        }
        if attempts.contains(where: { $0.chars == guess.chars }) {
            return
        }
        var attempt = guess
        attempt.kind = .attempt(guess.match(against: masterCode))
        attempts.append(attempt)
        guess.reset()
    }
    
    mutating func setChar(char: Char, at index: Int) {
        guard guess.chars.indices.contains(index) else {
            return
        }
        guess.chars[index] = char
    }

}

enum Match {
    case nomatch
    case exact
    case inexact
}
