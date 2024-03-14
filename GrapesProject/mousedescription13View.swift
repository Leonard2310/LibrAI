//
//  mousedescription13View.swift
//  GrapesProject
//
//  Created by Alessandro Giuseppe Palmieri on 14/03/24.
//

import SwiftUI

struct mousedescription13View: View {
    var body: some View {
        
            HStack {
                Image("11")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                VStack{
                    Text("Alex the junior reader")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Text("Challenge: read 10 books")
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
                    Text("Congratulations you have finished reading 10 books. This is Alex, our red hair junior reader. ")
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
    mousedescription13View()
}

