//
//  mousedescription11View.swift
//  GrapesProject
//
//  Created by Alessandro Giuseppe Palmieri on 14/03/24.
//

import SwiftUI

struct mousedescription11View: View {
    var body: some View {
        
            HStack {
                Image("9")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                VStack{
                    Text("Star Wars Mouse")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("Challenge: read 10 books about aliens")
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
                    Text("Congratulations you have finished reading 10 books. This is Anakin Skycheese, our hooded mouse reader. ")
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("Why don't you read your next book together?")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                }//MARK: End of VStack
        Spacer()
        
            }
        }

#Preview {
    mousedescription11View()
}
