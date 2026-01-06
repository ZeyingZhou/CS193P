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
    init(kind: Kind, chars: [Char] = [], word: String) {
        self.kind = kind
        self.chars = chars.isEmpty ? word.map { String($0) } : chars
    }
    enum Kind: Equatable {
        case master(isHidden: Bool)
        case guess
        case attempt([Match])
        case unknown
    }
    
    mutating func reset(to wordCount:Int) {
        self.chars = Array(repeating: Char.missing, count: wordCount)
    }
    
    var matches: [Match]? {
        switch kind {
        case .attempt(let matches): return matches
        default: return nil
        }
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

extension Char {
    static let missing = ""
}


