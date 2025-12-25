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
        self.masterCode = Code(kind: .master, pegs: Array(repeating: Code.missing, count: pegCount))
        self.guess = Code(kind: .guess, pegs: Array(repeating: Code.missing, count: pegCount))
        masterCode.randomize(from: pegChoices)
        print(masterCode)
    }
    
    mutating func attemptGuess() -> Void {
        if guess.pegs == Array(repeating: Code.missing, count: pegCount) {
            return
        }
        if attempts.contains(where: { $0.pegs == guess.pegs }) {
            return
        }
        var attempt = guess
        attempt.kind = .attempt(guess.match(against: masterCode))
        attempts.append(attempt)
    }
    
    mutating func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        if let indexOfExistingPegInPegChoices = pegChoices.firstIndex(of: existingPeg) {
            let newPegIndex = pegChoices[(indexOfExistingPegInPegChoices + 1) % pegChoices.count]
            guess.pegs[index] = newPegIndex
        } else {
            guess.pegs[index] = pegChoices.first ?? Code.missing
        }
    }
    
}

struct Code {
    var kind: Kind
    var pegs: [Peg]
    
    
    static let missing: Peg = "clear"
    
    init(kind: Kind, pegs: [Peg] = []) {
        self.kind = kind
        self.pegs = pegs
    }
    
    mutating func randomize(from pegChoices: [Peg]) {
        for index in pegs.indices {
            pegs[index] = pegChoices.randomElement() ?? Code.missing
        }
    }
    
    enum Kind: Equatable {
        case master
        case guess
        case attempt([Match])
        case unknown
    }
    
    var matches: [Match] {
        switch kind {
        case .attempt(let matches): return matches
        default: return []
        }
    }
    
    func match(against otherCode: Code) -> [Match] {
        var results: [Match] = Array(repeating: .nomatch, count: pegs.count)
        var pegsToMatch = otherCode.pegs
        for index in pegs.indices.reversed() {
            if pegsToMatch.count > index, pegsToMatch[index] == pegs[index] {
                results[index] = .exact
                pegsToMatch.remove(at: index)
            }
        }
        for index in pegs.indices {
            if results[index] != .exact {
                if let matchIndex = pegsToMatch.firstIndex(of: pegs[index]) {
                    results[index] = .inexact
                    pegsToMatch.remove(at: matchIndex)
                }
            }
        }
        return results
    }
}


