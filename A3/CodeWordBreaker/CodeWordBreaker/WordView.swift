//
//  CodeView.swift
//  CodeWordBreaker
//
//  Created by Zeying Zhou on 2025-12-28.
//

import SwiftUI

struct WordView: View {
    let codeWord: CodeWord
    @Binding var selection: Int
    var matches: [Match]?
    //MARK: Data Owned by Me
    @Namespace private var selectionNamespace
    init(codeWord: CodeWord, selection: Binding<Int> = Binding<Int>.constant(-1), matches: [Match]? = nil) {
        self.codeWord = codeWord
        self._selection = selection
        self.matches = matches
    }
    var body: some View {
        HStack {
            ForEach(codeWord.chars.indices, id: \.self) { index in
                CharView(char: codeWord.chars[index])
                    .padding(Selection.border)
                    .background {
                        if let matches = matches {
                            switch matches[index] {
                                case .exact: Color.green
                                case .inexact: Color.yellow
                                case .nomatch: Color.red
                            }
                        }
                        Group {
                            if selection == index, codeWord.kind ==  .guess {
                                Selection.shape
                                    .foregroundStyle(Selection.color)
                                    .matchedGeometryEffect(id: "selection", in: selectionNamespace)
                            }
                        }.animation(.selection, value: selection)
                    }
                    .overlay {
                        Selection.shape.foregroundStyle(codeWord.isHidden ? Color.gray: .clear)
                    }
                    .onTapGesture {
                        if codeWord.kind == .guess {
                            selection = index
                        }
                    }
                    
            }
        }
    }
}

fileprivate struct Selection {
    static let border: CGFloat = 5
    static let cornerRadius: CGFloat = 10
    static let color: Color = Color.gray(0.85)
    static let shape = RoundedRectangle(cornerRadius: cornerRadius)
}

