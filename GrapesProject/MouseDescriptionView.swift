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
                    .padding([.leading, .top])
                VStack(alignment: .leading, spacing: 10){
                    Text(mouse.mouseName)
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Text(mouse.mouseSubtitle)
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                }
                .padding(.trailing)
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("Description:")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Text(mouse.mouseDescription)
                    .font(.body)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
            }
            .padding([.leading, .trailing])
            Spacer()
        }
    }
}


#Preview {
    MouseDescriptionView(mouse: mouse(mouseName: "Dragon Mouse", mouseImage: "DragonMouse") )
}
