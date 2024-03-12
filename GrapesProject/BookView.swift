//
//  BookView.swift
//  GrapesProject
//
//  Created by Chiara Cortese on 12/03/24.
//

import SwiftUI

struct BookView: View {
    
    var book: book
    
    var body: some View {
        VStack{
            ZStack {
               
                Image(book.cover)
                    .resizable()
                    .frame(width: 115, height: 182)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                Image("bookBase")
                    .resizable()
                    .frame(width: 220, height: 260)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                    .blendMode(/*@START_MENU_TOKEN@*/.plusDarker/*@END_MENU_TOKEN@*/)
            }
            Text (book.title)
                .font(.footnote)
        }
        
    }
}

#Preview {
    BookView(book: book(title: "The Little Prince", cover: "Little Prince"))
}
