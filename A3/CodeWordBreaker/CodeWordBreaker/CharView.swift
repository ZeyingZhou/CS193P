//
//  WordView.swift
//  CodeWordBreaker
//
//  Created by Zeying Zhou on 2025-12-28.
//

import SwiftUI

struct CharView: View {
    //MARK: Data In
    let char: Char
    
    //MARK: - Body
    
    let charShape = Circle()
    var body: some View {
        charShape
            .foregroundStyle(Color(.clear))
            .overlay {
                    Text(char)
                        .font(.system(size: 100))
                        .minimumScaleFactor(9/120)
                        .foregroundColor(.black)
            }
            .contentShape(Rectangle())
            .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    CharView(char: "A")
}
