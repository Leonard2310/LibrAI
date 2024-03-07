//
//  ContentView.swift
//  GrapesProject
//
//  Created by Salvatore Cangiano on 06/03/24.
//

import SwiftUI

struct ContentView: View {
    
    //----View for loading screen of the app----
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
