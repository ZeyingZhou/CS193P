//
//  CodeView.swift
//  CodeBreaker
//
//  Created by Zeying Zhou on 2025-12-27.
//

import SwiftUI

struct CodeView: View {
    
    //MARK: Data In
    let code: Code
    
    //MARK: Data Owned by Me
    @Binding var selection: Int
    
    //MARK: - Body
    var body: some View {
        ForEach(code.pegs.indices, id: \.self) { index in
            let peg = code.pegs[index]
            PegView(peg: peg)
                .padding(Selection.border)
                .background {
                    if selection == index, code.kind ==  .guess {
                        Selection.shape
                            .foregroundStyle(Selection.color)
                    }
                }
                .overlay {
                    Selection.shape.foregroundStyle(code.isHidden ? Color.gray: .clear)
                }
                .onTapGesture {
                    if code.kind == .guess {
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

#Preview {
}
