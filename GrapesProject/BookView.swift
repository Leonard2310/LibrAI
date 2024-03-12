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
                Image("bookBase")
                    .resizable()
                    .frame(width: 115, height: 182)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                Image(book.cover)
                    .resizable()
                    .frame(width: 115, height: 182)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
            }
            Text (book.title)
                .font(.footnote)
        }
        
    }
}

#Preview {
    BookView(book: book(title: "A Game of Thrones", cover: "GoT-I&F"))
}
