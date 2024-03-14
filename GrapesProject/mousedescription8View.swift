//
//  mousedescription8View.swift
//  GrapesProject
//
//  Created by Alessandro Giuseppe Palmieri on 14/03/24.
//

import SwiftUI

struct mousedescription8View: View {
    var body: some View {
        
            HStack {
                Image("6")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                VStack{
                    Text("The Victorian Jane Mouseten")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("“Lace and Lavender”")
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
                    Text("Congratulations you have finished reading “Lace and Lavender”.")
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("You’ve wandered through the gilded pages of history, the scent of lavender, the whisper of silk, and the dance of etiquette. As you close the book titled “Lace and Lavender,” a cameo brooch glimmers in your heart, a relic of elegance and hidden passions.")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("The Victorian Lady Mouse isn’t merely fur and whiskers; she embodies the grace of a thousand waltzes. Her gown, a cascade of ivory satin and lace, sweeps the polished parquet floor. Her eyes, as deep as the Thames at twilight, hold secrets whispered by quills and inkwells. She sips Earl Grey tea from a thimble-sized porcelain cup, her pinky extended just so. Her bonnet, adorned with silk roses, conceals dreams of clandestine meetings in gaslit gardens. So don your kid gloves, dear reader, and may your curtsies be as delicate as pressed flowers. 🌹🕯️")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("")
                    Text("Note: the Victorian Lady Mouse’s legacy flutters through the pages of lace-bound diaries, and her laughter echoes in the gilded mirrors of yesteryears. 🎩")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                }//MARK: End of VStack
        Spacer()
        
            }
        }

#Preview {
    mousedescription8View()
}

