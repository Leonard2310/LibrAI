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
    
    var body: some View {
        VStack {
                    Button("Tap to get your New Mouse!") {
                        if let randomMouse = myData.Mice1.randomElement() {
                            self.mouse = randomMouse
                        }
                    }
                    .padding()
                    
                    if let mouse = mouse {
                        ZStack {
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 215, height: 215)
                            Image(mouse.mouseImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .mask(Circle())
                                .frame(width: 200, height: 200)
                                .foregroundStyle(.blue.gradient.shadow(.inner(color: .white.opacity(0.3), radius: 3, x: 1, y: 1)))
                        }
                        Text("\(mouse.mouseName) ")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.orange)
                    } else {
                        Text("")
                        
                    }
                }
            }
}

#Preview {
    NewMouseView()
}
