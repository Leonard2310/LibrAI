//
//  mousedescription7View.swift
//  GrapesProject
//
//  Created by Alessandro Giuseppe Palmieri on 14/03/24.
//

import SwiftUI

struct mousedescription7View: View {
    var body: some View {
        
            HStack {
                Image("5")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                VStack{
                    Text("The Buccaneer Mouse: the Curse of the Blue Cheese")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("“The Corsair’s Code”")
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
                    Text("Congratulations you have finished reading “The Corsair’s Code”")
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("Avast, ye curious reader! You’ve sailed through the tattered pages of pirate lore—the creaking timbers, the scent of brine, and the glint of doubloons. As you close “The Corsair’s Code,” a jolly roger unfurls in your heart—a symbol of adventure and hidden treasures.")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("His fur, as weathered as old sails, conceals secrets whispered by the Kraken and the Trade Winds. His whiskers twitch with anticipation as he charts courses to forgotten islands, where X marks the spot and parrots squawk ancient riddles. So splice the mainbrace, dear reader, and may your compass always point toward adventure. 🌊🗺️")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("Note: the Buccaneer Mouse’s legacy sails beyond maps, and his laughter echoes across the Seven Seas. Yo-ho-ho! 🏴‍☠️")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                }//MARK: End of VStack
        Spacer()
        
            }
        }

#Preview {
    mousedescription7View()
}

