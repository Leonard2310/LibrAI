//
//  mousedescription5View.swift
//  GrapesProject
//
//  Created by Alessandro Giuseppe Palmieri on 14/03/24.
//

import SwiftUI

struct mousedescription5View: View {
    var body: some View {
        
            HStack {
                Image("3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                VStack{
                    Text("The Percy Mouse: Beyond the mousetrap")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("“Percy Jackson’s Saga”")
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
                    Text("Congratulations you have finished reading the “Percy Jackson’s Saga”.")
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("Brace yourself, intrepid seeker! You’ve navigated the treacherous waters of Rick Riordan’s epic tales, the thunderous clash of gods, the ripple of ancient prophecies, and the salty spray of adventure. As you close the final chapter of “The Last Olympian,” a celestial trident glimmers in your heart—a symbol of your unwavering loyalty to Camp Half-Blood.")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("The Percy Mouse’s Quest transcends mere ink and paper; it’s a voyage across mythic seas, where sea monsters lurk and gods play their cosmic chess. Percy, our demigod rodent, wields a miniature Riptide blade, its celestial bronze edge humming with power. His fur, as dark as the abyss, conceals secrets whispered by the waves themselves. So don your Camp Half-Blood T-shirt, dear reader, and may your dreams echo with the crash of surf and the laughter of gods. 🌊⚡")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("Note: Percy Mouse’s adventures are as boundless as the sea, and his courage rivals even the bravest demigods. 🌊")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    
                }//MARK: End of VStack
        Spacer()
        
            }
        }

#Preview {
    mousedescription5View()
}

