//
//  CharChooser.swift
//  CodeWordBreaker
//
//  Created by Zeying Zhou on 2025-12-27.
//

import SwiftUI

struct KeyBoard: View {
    
    
    static let firstRow = "QWERTYUIOP"
    static let secondRow = "ASDFGHJKL"
    static let thirdRow = "ZXCVBNM"
    
    //MARK: Data Out Function
    let onChoose: ((Char) -> Void)?
    // MARK: - Body
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 6) {
                ForEach(Array(KeyBoard.firstRow), id: \.self) { character in
                    keyButton(for: character)
                }
            }
            HStack(spacing: 6) {
                ForEach(Array(KeyBoard.secondRow), id: \.self) { character in
                    keyButton(for: character)
                }
            }
            HStack(spacing: 6) {
                ForEach(Array(KeyBoard.thirdRow), id: \.self) {
                    character in
                    keyButton(for: character)
                }
            }
        }
    }
    
    private func keyButton(for character: Character) -> some View {
        Button {
            onChoose?(String(character))
        } label: {
            Text(String(character))
                .font(.system(size: 24, weight: .semibold, design: .rounded))
                .foregroundStyle(.primary)
                .frame(width: 35, height: 50)  
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.systemGray5))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color(.systemGray4), lineWidth: 1)
                )
        }
        .buttonStyle(.plain)
    }
}


