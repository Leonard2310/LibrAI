//
//  mousedescription6View.swift
//  GrapesProject
//
//  Created by Alessandro Giuseppe Palmieri on 14/03/24.
//

import SwiftUI

struct mousedescription6View: View {
    var body: some View {
        
            HStack {
                Image("4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                VStack{
                    Text("The Frodo Mouse:Lord of Cheddar Ring")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("“Lord of the Ring’s Saga”")
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
                        
                    Text("Congratulations you have finished reading the “Lord of the Ring’s Saga”.")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        
                    Text("")
                    Text("Gather your courage, little wanderer! You’ve traversed the ancient pages of J.R.R. Tolkien’s epic saga, the whispering winds of Rivendell, the shadowed paths of Mordor, and the indomitable spirit of the Ring-bearer. As you close “The Return of the King,” a star of Elendil blazes in your heart, a beacon of hope in Middle-earth’s darkest hours.")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("The Frodo Mouse’s Quest transcends mere parchment; it’s a miniature odyssey through peril and sacrifice. Our hobbit hero, clad in earth-toned attire, cradles a scaled-down Sting—the blade that glows blue in the presence of Orcs. His eyes, as deep as the Shire’s rolling hills, hold the weight of a thousand sunsets. So don your elven cloak, dear reader, and may your footsteps echo with the whispers of ancient trees and the promise of a new dawn. 🌄🌿")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("Note: Frodo Mouse’s journey is etched in the annals of Middle-earth, and his resilience echoes through the ages. 🌄")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                }//MARK: End of VStack
        Spacer()
        
            }
        }

#Preview {
    mousedescription6View()
}
