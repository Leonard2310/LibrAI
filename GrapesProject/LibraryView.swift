//
//  LibraryView.swift
//  test
//
//  Created by Matteo Nasti on 07/03/24.
//

import SwiftUI


struct LibraryView: View {
    var Mydata = sharedData
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                    Text ("Your Books")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 11.0)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(Mydata.Books) {
                            
                            Book in
                            VStack{
                                Image (Book.cover)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    
                                Text (Book.title)
                                    .padding([.leading, .bottom])
                            }
                        }
                    }
                        
                    }
                    /*Text ("Least Read")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 10.0)
                     ScrollView(.horizontal, showsIndicators: false){
                     HStack{
                         ForEach(Mydata.Books) {
                             
                             Book in
                         ZStack{
                             //Image(Background della view)
                             Image (Book.lastBackground)
                                 .resizable()
                                 .aspectRatio(contentMode: .fit)
                             
                                 .clipShape(RoundedRectangle(cornerRadius: 20))
                                 .padding(.leading, 31.0)
                             HStack{
                                 Image(Book.cover)
                                 VStack{
                                     
                                 }
                             }
                             }
                         }
                     }
                }*/
            }
            .navigationTitle("Library")
        }
    }
}

#Preview {
    LibraryView()
}
