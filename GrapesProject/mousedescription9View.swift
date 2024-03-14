//
//  mousedescription9View.swift
//  GrapesProject
//
//  Created by Alessandro Giuseppe Palmieri on 14/03/24.
//

import SwiftUI

struct mousedescription9View: View {
    var body: some View {
        
            HStack {
                Image("7")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                VStack{
                    Text("The Wizard Mouse and the Grimoire")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("“Wizard’s Codex”")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                }//MARK: End of VStack
            }//MARK: End of HStack
                VStack {
                    Text("Description:")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Text("Congratulations you have finished reading “Wizard’s Codex”. ")
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("Gather your quill, curious reader! You’ve pored over the ancient pages of the “Wizard’s Codex”, its ink infused with moonlight, its margins adorned with arcane symbols. As you close the final chapter, a star-studded wand materializes in your heart, a conduit to realms beyond the mundane.")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("Our diminutive enchanter, clad in midnight-blue robes, wields a miniature wand, the Whisperwood Wand, its core humming with forgotten spells and moonlit secrets. His fur, as silver as moonbeams, conceals mysteries whispered by ancient sages and elemental spirits. His whiskers twitch with anticipation as he deciphers cryptic runes, brews potions in miniature cauldrons, and consults the Book of Starfall for celestial guidance. So don your pointed hat, dear reader, and may your incantations echo across time and space. 🌙📜.")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("Note: the Wizard Mouse’s legacy weaves through forgotten libraries, and his laughter echoes in the hallowed halls of wizardry. 🔮")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    
                }//MARK: End of VStack
        Spacer()
        
            }
        }

#Preview {
    mousedescription9View()
}

