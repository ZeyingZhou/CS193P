//
//  MatchMarkers.swift
//  CodeBreaker
//
//  Created by Zeying Zhou on 2025-12-16.
//
import SwiftUI

struct MatchMarkers: View {
    var matches: [Match]
    var pegsSize: Int
    var body: some View {
        HStack {
           VStack{
               matchMarker(peg: 0)
               matchMarker(peg: 1)
           }
           VStack {
               matchMarker(peg: 2)
               matchMarker(peg: 3)
           }
        }
        
    }
    
    
    func matchMarker(peg: Int) -> some View {
        let exactCount: Int = matches.count { $0 == .exact}
        let foundCount: Int = matches.count { $0 != .nomatch}
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2).aspectRatio(1, contentMode: .fit)
    }

    
}


enum Match {
    case nomatch
    case exact
    case inexact
}

#Preview {
//    MatchMarkers(matches:[.exact, .inexact, .inexact, .nomatch, .nomatch])
//    VStack() {
//        MatchMarkersPreview(matches: [.exact, .inexact, .inexact, .nomatch, .nomatch])
//        MatchMarkersPreview(matches: [.exact, .exact, .exact,.inexact])
//        MatchMarkersPreview(matches: [.exact, .exact, .exact,.inexact])
//        MatchMarkersPreview(matches: [.exact, .exact, .exact,.inexact,.inexact,.inexact])
//    }.padding(20)
}
