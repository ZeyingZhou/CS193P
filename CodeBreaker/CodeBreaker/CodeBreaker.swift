//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by Zeying Zhou on 2025-12-21.
//

import SwiftUI

typealias Peg = Color

struct CodeBreaker {
    var masterCode: Code = Code(kind: .master)
    var guess: Code = Code(kind: .guess)
    var attempts: [Code] = []
    let pegChoices: [Peg] = [.red, .green, .blue, .yellow]
    init() {
        
    }
    
    func changeGuessPeg(at index: Int) {
        
    }
}

struct Code {
    var kind: Kind
    var pegs: [Peg] = [.green, .blue, .red, .yellow]
    
    enum Kind {
        case master
        case guess
        case attempt
        case unknown
    }
}


