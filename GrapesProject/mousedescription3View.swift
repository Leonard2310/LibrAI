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
                        .multilineTextAlignment(.leading)
                    Text("The Little Prince")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                }//MARK: End of VStack
            }//MARK: End of HStack
                VStack {
                    Text("Description:")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Text("Congratulations you have finished reading the book The Little Prince. ")
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("Prepare your miniature aviator’s cap, dear dreamer! You’ve soared through the celestial pages of Antoine de Saint-Exupéry’s enchanting tale, the echo of rose petals, the laughter of stars, and the poignant wisdom of a child’s heart. As you close the final chapter of “The Little Prince,” a golden comet ignites in your heart, a beacon of wonder that transcends galaxies.")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                }//MARK: End of VStack
        Spacer()
        
            }
        }

#Preview {
    mousedescription3View()
}
