//
//  mousedescription3View.swift
//  GrapesProject
//
//  Created by Alessandro Giuseppe Palmieri on 14/03/24.
//

import SwiftUI

struct mousedescription3View: View {
    var body: some View {
        
            HStack {
                Image("1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                VStack{
                    Text("The Little Prince Mouse: the dreamy rodent and the rose")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("“The Little Prince”")
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
                    Text("Congratulations you have finished reading the book “The Little Prince”. ")
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("Prepare your miniature aviator’s cap, dear dreamer! You’ve soared through the celestial pages of Antoine de Saint-Exupéry’s enchanting tale, the echo of rose petals, the laughter of stars, and the poignant wisdom of a child’s heart. As you close the final chapter of “The Little Prince,” a golden comet ignites in your heart, a beacon of wonder that transcends galaxies.")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("The Little Prince Mouse’s Quest is not merely ink on parchment; it’s a cosmic odyssey of innocence and revelation. His eyes, wide as the Milky Way, hold secrets whispered by asteroids and meteor showers.He journeys from his asteroid home, B-612, across the constellations, meeting quirky characters along the way. Earth, with its bustling cities and perplexing grown-ups, beckons to him.So don your invisible cloak, dear reader, and may your dreams dance among shooting stars and rose-scented galaxies. 🌠🌹")
                    Text("")
                    Text("Note: the Little Prince Mouse’s legacy orbits eternity, and his laughter echoes across infinity. ")
                }//MARK: End of VStack
        Spacer()
        
            }
        }

#Preview {
    mousedescription3View()
}
