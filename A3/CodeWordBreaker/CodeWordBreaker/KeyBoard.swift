//
//  CharChooser.swift
//  CodeWordBreaker
//
//  Created by Zeying Zhou on 2025-12-27.
//

import SwiftUI

private let keyboardFirstRow = "QWERTYUIOP"
private let keyboardSecondRow = "ASDFGHJKL"
private let keyboardThirdRow = "ZXCVBNM"

struct KeyBoard: View {
    
    //MARK: Data Out Function
    let onChoose: ((Char) -> Void)?
    let onBackspace: () -> Void
    let onRestart: () -> Void
    let onReturn: () -> Void    
//    init(onChoose: ((Char) -> Void)?, @ViewBuilder restartButton: () -> RestartButton) {
//        self.onChoose = onChoose
//        self.restartButton = restartButton()
//    }
    // MARK: - Body
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 5) {
                ForEach(Array(keyboardFirstRow), id: \.self) { character in
                    keyButton(for: character)
                }
            }
            .padding(.horizontal)
            HStack(spacing: 5) {
                ForEach(Array(keyboardSecondRow), id: \.self) { character in
                    keyButton(for: character)
                }
            }
            HStack(spacing: 5) {
                ForEach(Array(keyboardThirdRow), id: \.self) {
                    character in
                    keyButton(for: character)
                }
                backspaceButton
            }
            HStack {
                restartButton
                returnButton
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
    
    var restartButton: some View {
        Button(action: onRestart) {
                Text("Restart")
                Image(systemName: "arrow.circlepath")
        }
        .font(.system(size: 24, weight: .semibold, design: .rounded))
        .frame(width: 130, height: 40)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.systemGray5))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color(.systemGray4), lineWidth: 1)
        )
    }
    
    var returnButton: some View {
        Button(action: onReturn) {
                Text("Return")
                Image(systemName: "return")
        }
        .font(.system(size: 24, weight: .semibold, design: .rounded))
        .frame(width: 130, height: 40)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.systemGray5))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color(.systemGray4), lineWidth: 1)
        )
    }
    
    var backspaceButton: some View {
        Button(action: onBackspace) {
                Image(systemName: "delete.backward")
        }
        .font(.system(size: 24, weight: .semibold, design: .rounded))
        .frame(width: 50, height: 40)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.systemGray5))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color(.systemGray4), lineWidth: 1)
        )
        .buttonStyle(.plain)
    }
}


