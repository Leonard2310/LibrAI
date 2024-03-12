import SwiftUI
import AVKit
import Foundation
import OpenAI
import SwiftOpenAI

struct AITryView: View {
    @State private var imagePrompt: String = "Un paesaggio futuristico"
    @State private var audioPrompt: String = "Ciao, benvenuto nel futuro!"
    @State private var imageURL: URL?
    @State private var audioURL: URL?
    @State private var audioPlayer: AVPlayer?

    var body: some View {
        VStack(spacing: 20) {
            if let imageURL = imageURL {
                AsyncImage(url: imageURL) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 300, height: 200)
                .cornerRadius(10)
            }

            Button("Genera Immagine") {
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

            Button("Genera Audio") {
                Task {
                    await AudioGeneration(textInput: audioPrompt) { path in
                        if let path = path, let url = URL(string: path) {
                            self.audioURL = url
                            self.audioPlayer = AVPlayer(url: url)
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

