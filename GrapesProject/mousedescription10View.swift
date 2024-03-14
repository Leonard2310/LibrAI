//
//  mousedescription10View.swift
//  GrapesProject
//
//  Created by Alessandro Giuseppe Palmieri on 14/03/24.
//

import SwiftUI

struct mousedescription10View: View {
    var body: some View {
        
            HStack {
                Image("8")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                VStack{
                    Text("The Gryffindor Wizard Mouse")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("“Harry Potter’s Saga”")
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
                    Text("Congratulations you have finished reading “Harry Potter’s Saga”.")
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("Congratulations, valiant reader! You’ve embarked on an enchanting journey through all seven volumes of J.K. Rowling’s spellbinding saga. As you turn the final page of “Harry Potter and the Deathly Hallows,” a magical seal appears in your heart—a testament to your unwavering commitment to the wizarding realm.")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("The Gryffindor Mouse’s Achievement isn’t merely about reading ink on parchment; it’s about embracing wonder, forging friendships, and summoning courage. As Dumbledore sagely remarked, “Words are, in my not-so-humble opinion, our most inexhaustible source of magic.” So wear your invisible cloak with pride, dear reader, and may your adventures extend beyond the final chapter. 🌟✨")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("Note: This reward exists solely within the whimsical realms of imagination. 📜🔍🔮")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                }//MARK: End of VStack
        Spacer()
        
            }
        }

#Preview {
    mousedescription10View()
}
