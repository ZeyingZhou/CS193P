//
//  MatchMarkersPreview.swift
//  CodeBreaker
//
//  Created by Zeying Zhou on 2025-12-16.
//

import SwiftUI

struct MatchMarkersPreview: View {
    var matches: [Match]
    
    var body: some View {
        HStack {
            ForEach(matches.indices, id: \.self) {
                index in Circle()
            }
            MatchMarkers(matches: self.matches)
        }
      
    }
}
