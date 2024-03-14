//
//  ReadingView.swift
//  GrapesProject
//
//  Created by Leonardo Catello on 11/03/24.
//

import SwiftUI
import AVFAudio

struct ImmersiveReadingView: View {
    @State private var showingSheet = false
    @State private var RectReadingHeight: CGFloat = 263.0
    @State private var isDragging = false
    @State private var isPlaying = false
    @State private var audioPlayer: AVAudioPlayer!
    
    @Environment(\.dismiss) var dismiss
    
    var Booktest : book
    
    var audioPrompt : String = "The morning had dawned clear and cold, with a crispness that hinted at the end of summer.\nThey set forth at daybreak to see a man beheaded, twenty in all, and Bran rode among them, nervous with excitement.\nThis was the first time he had been deemed old enough to go with his lord father and his brothers to see the king’s justice done."
    
    
    var body: some View {
        ZStack{
            Image(Booktest.lastBackground)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                
                ZStack (alignment: .top){
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.readingRectangle)
                        .frame(width: 337.0
                               , height: RectReadingHeight)
                        .overlay(
                            
                            ScrollViewReader(content: { proxy in
                                Text(audioPrompt)
                                    .foregroundColor(.white)
                                    .padding()
                                    .lineLimit(nil)
                            })
                            
                            
                            
                        )
                    
                    
                    
                    Rectangle()
                        .fill(Color.white) // Customize the color as needed
                        .frame(width: 40, height: 6) // Adjust the size
                        .cornerRadius(3) // Rounded corners
                        .offset(y: 10) // Position the grabber
                        .gesture(
                            TapGesture(count: 1)
                                .onEnded { _ in
                                    withAnimation(.interpolatingSpring(stiffness: 50, damping: 2000)) {
                                        if RectReadingHeight == 263 {
                                            RectReadingHeight = 619
                                            isDragging = true
                                        } else if RectReadingHeight == 619 {
                                            RectReadingHeight = 0
                                            isDragging = true
                                        } else if RectReadingHeight == 0 {
                                            RectReadingHeight = 263
                                            isDragging = true
                                        } else {
                                            isDragging = false
                                        }
                                    }
                                }
                        )
                }
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.readingRectangle)
                        .frame(width: 337.0, height: 65.0)
                    
                    HStack{
                        Button("", systemImage: "square.and.arrow.up")  {
                            
                        }
                        .frame(width: 25.0, height: 25.0)
                        .foregroundColor(.white)
                        .padding(.trailing, 15.0)
                        
                        
                        HStack {
                            
                            Button("", systemImage: "backward.fill")  {
                                
                            }
                            .frame(width: 25.0, height: 25.0)
                            .foregroundColor(.white)
                            
                            Button(action: {
                                if isPlaying {
                                    audioPlayer.pause()
                                } else {
                                    Task {
                                        await AudioGeneration(textInput: audioPrompt) { path in
                                            do {
                                                if let path {
                                                    let path_clean = stringURLcleaning(path_string: path)
                                                    self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path_clean!))
                                                }
                                            } catch {
                                                print(error.localizedDescription)
                                            }
                                            audioPlayer.play()
                                        }
                                    }
                                }
                                isPlaying.toggle()
                            }) {
                                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
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
                    .padding(.leading, -10)
                    ProgressView(value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
                    //.padding(.leading)
                        .padding(.top, 40)
                        .frame(width: 270.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: .white))
                }
                .padding(.top)
            }
            Button("", systemImage: "xmark"){
                dismiss()
            }
            .foregroundColor(.white)
            .padding(.bottom, 700)
            .padding(.leading, 350)
            .frame(width: 500, height: 300)
        }
        .onAppear(perform: {
            let sound = Bundle.main.path(forResource: "speech", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        })
    }
}

#Preview {
    ImmersiveReadingView(Booktest: book(title: "A Game of Thrones", lastBackground: "GoT_Background"))
    
}
