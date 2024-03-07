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
        VStack(alignment: .leading) {
                Text ("Your Books")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 10.0)
                ScrollView(.horizontal){
                    HStack{
                        ForEach(Mydata.Books) {
                            
                        Book in
                        VStack{
                            Image (Book.cover)
                            Text (Book.title)
                                .padding(.bottom)
                        }
                    }
                }
                /*       Text ("Least Read")
                ScrollView(.horizontal){
                    HStack{
                        ZStack{
                            HStack{
                                VStack{
                                    
                                }
                            }
                        }
                    }
                }*/
            }
        }
    }
}

#Preview {
    LibraryView()
}
