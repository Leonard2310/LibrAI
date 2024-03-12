//
//  NewMouseView.swift
//  GrapesProject
//
//  Created by Chiara Cortese on 12/03/24.
//

import SwiftUI

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
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(gradient: Gradient(colors: [.orange, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        )
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 2)
                        )
                }
                .padding()
                
                if let mouse = mouse {
                    ZStack {
                        Circle()
                            .fill(RadialGradient(gradient: Gradient(colors: [Color.orange, Color.purple]), center: .center, startRadius: 10, endRadius: 300))
                            .frame(width: 215, height: 215)
                        NavigationLink (destination: CollectablesView()) {
                            Image(mouse.mouseImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .mask(Circle())
                                .frame(width: 200, height: 200)
                                .foregroundStyle(.orange.gradient.shadow(.inner(color: .white.opacity(0.3), radius: 3, x: 1, y: 1)))
                                .scaleEffect(youWin ? 1.5 : 1.0)
                                .rotationEffect(.degrees(youWin ? 360 : 0))
                                .opacity(youWin ? 0.0 : 1.0)
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
                        .font(.headline)
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
