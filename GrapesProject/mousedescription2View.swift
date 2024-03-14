//
//  mousedescription2View.swift
//  GrapesProject
//
//  Created by Alessandro Giuseppe Palmieri on 14/03/24.
//

import SwiftUI

struct mousedescription2View: View {
    var body: some View {
        
            HStack {
                Image("challenge avventura")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                VStack{
                    Text("50 shades of flight")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("Challenge: read 5 adventure booksbooks")
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
                    Text("Congratulations you have finished reading 5 adventure books. My name is Phineas Mousy and I'd like having my next advenure with you. C'mon, it's time to live a new adventure.")
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    
                }//MARK: End of VStack
        Spacer()
        
            }
        }

#Preview {
    mousedescription2View()
}
