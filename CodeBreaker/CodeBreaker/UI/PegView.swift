//
//  PegView.swift
//  CodeBreaker
//
//  Created by Zeying Zhou on 2025-12-27.
//

import SwiftUI

struct PegView: View {
    // MARK: Data In
    let peg: Peg
    
    //MARK: - Body
    
    let pegShape = Circle()
    var body: some View {
        pegShape
            .overlay {
                if peg == Code.missingPeg {
                    Circle()
                        .strokeBorder(Color.gray)
                }
            }
            .foregroundStyle(Color(name: peg) ?? .white)
            .overlay {
                if Color(name: peg) == nil {
                    // Not a color name, so display as text (emoji)
                    Text(peg)
                        .font(.system(size: 120))
                        .minimumScaleFactor(9/120)
                }
            }
            .contentShape(Rectangle())
            .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    PegView(peg: "😭")
}
