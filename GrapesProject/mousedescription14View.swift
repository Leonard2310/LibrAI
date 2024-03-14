//
//  mousedescription14View.swift
//  GrapesProject
//
//  Created by Alessandro Giuseppe Palmieri on 14/03/24.
//

import SwiftUI

struct mousedescription14View: View {
    var body: some View {
        
            HStack {
                Image("12")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                VStack{
                    Text("Giovanni the Bug Fixer Mouse")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("Challenge: Report a Bug")
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
                    Text("Congratulations you have just reported a bug. We already know we're not perfect, but we're trying to be.")
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                }//MARK: End of VStack
        Spacer()
        
            }
        }

#Preview {
    mousedescription14View()
}

