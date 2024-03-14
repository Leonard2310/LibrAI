//
//  ContentView.swift
//  GrapesProject
//
//  Created by Salvatore Cangiano on 06/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var opacity: Double = 1
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1
    @State private var isLoaded = false

    var body: some View {
        VStack {
            Image("AppLogo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .opacity(opacity)
                .rotationEffect(.degrees(rotation))
                .scaleEffect(scale)
                .onAppear {
                    withAnimation(Animation
                        .easeInOut(duration: Double.random(in: 0.5...1))
                        .repeatForever(autoreverses: true)
                        .delay(Double.random(in: 0...2))
                    ) {
                        self.opacity = Double.random(in: 0.75...1.5)
                        self.rotation = Double.random(in: 0...360)
                        self.scale = CGFloat.random(in: 0.5...1.5)
                    }
                    // Simula il caricamento dell'app
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.isLoaded = true
                    }
                }
                .fullScreenCover(isPresented: $isLoaded, content: TabBar.init)
        }
    }
}


#Preview {
    ContentView()
}


