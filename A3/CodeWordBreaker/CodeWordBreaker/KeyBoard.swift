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
        VStack {
            HStack {
                ForEach(Array(KeyBoard.firstRow), id: \.self) { character in
                    Button {
                        
                    } label: {
                        Text(String(character)).foregroundColor(.black).font(Font.system(size: 50)).aspectRatio(1, contentMode: .fit)
                    }
                }
            }
            HStack {
                ForEach(Array(KeyBoard.secondRow), id: \.self) { character in
                    Button {
                        
                    } label: {
                        Text(String(character)).foregroundColor(.black).font(Font.system(size: 50)).aspectRatio(1, contentMode: .fit)
                    }
                    
                }
            }
            HStack {
                ForEach(Array(KeyBoard.thirdRow), id: \.self) {
                    character in
                        Button {
                            
                        } label: {
                            Text(String(character)).foregroundColor(.black).font(Font.system(size: 50)).aspectRatio(1, contentMode: .fit)
                        }
                }
            }
        }
    }
}


