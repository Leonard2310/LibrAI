//
//  LibraryView.swift
//  test
//
//  Created by Matteo Nasti on 07/03/24.
//

import SwiftUI

func runSearch(query: String) { //funzione inutile
    //@State var BookArray: [String] = TitleList()
    let Mydata = sharedData
    @State var FilteredBooks: [book] = []
    let filteredBooks = Mydata.Books.filter {
        book in
        return book.title.lowercased().contains(query.lowercased())
    }
    if filteredBooks.isEmpty {
        print("No books found for set query: \(query)")
    } else {
        print("Books found for '\(query)':")
        for book in filteredBooks {
            print("- \(book)")
        }
    }
}
    struct LibraryView: View {
        @State private var sheetvision = false
        @State var searchText = ""
        @State private var isSearching = false
        var Mydata = sharedData
        var body: some View {
            NavigationStack{
                VStack(alignment: .leading) {
                    NavigationLink(destination: AllBooksView()){
                        Text("Your Books")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        Label("", systemImage: "chevron.right")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        
                    }
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(Mydata.Books) {
                                Book in
                                VStack{
                                    NavigationLink(destination: ImmersiveReadingView()) {
                                        Image (Book.cover)
                                            .resizable()
                                        //.aspectRatio(contentMode: .fit)
                                            .frame(width: 115, height: 182)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }
                                    Text (Book.title)
                                        .font(.footnote)
                                    
                                }
                            }
                        }
                        
                    }
                    Text ("Least Read")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.leading)
                
                TabView{
                    ForEach(Mydata.Books) {
                        Book in
                        BookCardView(book: book(title: Book.title,cover: Book.cover,lastBackground: Book.lastBackground))
                    }
                    .padding(.bottom, 80.0)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .navigationTitle("Library")
            }
            .navigationTitle("Library")
            .searchable(text: $searchText, isPresented: $isSearching)
            .toolbar(content: {
                Button("Add", systemImage: "plus"){
                    sheetvision.toggle()
                }
                .sheet(isPresented: $sheetvision){
                    AddBookView()
                }
            }
            )
            /*var filteredBooks = BookArray.filter { String in
             return String.lowercased().contains(searchText)
             }*/
        }
    
}
#Preview {
    LibraryView()
}
