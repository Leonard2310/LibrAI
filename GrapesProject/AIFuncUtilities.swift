//
//  AIFuncUtilities.swift
//  GrapesProject
//
//  Created by Leonardo Catello on 12/03/24.
//

import Foundation
import OpenAI
import SwiftOpenAI

public let openAI = SwiftOpenAI(apiKey: "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")

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
            voice: .alloy, // Choose the voice type, here 'alloy'.
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
            } catch {
                // Handle any errors encountered while writing the audio file.
                print("Error saving Audio file: \(error)")
            }
        }
    } catch {
        // Handle any errors encountered during the audio creation process.
        print(error.localizedDescription)
    }
}



