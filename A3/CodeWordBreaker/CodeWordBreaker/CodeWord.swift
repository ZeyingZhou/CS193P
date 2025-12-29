//
//  CodeWord.swift
//  CodeWordBreaker
//
//  Created by Zeying Zhou on 2025-12-27.
//

import Foundation

struct CodeWord {
    var kind: Kind
    var chars: [Char];
    
    static let missingChar: Char = ""
    var isHidden: Bool {
        switch kind {
        case .master(let isHidden): return isHidden
        default: return false
        }
    }
    var word: String
    {
        get {chars.joined()}
        set {chars = newValue.map {String($0)}}
    }
    init(kind: Kind, word: String) {
        self.kind = kind
        self.chars = ["","","",""]
        self.word = word
    }
    enum Kind: Equatable {
        case master(isHidden: Bool)
        case guess
        case attempt([Match])
        case unknown
    }
    
    mutating func reset() {
        self.chars = Array(repeating: CodeWord.missingChar, count: chars.count)
    }
    
    func match(against otherWord: CodeWord) -> [Match] {
        var charsToMatch = otherWord.chars
        
        let backwardsExactMatches = chars.indices.reversed().map { index in
            if charsToMatch.count > index, charsToMatch[index] == chars[index] {
                charsToMatch.remove(at: index)
                return Match.exact
            } else {
                return .nomatch
            }
        }
        
        let exactMatches = Array(backwardsExactMatches.reversed())
        
        
        return chars.indices.map { index in
            if exactMatches[index] != .exact, let matchIndex = charsToMatch.firstIndex(of: chars[index]) {
                charsToMatch.remove(at: matchIndex)
                return .inexact
            } else {
                return exactMatches[index]
            }
        }
    }
}


