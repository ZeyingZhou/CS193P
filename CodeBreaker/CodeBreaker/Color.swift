//
//  Color.swift
//  CodeBreaker
//
//  Created by Zeying Zhou on 2025-12-27.
//

import SwiftUI

extension Color {
    // Failable initializer - returns nil if the color name is not recognized
    init?(name: String) {
        switch name.lowercased() {
        // Primary colors
        case "red":
            self = .red
        case "blue":
            self = .blue
        case "green":
            self = .green
        case "yellow":
            self = .yellow
        case "orange":
            self = .orange
        case "purple":
            self = .purple
        case "pink":
            self = .pink
            
        // Grayscale
        case "white":
            self = .white
        case "black":
            self = .black
        case "gray", "grey":
            self = .gray
        case "clear":
            self = .clear
            
        // System colors
        case "primary":
            self = .primary
        case "secondary":
            self = .secondary
            
        // Additional colors
        case "cyan":
            self = .cyan
        case "mint":
            self = .mint
        case "indigo":
            self = .indigo
        case "teal":
            self = .teal
        case "brown":
            self = .brown
            
        default:
            return nil // Returns nil for unrecognized color names
        }
    }
    
    // Computed property to get the name back from a Color
    var name: String? {
        switch self {
        case .red: return "red"
        case .blue: return "blue"
        case .green: return "green"
        case .yellow: return "yellow"
        case .orange: return "orange"
        case .purple: return "purple"
        case .pink: return "pink"
        case .white: return "white"
        case .black: return "black"
        case .gray: return "gray"
        case .clear: return "clear"
        case .primary: return "primary"
        case .secondary: return "secondary"
        case .cyan: return "cyan"
        case .mint: return "mint"
        case .indigo: return "indigo"
        case .teal: return "teal"
        case .brown: return "brown"
        default: return nil
        }
    }
}
