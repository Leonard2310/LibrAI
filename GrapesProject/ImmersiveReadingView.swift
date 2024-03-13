//
//  ReadingView.swift
//  GrapesProject
//
//  Created by Leonardo Catello on 11/03/24.
//

import SwiftUI

struct ImmersiveReadingView: View {
    @State private var showingSheet = false
    @State private var RectReadingHeigh: CGFloat = 263.0
    //@GestureState private var dragOffset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        ZStack{
            Image("GoT_Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.readingRectangle)
                        .frame(width: 337.0
                               , height: RectReadingHeigh)
                        .overlay(
                            
                            ScrollViewReader(content: { proxy in
                                Text("The morning had dawned clear and cold, with a crispness that hinted at the end of summer.\nThey set forth at daybreak to see a man beheaded, twenty in all, and Bran rode among them, nervous with excitement.\nThis was the first time he had been deemed old enough to go with his lord father and his brothers to see the king’s justice done.")
                                    .foregroundColor(.white)
                                    .padding()
                                    .lineLimit(nil)
                            })
                            
                            
                            
                        )
                    
                    
                    
                    Rectangle()
                        .fill(Color.white) // Customize the color as needed
                        .frame(width: 40, height: 6) // Adjust the size
                        .cornerRadius(3) // Rounded corners
                        .offset(y: -120) // Position the grabber
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation {
                                if value.translation.height < -50 {
                                    // Dragging up
                                    RectReadingHeigh = 619
                                    isDragging = true
                                } else if value.translation.height > 50 {
                                    // Dragging down
                                    RectReadingHeigh = 0
                                    isDragging = true
                                } else {
                                    isDragging = false
                                }
                            }
                        }
                )
                
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.readingRectangle)
                        .frame(width: 337.0, height: 65.0)
                    
                    HStack{
                        Button("", systemImage: "square.and.arrow.up")  {
                            
                        }
                        .frame(width: 25.0, height: 25.0)
                        .foregroundColor(.white)
                        .padding(.trailing, 30.0)
                        
                        
                        HStack {
                            
                            Button("", systemImage: "backward.fill")  {
                                
                            }
                            .frame(width: 25.0, height: 25.0)
                            .foregroundColor(.white)
                            
                            Button("", systemImage: "play.fill")  {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                            }
                            .frame(width: 40.0, height: 40.0)
                            .foregroundColor(.white)
                            
                            Button("", systemImage: "forward.fill")  {
                                
                            }
                            .frame(width: 25.0, height: 25.0)
                            .foregroundColor(.white)
                        }
                        
                        Button("", systemImage: "airplayaudio")  {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .padding(.leading, 30.0)
                        .frame(width: 25.0, height: 25.0)
                        .foregroundColor(.white)
                    }
                    .padding(.bottom)
                    ProgressView(value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
                        .padding(.leading)
                        .padding(.top, 40)
                        .frame(width: 270.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: .white))
                }
                .padding(.top)
                
                
            }
        }
    }
}

#Preview {
    ImmersiveReadingView()
}
