import SwiftUI
import AVKit
import Foundation
import OpenAI
import SwiftOpenAI

struct AITryView: View {
    @State private var audioPrompt: String = "The morning had dawned clear and cold, with a crispness that hinted at the end of summer.\nThey set forth at daybreak to see a man beheaded, twenty in all, and Bran rode among them, nervous with excitement.\nThis was the first time he had been deemed old enough to go with his lord father and his brothers to see the king’s justice done."
    @State private var imagePrompt: String = "Rappresentami questa situazione senza scritte: The morning had dawned clear and cold, with a crispness that hinted at the end of summer.\nThey set forth at daybreak to see a man beheaded, twenty in all, and Bran rode among them, nervous with excitement.\nThis was the first time he had been deemed old enough to go with his lord father and his brothers to see the king’s justice done."
    
    @State private var imageURL: URL?
    @State private var audioURL: URL?
    @State private var audioPlayer: AVPlayer?
    
    var body: some View {
        VStack(spacing: 20) {
            if let imageURL = imageURL {
                setBackground(imagePath: imageURL.path)
            }
            
            Button("Image Generation") {
                Task {
                    await ImageGeneration(textPrompt: imagePrompt) { url in
                        if let urlString = url, let url = URL(string: urlString) {
                            self.imageURL = url
                        }
                    }
                }
            }
            
            if audioURL != nil {
                Button("Play Audio") {
                    audioPlayer?.play()
                }
            }
            
            Button("Audio Generation") {
                Task {
                    await AudioGeneration(textInput: audioPrompt) { path in
                        if let path = path {
                            playSound(path: path)
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    AITryView()
}

