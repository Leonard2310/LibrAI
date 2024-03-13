//
//  NewMouseView.swift
//  GrapesProject
//
//  Created by Chiara Cortese on 12/03/24.
//

import SwiftUI

struct ConfettiParticle: View {
    @State private var xOffset: CGFloat = CGFloat.random(in: -200...200)
    @State private var yOffset: CGFloat = CGFloat.random(in: -200...200)
    @State private var opacity: Double = Double.random(in: 0.5...1)
    @State private var rotation: Double = Double.random(in: 0...360)
    @State private var scale: CGFloat = CGFloat.random(in: 0.5...1.5)
    
    private let colors = [Color.red, Color.gray, Color.yellow, Color.orange]
    
    var body: some View {
        Circle()
            .fill(colors.randomElement()!)
            .frame(width: 10, height: 10)
            .offset(x: xOffset, y: yOffset)
            .opacity(opacity)
            .rotationEffect(.degrees(rotation))
            .scaleEffect(scale)
            .onAppear {
                withAnimation(Animation
                                .easeInOut(duration: Double.random(in: 1...3))
                                .repeatForever(autoreverses: true)
                                .delay(Double.random(in: 0...2))
                ) {
                    self.opacity = Double.random(in: 0.5...1)
                    self.rotation = Double.random(in: 0...360)
                    self.scale = CGFloat.random(in: 0.5...1.5)
                }
            }
    }
}

struct ConfettiView: View {
    var body: some View {
        ZStack {
            ForEach(0..<100) { _ in
                ConfettiParticle()
            }
        }
    }
}

struct NewMouseView: View {
    
    var myData = sharedData
    @State private var mouse: mouse?
    @State private var youWin = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button(action: {
                    if let randomMouse = myData.Mice1.randomElement() {
                        withAnimation(.interpolatingSpring(stiffness: 150, damping: 10)) {
                            self.mouse = randomMouse
                            self.youWin = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation {
                                self.youWin = false
                            }
                        }
                    }
                }) {
                    Text("New Mouse Unlocked 🔓")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.orange)
                        )
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 2)
                        )
                }
                .padding(.top, 60.0)
                
                if let mouse = mouse {
                    ZStack {
                        ConfettiView()
                        Circle()
                            .fill(RadialGradient(gradient: Gradient(colors: [Color.orange, Color.white]), center: .center, startRadius: 5, endRadius: 600))
                                .frame(width: 305, height: 305)
                                .scaleEffect(youWin ? 0.5 : 1.0)
                                .padding(.top, 70.0)
                        NavigationLink (destination: CollectablesView()) {
                            Image(mouse.mouseImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .mask(Circle())
                                .frame(width: 285, height: 285)
                                .foregroundStyle(.orange.gradient.shadow(.inner(color: .white.opacity(0.3), radius: 3, x: 1, y: 1)))
                                .scaleEffect(youWin ? 0.5 : 1.0)
                                .rotationEffect(.degrees(youWin ? 360 : 0))
                                .opacity(youWin ? 0.0 : 1.0)
                                .padding(.top, 70.0)
                        }
                        
                    }
                    HStack {
                        Image("star")
                            .scaleEffect(youWin ? 1.5 : 1.0)
                            .rotationEffect(.degrees(youWin ? 360 : 0))
                            .opacity(youWin ? 0.0 : 1.0)
                        Image("star")
                            .scaleEffect(youWin ? 1.5 : 1.0)
                            .rotationEffect(.degrees(youWin ? 360 : 0))
                            .opacity(youWin ? 0.0 : 1.0)
                        Image("star")
                            .scaleEffect(youWin ? 1.5 : 1.0)
                            .rotationEffect(.degrees(youWin ? 360 : 0))
                            .opacity(youWin ? 0.0 : 1.0)
                    }
                    Text("\(mouse.mouseName) ")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("AccentColor"))
                        .scaleEffect(youWin ? 1.5 : 1.0)
                        .opacity(youWin ? 0.0 : 1.0)
                    
                }
                else {
                    Text("")
                }
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.orange]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    NewMouseView()
}
