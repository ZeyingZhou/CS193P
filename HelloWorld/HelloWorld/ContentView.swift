//
//  ContentView.swift
//  HelloWorld
//
//  Created by Zeying Zhou on 2025-11-29.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        HStack {
                Text("greeting").layoutPriority(100)
                Spacer()
                Image(systemName: "globe")
                Text("howdy")
                Circle()
        }
        Form {
            
        }
    }
   
    
}

#Preview {
    ContentView()
}
