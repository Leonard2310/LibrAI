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
    
    @State private var currentSentence = 0
    
    
    var Booktest : book
    
    var audioPrompt : String = "The morning had dawned clear and cold, with a crispness that hinted at the end of summer. They set forth at daybreak to see a man beheaded, twenty in all, and Bran rode among them, nervous with excitement. This was the first time he had been deemed old enough to go with his lord father and his brothers to see the king’s justice done. It was the ninth year of summer, and the seventh of Bran’s life.The man had been taken outside a small holdfast in the hills. Robb thought he was a wildling, his sword sworn to Mance Rayder, the King-beyond-the-Wall. It made Bran’s skin prickle to think of it. He remembered the hearth tales Old Nan told them. The wildlings were cruel men, she said, slavers and slayers and thieves. They consorted with giants and ghouls, stole girl children in the dead of night, and drank blood from polished horns. \nAnd their women lay with the Others in the Long Night to sire terrible half-human children. But the man they found bound hand and foot to the holdfast wall awaiting the king’s justice was old and scrawny, not much taller than Robb. He had lost both ears and a finger to frostbite, and he dressed all in black, the same as a brother of the Night’s Watch, except that his furs were ragged and greasy. The breath of man and horse mingled, steaming, in the cold morning air as his lord father had the man cut down from the wall and dragged before them. Robb and Jon sat tall and still on their horses, with Bran between them on his pony, trying to seem older than seven, trying to pretend that he’d seen all this before. A faint wind blew through the holdfast gate. Over their heads flapped the banner of the Starks of Winterfell: a grey direwolf racing across an ice-white field. “Bran’s father sat solemnly on his horse, long brown hair stirring in the wind. His closely trimmed beard was shot with white, making him look older than his thirty-five years. He had a grim cast to his grey eyes this day, and he seemed not at all the man who would sit before the fire in the evening and talk softly of the age of heroes and the children of the forest. He had taken off Father’s face, Bran thought, and donned the face of Lord Stark of Winterfell. There were questions asked and answers given there in the chill of morning, but afterward Bran could not recall much of what had been said. Finally his lord “father gave a command, and two of his guardsmen dragged the ragged man to the ironwood stump in the center of the square. They forced his head down onto the hard black wood. Lord Eddard Stark dismounted and his ward Theon Greyjoy brought forth the sword. “Ice,” that sword was called. It was as wide across as a man’s hand, and taller even than Robb. The blade was Valyrian steel, spell-forged and dark as smoke. Nothing held an edge like Valyrian steel. His father peeled off his gloves and handed them to Jory Cassel, the captain of his household guard. He took hold of Ice with both hands and said, “In the name of Robert of the House Baratheon, the First of his Name, King of the Andals and the Rhoynar and the First Men, Lord of the Seven Kingdoms and Protector of the Realm, by the word of Eddard of the House Stark, Lord of Winterfell and Warden of the North, I do sentence you to die.” He lifted the greatsword high above his head. Bran’s bastard brother Jon Snow moved closer. “Keep the pony well in hand,” he whispered. “And don’t look away. Father will know if you do. Bran kept his pony well in hand, and did not look away.His father took off the man’s head with a single sure stroke. Blood sprayed out across the snow, as red as summerwine. One of the horses reared and had to be restrained to keep from bolting. Bran could not take his eyes off the blood. The snows around the stump drank it eagerly, reddening as he watched. The head bounced off a thick root and rolled. It came up near Greyjoy’s feet. Theon was a lean, dark”"
    
    var sentences: [String] {
        audioPrompt.components(separatedBy: ". ")
    }
    
    var body: some View {
        ZStack {
            Image(Booktest.lastBackground)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                ZStack (alignment: .top){
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.readingRectangle)
                        .frame(width: 337.0, height: RectReadingHeight)
                        .overlay(
                            ScrollView {
                                VStack(alignment: .leading) {
                                    ForEach(0..<sentences.count, id: \.self) { index in
                                        Text(sentences[index])
                                            .fontWeight(currentSentence == index ? .bold : .regular)
                                            .foregroundColor(.white)
                                            .padding(.bottom, 5)
                                    }
                                }
                                .padding()
                            }
                        )
                    
                    Rectangle()
                        .fill(Color.white) // Customize the color as needed
                        .frame(width: 40, height: 6) // Adjust the size
                        .cornerRadius(3) // Rounded corners
                        .offset(y: 6) // Position the grabber
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
                    
                    HStack(spacing: 40) {
                        Button("", systemImage: "square.and.arrow.up")  {
                            
                        }
                        .frame(width: 25.0, height: 25.0)
                        .foregroundColor(.white)
                        
                        HStack(spacing: 25){
                            
                            Button("", systemImage: "backward.fill")  {
                                
                            }
                            .frame(width: 25.0, height: 25.0)
                            .foregroundColor(.white)
                            
                            Button(action: {
                                if isPlaying {
                                    audioPlayer.pause()
                                } else {
                                    if audioPlayer.currentTime == 0 {
                                        Task {
                                            for sentence in sentences {
                                                if !isPlaying { break } // Aggiunto un controllo per interrompere la riproduzione quando si preme il pulsante di pausa
                                                await AudioGeneration(textInput: sentence) { path in
                                                    do {
                                                        if let path {
                                                            let path_clean = stringURLcleaning(path_string: path)
                                                            self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path_clean!))
                                                        }
                                                    } catch {
                                                        print(error.localizedDescription)
                                                    }
                                                    audioPlayer.play()
                                                    while audioPlayer.isPlaying {
                                                        // Aspetta che l'audio finisca di riprodurre
                                                    }
                                                    currentSentence += 1
                                                }
                                            }
                                        }
                                    } else {
                                        audioPlayer.play()
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
                        .frame(width: 25.0, height: 25.0)
                        .foregroundColor(.white)
                    }
                    .padding(.bottom)
                    ProgressView(value: Double(currentSentence) / Double(sentences.count))
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
