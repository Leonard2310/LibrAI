//
//  mousedescription4View.swift
//  GrapesProject
//
//  Created by Alessandro Giuseppe Palmieri on 14/03/24.
//

import SwiftUI

struct mousedescription4View: View {
    var body: some View {
        
            HStack {
                Image("2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                VStack{
                    Text("The Jon Snow Mouse: Guardian of the Wall")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("“A Game of Thrones”")
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
                    Text("Hark, noble mouse enthusiast! Behold the Jon Snow Mouse, a diminutive hero forged in the icy crucible of the Night’s Watch. Its fur, as dark as the northern night, conceals secrets and valor beyond measure.")
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("The Jon Snow Mouse, unlike ordinary rodents, dons its solemn cloak with pride. Perched atop the Wall, the last defense against encroaching shadows, it gazes through winter’s veil, vigilant for wildlings and ancient terrors. This tiny hero knows sacrifice: frost-nipped whiskers, weighty oaths, and icy winds. Yet, it stands unwavering, a steadfast guardian. When the Others stir beyond the Wall, the Jon Snow Mouse remains resolute. It dreams of direwolves, dragons, and the dance of honor and betrayal. In the grand tapestry of collectibles, the Jon Snow Mouse is a chapter etched in frost and fire. 🌬️🔥")
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("Note: Jon Snow Mouse’s legacy is etched in the annals of Westeros, and his choices echo across the frozen expanse of the Seven Kingdoms. ⚔️❄")
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                }//MARK: End of VStack
        Spacer()
        
            }
        }

#Preview {
    mousedescription4View()
}
