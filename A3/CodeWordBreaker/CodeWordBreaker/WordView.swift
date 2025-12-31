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
    var body: some View {
        
        ForEach(codeWord.chars.indices, id: \.self) { index in
            CharView(char: codeWord.chars[index])
                .padding(Selection.border)
                .background {
                    if selection == index, codeWord.kind ==  .guess {
                        Selection.shape
                            .foregroundStyle(Selection.color)
                    }
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
    struct Selection {
        static let border: CGFloat = 5
        static let cornerRadius: CGFloat = 10
        static let color: Color = Color.gray(0.85)
        static let shape = RoundedRectangle(cornerRadius: cornerRadius)
    }
}

