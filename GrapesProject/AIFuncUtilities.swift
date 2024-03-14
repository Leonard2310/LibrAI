//
//  AIFuncUtilities.swift
//  GrapesProject
//
//  Created by Leonardo Catello on 12/03/24.
//

import Foundation
import OpenAI
import SwiftOpenAI
import AVFoundation
import SwiftUI

// Define a struct to handle configuration settings.
struct Config {
    // Static variable to access the OpenAI API key.
    static var openAIKey: String {
        get {
            // Attempt to find the path of 'Config.plist' in the main bundle.
            guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist") else {
                // If the file is not found, crash with an error message.
                fatalError("Couldn't find file 'Info.plist'.")
            }
            
            // Load the contents of the plist file into an NSDictionary.
            let plist = NSDictionary(contentsOfFile: filePath)
            
            // Attempt to retrieve the value for the 'OpenAI_API_Key' from the plist.
            guard let value = plist?.object(forKey: "OpenAI_API_Key") as? String else {
                // If the key is not found in the plist, crash with an error message.
                fatalError("Couldn't find key 'OpenAI_API_Key' in 'Config.plist'.")
            }
            
            // Return the API key.
            return value
        }
    }
}

// Initialize an instance of SwiftOpenAI with the API key retrieved from Config.
var openAI = SwiftOpenAI(apiKey: Config.openAIKey)


func ImageGeneration(textPrompt: String, completion: @escaping (String?) -> Void) async {
    do {
        // Attempt to create an image using the OpenAI's DALL-E 3 model.
        let image = try await openAI.createImages(
            model: .dalle(.dalle3), // Specify the DALL-E 3 model.
            prompt: textPrompt, // Use the provided prompt to guide image generation.
            numberOfImages: 1, // Request a single image.
            size: .s1024 // Specify the size of the generated image.
        )
        
        // Print the resulting image.
        print(image!)
    } catch {
        // Handle any errors that occur during image creation.
        print("Error: \(error)")
    }
}

func AudioGeneration(textInput: String, completion: @escaping (String?) -> Void) async {
    do {
        // Define the input text that will be converted to speech.
        let input = textInput
        
        // Generate audio from the input text using OpenAI's text-to-speech API.
        let data = try await openAI.createSpeech(
            model: .tts(.tts1), // Specify the text-to-speech model, here tts1.
            input: input, // Provide the input text.
            voice: .onyx, // Choose the voice type, here 'alloy'.
            responseFormat: .mp3, // Set the audio response format as MP3.
            speed: 1.0 // Set the speed of the speech. 1.0 is normal speed.
        )
        
        // Retrieve the file path in the document directory to save the audio file.
        if let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("speech.mp3") {
            do {
                // Save the generated audio data to the specified file path.
                try data!.write(to: filePath)
                // Confirm saving of the audio file with a print statement.
                print("Audio file saved: \(filePath)")
                completion(filePath.absoluteString)
            } catch {
                // Handle any errors encountered while writing the audio file.
                print("Error saving Audio file: \(error)")
            }
        }
    } catch {
        // Handle any errors encountered during the audio creation process.
        print(error)
    }
}

var player: AVAudioPlayer?

//func playSound(path: String) {
//    let url = URL(fileURLWithPath: path)
//
//    do {
//        print("PATH")
//        print(path)
//        print("PATH")
//        print(url)
//        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//        try AVAudioSession.sharedInstance().setActive(true)
//
//        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//
//
//
//        guard let player = player else { return }
//
//        player.play()
//
//    } catch let error {
//        print(error.localizedDescription)
//        do {
//
//                let isReachable = try url.checkResourceIsReachable()
//                // ... you can set breaking points after that line, and if you stopped at them it means file exist.
//            } catch let e {
//                print("couldnt load file \(e.localizedDescription)")
//            }
//    }
//}








final class AudioManager {
    static let shared = AudioManager()
    
     var player: AVPlayer?
    
     var session = AVAudioSession.sharedInstance()
    
     init() {}
    
     func activateSession() {
        do {
            try session.setCategory(
                .playback,
                mode: .default,
                options: []
            )
        } catch _ {}
        
        do {
            try session.setActive(true, options: .notifyOthersOnDeactivation)
        } catch _ {}
        
        do {
            try session.overrideOutputAudioPort(.speaker)
        } catch _ {}
    }
    
    func startAudio(path: String) {
        
        // activate our session before playing audio
        activateSession()
        
        // TODO: change the url to whatever audio you want to play
//        let url = URL(string: path)
        let url = Bundle.main.url(forResource: "speech", withExtension: ".mp3")
        print(url)
        let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
        if let player = player {
            player.replaceCurrentItem(with: playerItem)
        } else {
            player = AVPlayer(playerItem: playerItem)
        }
        
        if let player = player {
            print("ciao")
            player.play()
        }
    }
    
    func deactivateSession() {
            do {
                try session.setActive(false, options: .notifyOthersOnDeactivation)
            } catch let error as NSError {
                print("Failed to deactivate audio session: \(error.localizedDescription)")
            }
        }
    
}



func setBackground(imagePath: String) -> some View {
    ZStack {
        Image(uiImage: UIImage(contentsOfFile: imagePath) ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
    }
}




