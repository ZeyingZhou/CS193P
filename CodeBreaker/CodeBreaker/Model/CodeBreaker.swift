//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by Zeying Zhou on 2025-12-21.
//

import Foundation

typealias Peg = String


struct CodeBreaker {
    var masterCode: Code
    var guess: Code
    var attempts: [Code] = []
    let pegCount: Int
    let pegChoices: [Peg]
    
    init() {
        if(Bool.random()) {
            pegChoices = ["red", "blue", "green", "yellow"]
        } else {
            pegChoices = ["😀","😨","🥳","😱","😆","😭","😈","😋"]
        }
        self.pegCount = Int.random(in: 3...6)
        self.masterCode = Code(kind: .master(isHidden: true), pegs: Array(repeating: Code.missingPeg, count: pegCount))
        self.guess = Code(kind: .guess, pegs: Array(repeating: Code.missingPeg, count: pegCount))
        masterCode.randomize(from: pegChoices)
        print(masterCode)
    }
    
    var isOver: Bool {
        attempts.last?.pegs == masterCode.pegs
    }
    
    mutating func attemptGuess() -> Void {
        if guess.pegs == Array(repeating: Code.missingPeg, count: pegCount) {
            return
        }
        if attempts.contains(where: { $0.pegs == guess.pegs }) {
            return
        }
        var attempt = guess
        attempt.kind = .attempt(guess.match(against: masterCode))
        attempts.append(attempt)
        guess.reset()
        if isOver {
            masterCode.kind = .master(isHidden: false)
        }
    }
    
    mutating func setGuessPeg(_ peg: Peg, at index: Int) {
        guard guess.pegs.indices.contains(index) else {
            return
        }
        guess.pegs[index] = peg
    }
    
    mutating func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        if let indexOfExistingPegInPegChoices = pegChoices.firstIndex(of: existingPeg) {
            let newPegIndex = pegChoices[(indexOfExistingPegInPegChoices + 1) % pegChoices.count]
            guess.pegs[index] = newPegIndex
        } else {
            guess.pegs[index] = pegChoices.first ?? Code.missingPeg
        }
    }
    
}




