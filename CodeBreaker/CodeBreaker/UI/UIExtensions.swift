//
//  UIExtensions.swift
//  CodeBreaker
//
//  Created by Zeying Zhou on 2026-01-01.
//

import SwiftUI

//
//  File.swift
//  CodeBreaker
//
//  Created by Zeying Zhou on 2026-01-01.
//

extension Animation {
    static let codeBreaker = Animation.bouncy
    static let restart = codeBreaker
    static let guess = codeBreaker
    static let selection = codeBreaker
}

extension AnyTransition {
    static func attempt(_ isOver: Bool) -> AnyTransition {
        AnyTransition.asymmetric(insertion:  isOver ? .opacity : .move(edge: .top), removal: .move(edge: .trailing))
    }
    static let pegChooser = AnyTransition.offset(x: 0, y:200)
}

extension View {
    func flexibleSystemFont(minimum: CGFloat = 8, maximum: CGFloat = 80) -> some View {
        self
            .font(.system(size: maximum))
            .minimumScaleFactor(minimum/maximum)
    }
}

extension Color {
    static func gray(_ brightness: CGFloat) -> Color {
        return Color(hue: 148/360, saturation: 0, brightness: brightness)
    }
 }

