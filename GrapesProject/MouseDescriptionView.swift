//
//  MouseDescriptionView.swift
//  GrapesProject
//
//  Created by Leonardo Catello on 14/03/24.
//

import SwiftUI

struct MouseDescriptionView: View {
    var mouse: mouse // Aggiungi questa riga

    var body: some View {
        VStack {
            HStack {
                Image(mouse.mouseImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                VStack{
                    Text(mouse.mouseName)
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text(mouse.mouseSubtitle)
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                }
            }
            VStack {
                Text("Description:")
                    .font(.body)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Text(mouse.mouseDescription)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
    }
}


#Preview {
    MouseDescriptionView(mouse: mouse(mouseName: "Dragon Mouse", mouseImage: "DragonMouse") )
}
